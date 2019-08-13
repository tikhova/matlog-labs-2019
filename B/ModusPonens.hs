module ModusPonens where

import Synt
import Data.Maybe
import Annotation
import Prelude
import Data.Map.Strict as M
import Data.List               (elemIndex)

getImpl :: Expression -> Expression -> Expression
getImpl b a = (Wrap Impl a b)

findIndexes :: [Expression]
               -> Map Expression Int
               -> Int
               -> Maybe (Int, Int)
findIndexes exps m2num k = case exps !! k of
  Wrap Impl a b -> case m2num !? a of
    Just i -> Just (k + 1, i + 1)
    Nothing -> Nothing
  otherwise -> Nothing


mpIndexes :: [Expression]
             -> Map Expression Int
             -> Expression
             -> Map Expression [Int]
             -> Maybe (Int, Int)
