module Main where

import  Lex
import  Synt
import  Axioms
import  Annotation
import  Format
import  Data.Map.Strict as M
import  System.IO               (isEOF)
import  Prelude
import  Data.List               (elemIndex)
import  Data.List.Split         (splitOn)
import  Data.Maybe

readLines ::  Int
              -> Map Int Expression
              -> Map Expression Int
              -> Map Int Annotation
              -> [Expression]
              -> Map Expression [Int]
              -> Expression
              -> Expression
              -> IO ( Int, Map Int Expression, Map Int Annotation, Expression )
readLines n m2expr m2num a hyps pos lst final = do
  eof <- isEOF
  if eof
    then return (n, m2expr, a, lst)
    else do
      line <- getLine
      let expr = parse $ alexScanTokens line
      if (M.member expr m2num || M.member final m2num)
        then readLines n m2expr m2num a hyps pos expr final
        else do
          let annotation = annotateLine m2expr m2num hyps expr pos
          case annotation of
            Just x  -> readLines (n + 1)
                               (insert (n + 1) expr m2expr)
                               (insert expr (n + 1) m2num)
                               (insert (n + 1) x a)
                               hyps
                               (case expr of
                                 Wrap Impl a b -> insertWith (++) b [n + 1] pos
                                 otherwise     -> pos)
                               expr
                               final
            Nothing -> return (n, m2expr, a, lst)


annotateLine :: Map Int Expression
                -> Map Expression Int
                -> [Expression]
                -> Expression
                -> Map Expression [Int]
                -> Maybe Annotation
annotateLine m2expr m2num hyps line pos = do
    let hyp = elemIndex line hyps
    case hyp of
      Just h -> Just (Hypothesis (h + 1))
      Nothing -> do
        let axiom = axiomIndex line
        case axiom of
          Just a -> Just (Axiom a)
          Nothing -> do
            let mp = mpIndexes m2expr m2num line pos
            case mp of
              Just m -> Just (ModusPonens m)
              Nothing -> Nothing
  where
    mpIndexes m2expr m2num expr pos = case pos !? expr of
      Just list -> listToMaybe $ catMaybes $ Prelude.map (findIndexes m2expr m2num) list
      Nothing   -> Nothing
    findIndexes m2expr m2num k = case m2expr ! k of
      Wrap Impl a b -> case m2num !? a of
        Just i -> Just (k, i)
        Nothing -> Nothing
      otherwise -> Nothing

main = do
  firstLine <- getLine
  let split   = splitOn "|-" firstLine
  let hasHyps = length split > 1
  let hyps    = if ((hasHyps == False) || (split !! 0 == ""))
                  then []
                  else Prelude.map parse (Prelude.map  alexScanTokens (splitOn "," (split !! 0)))
  let expr    = if (hasHyps == True)
                  then parse $ alexScanTokens (split !! 1)
                  else parse $ alexScanTokens (split !! 0)
  (n, exps, a, lst) <- readLines 0 M.empty M.empty M.empty hyps M.empty expr expr
  if (n == 0 || lst /= expr)
    then putStrLn "Proof is incorrect"
    else do
      case a ! n of
        Hypothesis x -> putStrLn "Proof is incorrect"
        otherwise -> do
          let used = getUsed n a $ singleton n True
          putStrLn firstLine
          getProof 1 1 exps a used M.empty n
