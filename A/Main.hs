module Main where

import Lex
import Synt

main = do
  inputString <- getLine
  putStrLn $ show $ parse $ alexScanTokens inputString
  putStrLn ""
