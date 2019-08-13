module Format where

import Annotation
import Data.Maybe
import Synt
import Prelude
import Data.Map.Strict as M
import Data.List               (elemIndex)

getIndexesMP :: Annotation -> (Int, Int)
getIndexesMP a = case a of
    ModusPonens x -> x
    otherwise -> (0, 0)

getUsed :: Int -> Map Int Annotation ->  Map Int Bool -> Map Int Bool
getUsed current a u
  | current > 0 = do
    case u !? current of
      Just True -> do
        let p = getIndexesMP $ a ! current
        getUsed (current - 1) a (insert (snd p) True (insert (fst p) True u))
      otherwise -> getUsed (current - 1) a u
  | otherwise = u

getProof :: Int
            -> Int
            -> Map Int Expression
            -> Map Int Annotation
            -> Map Int Bool
            -> Map Int Int
            -> Int
            -> IO ()
getProof current n exps a u realIndexes limit
  | n > limit = return ()
  | otherwise = do
    case u !? n of
      Just True -> do
        let annotation = case a ! n of
              ModusPonens (x, y) -> (ModusPonens (realIndexes ! x, realIndexes ! y))
              otherwise -> a ! n
        putStrLn $ "[" ++ show current ++ ". " ++ show annotation ++ "] " ++ show (exps ! n)
        getProof (current + 1) (n + 1) exps a u (insert n current realIndexes) limit
      otherwise -> getProof current (n + 1) exps a u realIndexes limit
