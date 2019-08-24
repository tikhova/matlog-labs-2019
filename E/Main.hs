module Main where

import  Lex
import  Synt
import  Axioms
import  Rules
import  Data.Map.Strict as M
import  System.IO               (isEOF)
import  Prelude
import  Data.List               (elemIndex)
import  Data.List.Split         (splitOn)
import  Data.Maybe

checkProof :: Map Int Expression
              -> Map Expression Int
              -> [Expression]
              -> Map Expression [Int]
              -> (Bool, Int)
              -> Expression
              -> IO (Bool, Int)
checkProof m2expr m2num hyps forMP (proven, num) final = do
  eof <- isEOF
  if eof
    then return (proven, 0)
    else do
        line <- getLine
        let expr = parseExpression $ alexScanTokens line
        let correct = check expr m2expr m2num hyps forMP
        if correct
          then
            checkProof m2expr m2num hyps forMP (proven && (expr == final), num + 1) final
          else
            return (proven, num)

check :: Expression
         -> Map Int Expression
         -> Map Expression Int
         -> [Expression]
         -> Map Expression [Int]
         -> Bool
check expr m2expr m2num hyps forMP = hyp || axiom || mp || isAny || isExists
    where
      hyp = case elemIndex expr hyps of
        Just h -> True
        Nothing -> False
      axiom = isAxiom expr
      mp = isMP expr m2expr m2num forMP
      isAny = isAnyRule expr m2num
      isExists = isExistsRule expr m2num

main = do
  firstLine <- getLine
  let (hyps, expr)   = parseHeader $ alexScanTokens firstLine
  result <- checkProof M.empty M.empty hyps M.empty (False, 1) expr
  case result of
    (True, 0) -> putStrLn "Proof is correct"
    (False, 0) -> putStrLn "Required hasn’t been proven"
    (_, n) -> putStrLn $ "Line #" ++ show n ++ " can’t be obtained"
