module Format where

import Annotation
import Data.Maybe
import Synt
import Prelude
import Data.Map.Strict as M

getIndexesMP :: Annotation -> Maybe (Int, Int)
getIndexesMP a =
  case a of
    (ModusPonens x) -> x
    _ -> Nothing


getUsed :: Int -> [Annotation] -> [Int] -> [Int]
getUsed current a u
  | current > 0 = do
    let p = getIndexesMP a !! current
    if ((elemIndex current u) /= Nothing && p /= Nothing)
      then return getUsed (current - 1) a (u ++ (fst p) ++ (snd p))
      else return getUsed (current - 1) a u
  | otherwise = u

getProof :: Int
            -> Int
            -> Map Int Expression
            -> Map Expression Int
            -> [String]
            -> [Annotation]
            -> [Bool]
            -> [String]
            -> [Int]
            -> [String]
getProof current n m2expr m2num list a u result realIndexes
  | n <= size m2expr = do
    if used
      then do
        let annotation = case annotation of
                        (ModusPonens (x, y)) -> (ModusPonens (realIndex x, realIndex y))
                        _ -> annotation
        let result = result ++ ("[" ++ show current ++ ". " ++ show annotation ++ "] " ++ line)
        return getProof (current + 1) (n + 1) m2expr m2num list a u result (realIndexes ++ current)
      else
        return getProof current (n + 1) m2expr m2num list a u result (readIndexes ++ (-1))
          --fixMP     a  =
  | otherwise = return result
    where
      expr         = m2expr !! n
      notDublicate = (m2num !! expr) == n
      annotation   = a !! n
      used         = (elemIndex n u) /= Nothing
      line         = list !! n
      realIndex x  = realIndexes ! (x - 1)
