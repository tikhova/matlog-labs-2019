module Test where

import  Lex
import  Synt
import  Axioms
import  ModusPonens
import  Annotation
import  Data.Map.Strict as M
import  Control.Monad
import  System.IO               (isEOF)
import  Prelude
import  Data.List               (elemIndex)
import  Data.List.Split         (splitOn)
import  Data.Maybe
import  Data.Text               (unpack)

readLines ::  Int
  -> Map Int Expression
  -> Map Expression Int
  -> [String]
  -> [Annotation]
  -> [Expression]
  -> IO ( Int,
          Map Int Expression,
          Map Expression Int,
          [String],
          [Annotation] )
readLines n m2expr m2num list a hyps = do
  eof <- isEOF
  if eof
    then return (n - 1, m2expr, m2num, list, a)
    else do
      line <- getLine
      let expr = parse $ alexScanTokens line
      let annotation = annotateLine n m2expr m2num a hyps
      case annotation of
        Just x -> do
          if (M.lookup expr m2num == Nothing)
            then readLines (n + 1)
                                  (M.insert n expr m2expr)
                                  (M.insert expr n m2num)
                                  (list ++ [line])
                                  (a ++ [x])
                                  hyps
            else readLines n m2expr m2num list a hyps
        Nothing -> readLines n m2expr m2num list a hyps


annotateLine :: Int
  -> Map Int Expression
  -> Map Expression Int
  -> [Annotation]
  -> [Expression]
  -> Maybe Annotation
annotateLine n m2expr m2num a hyps
  | n <= size m2expr = do
    let line = m2expr ! n
    let hyp = elemIndex line hyps
    case hyp of
      Just h -> Just (Hypothesis h)
      Nothing -> do
        let axiom = axiomIndex line
        case axiom of
          Just a -> Just (Axiom a)
          Nothing -> do
            let mp = mpIndexes a m2num m2expr n
            case mp of
              Just m -> Just (ModusPonens m)
              Nothing -> Nothing
  | otherwise = Nothing

main = do
  firstLine <- getLine
  let split   = splitOn "|-" firstLine
  let hasHyps = length split > 1
  let hyps    = if ((hasHyps == False) || (split !! 0 == ""))
                  then []
                  else Prelude.map parse (Prelude.map  alexScanTokens (splitOn "," (split !! 0)))
  (n, m2expr, m2num, list, a) <- readLines 1 M.empty M.empty [] [] hyps
  putStrLn firstLine
  mapM_ putStrLn list


  main = do
    firstLine <- getLine
    let split   = splitOn "|-" firstLine
    let hasHyps = length split > 1
    let hyps    = if (!hasHyps || split fst == "")
                    then []
                    else Prelude.map parse $ alexScanTokens (splitOn "," (fst split)))
    let final   = if (hasHyps)
                    then parse split snd
                    else parse split fst
    (n, m2expr, m2num, list, a) <- readLines 1 M.empty M.empty
    if (n == 0 || final /= (M.lookup (n - 1) m2expr))
      then putStrLn "Proof is incorrect"
      else
        let used = getUsed (n - 1) a [n]
