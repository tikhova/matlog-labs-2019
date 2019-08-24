module Rules where

import Synt
import Data.Maybe
import Prelude
import Data.Map.Strict as M
import Data.List               (elemIndex)

findIndexes :: Map Int Expression
               -> Map Expression Int
               -> Int
               -> Bool
findIndexes m2expr m2num k = case m2expr ! k of
 Wrap Impl a b -> case m2num !? a of
   Just i  -> True
   Nothing -> False
 otherwise -> False


isMP :: Expression
        -> Map Int Expression
        -> Map Expression Int
        -> Map Expression [Int]
        -> Bool
isMP expr m2expr m2num forMP = case forMP !? expr of
 Just list -> or $ Prelude.map (findIndexes m2expr m2num) list
 Nothing   -> False

isAnyRule :: Expression
         -> Map Expression Int
         -> Bool
isAnyRule expr m2num = do
  case expr of
    (Wrap Impl phi (Any x psi)) -> do
      let index = m2num !? (Wrap Impl phi psi)
      case index of
        Nothing -> False
        otherwise -> do
          let busyVars = getBusyVars phi
          case elemIndex x busyVars of
            Just _ -> True
            otherwise -> False
    otherwise -> False

isExistsRule :: Expression
         -> Map Expression Int
         -> Bool
isExistsRule expr m2num = do
  case expr of
    (Wrap Impl (Exists x psi) phi) -> do
      let index = m2num !? (Wrap Impl psi phi)
      case index of
        Nothing -> False
        otherwise -> do
          let busyVars = getBusyVars phi
          case elemIndex x busyVars of
            Just _ -> True
            otherwise -> False
    otherwise -> False

getBusyVars :: Expression -> [String]
getBusyVars expr = case expr of
  Wrap _ a b -> (getBusyVars a) ++ (getBusyVars b)
  Not a -> (getBusyVars a)
  Exists x a -> x : (getBusyVars a)
  Any x a -> x : (getBusyVars a)
  otherwise -> []
