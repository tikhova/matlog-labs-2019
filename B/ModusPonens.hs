module ModusPonens where

import Synt
import Data.Maybe
import Annotation
import Prelude
import Data.Map.Strict as M

isImpl :: Expression -> Bool
isImpl expr =
  case expr of
    (Wrap Impl a b) -> True
    _ -> False

getImpl :: Expression -> Expression -> Expression
getImpl b a = (Wrap Impl a b)

findIndexes :: [Annotation]
               -> Map Int Expression
               -> Map Expression Int
               -> (Expression -> Expression)
               -> Int
               -> Maybe (Int, Int)
findIndexes a m2expr m2num templ n
  | n <= (size m2expr) = do
    let line = m2expr ! n
    let impl = templ line
    let ind = m2num !? impl
    case ind of
     Nothing -> findIndexes a m2expr m2num templ (n + 1)
     Just i -> Just (n, i)
  | otherwise = Nothing


mpIndexes :: [Annotation]
             -> Map Expression Int
             -> Map Int Expression
             -> Expression
             -> Maybe (Int, Int)
mpIndexes a m2num m2expr expr = do
  let templ = getImpl expr
  findIndexes a m2expr m2num templ 1
