module Main where

import Lex
import Synt
import Axioms
import Rules
import Variables
import Data.Map.Strict as M
import System.IO               (isEOF)
import Prelude

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
          checkProof (insert num expr m2expr)
                     (insert expr num m2num)
                     hyps
                     (case expr of
                       Wrap Impl a b -> insertWith (++) b [num] forMP
                       otherwise     -> forMP)
                     (proven || (expr == final), num + 1) final
        else return (proven, num)

check :: Expression
         -> Map Int Expression
         -> Map Expression Int
         -> [Expression]
         -> Map Expression [Int]
         -> Bool
check expr m2expr m2num hyps forMP = hyp || axiom || mp || isAny || isExists
    where
      hyp = elem expr hyps
      axiom = isAxiom expr
      mp = isMP expr m2expr m2num forMP
      isAny = isAnyRule expr m2num
      isExists = isExistsRule expr m2num



main = do
  firstLine <- getLine
  let (hyps, expr) = parseHeader $ alexScanTokens firstLine
  result <- checkProof M.empty M.empty hyps M.empty (False, 1) expr
  case result of
    (True, 0) -> putStrLn "Proof is correct"
    (False, 0) -> putStrLn "Required hasn’t been proven"
    (_, n) -> putStrLn $ "Line #" ++ show n ++ " can’t be obtained"
