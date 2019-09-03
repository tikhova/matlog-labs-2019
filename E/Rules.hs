module Rules where

import Synt
import Variables
import Prelude
import Data.Map.Strict as M

isAchievable :: Map Int Expression
               -> Map Expression Int
               -> Int
               -> Bool
isAchievable m2expr m2num k = case m2expr ! k of
 Wrap Impl a b -> M.member a m2num
 otherwise -> False


isMP :: Expression
        -> Map Int Expression
        -> Map Expression Int
        -> Map Expression [Int]
        -> Bool
isMP expr m2expr m2num forMP = case forMP !? expr of
 Just list -> or $ Prelude.map (isAchievable m2expr m2num) list
 Nothing   -> False

isAnyRule :: Expression
         -> Map Expression Int
         -> Bool
isAnyRule expr m2num = case expr of
    (Wrap Impl phi (Quant Any x psi)) -> do
      if (M.member (Wrap Impl phi psi) m2num)
        then not $ hasFreeOccurence x phi
        else False
    otherwise -> False

isExistsRule :: Expression
         -> Map Expression Int
         -> Bool
isExistsRule expr m2num = case expr of
    (Wrap Impl (Quant Exists x psi) phi) -> do
      if (M.member (Wrap Impl psi phi) m2num)
        then not $ hasFreeOccurence x phi
        else False
    otherwise -> False
