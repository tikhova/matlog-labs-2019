module Variables where

import Synt
import Data.Maybe
import Prelude
import Data.Map.Strict as M
import Data.List               (elemIndex)

getBusyVars :: Expression -> [String]
getBusyVars expr = case expr of
  Wrap _ a b -> (getBusyVars a) ++ (getBusyVars b)
  Not a -> (getBusyVars a)
  Exists x a -> x : (getBusyVars a)
  Any x a -> x : (getBusyVars a)
  otherwise -> []

getAllVars :: Expression -> [String]
getAllVars expr = case expr of
  Wrap _ a b      -> (getAllVars a) ++ (getAllVars b)
  Not a           -> (getAllVars a)
  Exists x a      -> x : (getAllVars a)
  Any x a         -> x : (getAllVars a)
  Predicate _ ts  -> concat $ Prelude.map getAllVarsT ts

getAllVarsT :: Term -> [String]
getAllVarsT term = case term of
  WrapT _ a b   -> (getAllVarsT a) ++ (getAllVarsT b)
  Function _ ts -> concat $ Prelude.map getAllVarsT ts
  Increment a   -> getAllVarsT a
  Var x         -> [x]
  otherwise     -> []

getFreeVars :: Expression -> [String]
getFreeVars expr = Prelude.filter (flip notElem (getBusyVars expr)) (getAllVars expr)

hasFreeOccurence :: String -> Expression -> Bool
hasFreeOccurence x expr = case expr of
  Wrap _ a b     -> (hasFreeOccurence x a) || (hasFreeOccurence x b)
  Not a          -> (hasFreeOccurence x a)
  Exists x' a
    | x' == x    -> False
    | otherwise  -> (hasFreeOccurence x a)
  Any x' a
    | x' == x    -> False
    | otherwise  -> (hasFreeOccurence x a)
  Predicate _ ts -> or $ Prelude.map (hasFreeOccurenceT x) ts

hasFreeOccurenceT :: String -> Term -> Bool
hasFreeOccurenceT x term = case term of
  WrapT _ a b   -> (hasFreeOccurenceT x a) || (hasFreeOccurenceT x b)
  Function _ ts -> or $ Prelude.map (hasFreeOccurenceT x) ts
  Increment a   -> (hasFreeOccurenceT x a)
  Var x'        -> x == x
  otherwise     -> False

free4Substitution :: Term -> Term -> Expression -> Bool
free4Substitution x xSub expr
  | x == xSub = True
  | otherwise = case expr of
    Wrap _ a b  -> (free4Substitution x xSub a) && (free4Substitution x xSub b)
    Not a       -> free4Substitution x xSub a
    Exists x' a -> if elem x' present
                    then (noOccurence x a)
                    else free4Substitution x xSub a
    Any x' a     -> if elem x' present
                    then (noOccurence x a)
                    else free4Substitution x xSub a
    Predicate _ _ -> True
    where present = getAllVarsT xSub

noOccurence :: Term -> Expression -> Bool
noOccurence x expr = case expr of
  Wrap _ a b     -> (noOccurence x a) && (noOccurence x b)
  Not a          -> noOccurence x a
  Exists x' a    -> noOccurence x a
  Any x' a       -> noOccurence x a
  Predicate _ ts -> and $ Prelude.map (noOccurenceT x) ts

noOccurenceT :: Term -> Term -> Bool
noOccurenceT x term = case term of
  WrapT _ a b            -> (noOccurenceT x a) && (noOccurenceT x b)
  Function _ ts          -> and $ Prelude.map (noOccurenceT x) ts
  Increment a            -> noOccurenceT x a
  Var var | x == Var var -> False
  otherwise              -> True
