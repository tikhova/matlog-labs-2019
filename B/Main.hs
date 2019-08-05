module Main where

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
  putStrLn $ show n
  eof <- isEOF
  if eof
    then return (n - 1, m2expr, m2num, list, a)
    else do
      line <- getLine
      let expr = parse $ alexScanTokens line
      let annotation = annotateLine n m2expr m2num a hyps expr
      case annotation of
        Just x -> do
          putStrLn $ show x
          case (M.lookup expr m2num) of
            Nothing ->  readLines (n + 1)
                           (M.insert n expr m2expr)
                           (M.insert expr n m2num)
                           (list ++ [line])
                           (a ++ [x])
                           hyps
            otherwise -> readLines n m2expr m2num list a hyps
        Nothing -> readLines n m2expr m2num list a hyps


annotateLine :: Int
  -> Map Int Expression
  -> Map Expression Int
  -> [Annotation]
  -> [Expression]
  -> Expression
  -> Maybe Annotation
annotateLine n m2expr m2num a hyps line = do
    let hyp = elemIndex line hyps
    case hyp of
      Just h -> Just (Hypothesis (h + 1))
      Nothing -> do
        let axiom = axiomIndex line
        case axiom of
          Just a -> Just (Axiom a)
          Nothing -> do
            let mp = mpIndexes a m2num m2expr line
            case mp of
              Just m -> Just (ModusPonens m)
              Nothing -> Nothing

main = do
  firstLine <- getLine
  let split   = splitOn "|-" firstLine
  let hasHyps = length split > 1
  let hyps    = if ((hasHyps == False) || (split !! 0 == ""))
                  then []
                  else Prelude.map parse (Prelude.map  alexScanTokens (splitOn "," (split !! 0)))
  (n, m2expr, m2num, list, a) <- readLines 1 M.empty M.empty [] [] hyps
  putStrLn firstLine
  putStrLn "Solution:"
  mapM_ putStrLn list
  putStrLn "END"
