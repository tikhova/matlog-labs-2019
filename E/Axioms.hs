module Axioms where

import Synt
import Data.Maybe

isAxiom :: Expression -> Bool
isAxiom expr =
  case expr of
    -- Standard
    -- 1
    (Wrap Impl a (Wrap Impl b a'))
      | (a == a') -> True
    -- 2
    (Wrap Impl
      (Wrap Impl a b)
      (Wrap Impl
        (Wrap Impl a' (Wrap Impl b' c))
        (Wrap Impl a'' c')))
          | (a == a' && a' == a'') && (b == b') && (c == c') -> True
    -- 3
    (Wrap Impl
      a
      (Wrap Impl b (Wrap And a' b')))
        | (a == a') && (b == b') -> True
    -- 4 & 5
    (Wrap Impl (Wrap And a b) c)
      | (a == c) -> True
      | (b == c) -> True
    -- 6 & 7
    (Wrap Impl a (Wrap Or b c))
      | (a == b) -> True
      | (a == c) -> True
    -- 8
    (Wrap Impl (Wrap Impl a b)
      (Wrap Impl
        (Wrap Impl c b')
        (Wrap Impl (Wrap Or a' c') b'')))
          | (a == a') && (b == b' && b' == b'') && (c == c') -> True
    -- 9
    (Wrap Impl
      (Wrap Impl a b)
      (Wrap Impl (Wrap Impl a' (Not b')) (Not a'')))
        | (a == a' && a' == a'') && (b == b') -> True
    -- 10
    (Wrap Impl (Not (Not a)) a')
      | (a == a') -> True
    -- Peano
    -- 1
    (Wrap Impl (Predicate "=" [a, b]) (Predicate "=" [(Function "++" [a']), (Function "++" [b'])]))
      | (a == a') && (b == b') -> True
    -- 2
    (Wrap Impl (Predicate "=" [a, b]) (Wrap Impl (Predicate "=" [a', c]) (Predicate "=" [b', c'])))
      | (a == a') && (b == b') && (c == c') -> True
    -- 3
    (Wrap Impl (Predicate "=" [(Function "++" [a]), (Function "++" [b])]) (Predicate "=" [a', b']))
      | (a == a') && (b == b') -> True
    -- 4
    (Not (Predicate "=" [(Function "++" [Var a]), Zero])) -> True
    -- 5
    (Predicate "=" [(WrapT Add a (Function "++" [b])), (Function "++" [WrapT Add a' b'])])
      | (a == a') && (b == b') -> True
    -- 6
    (Predicate "=" [(WrapT Add a Zero), a'])
      | (a == a') -> True
    -- 7
    (Predicate "=" [(WrapT Mul a Zero), Zero]) -> True
    -- 8
    (Predicate "=" [(WrapT Mul a (Function "++" [b])), (WrapT Add (WrapT Mul a' b') a'')])
      | (a == a' && a' == a'') && (b == b') -> True
    -- 9
    (Wrap Impl (Wrap And a (Any x (Wrap Impl a' a''))) a''')
      | (a' == a''') && ((substitute x Zero a') == a) &&
       ((substitute x (Function "++" [Var x])  a') == a') -> True
    otherwise -> False

substitute :: String -> Term -> Expression -> Expression
substitute from to expr = case expr of
  Wrap sign a b -> Wrap sign (substitute from to a) (substitute from to b)
  Not a -> Not (substitute from to a)
  Any x a
    | x == from -> Any x a
    | otherwise -> Any x (substitute from to a)
  Exists x a
    | x == from -> Exists x a
    | otherwise -> Exists x (substitute from to a)
  Predicate str terms -> Predicate str (Prelude.map (substituteT from to) terms)

substituteT :: String -> Term -> Term -> Term
substituteT from to term = case term of
  WrapT op a b -> WrapT op (substituteT from to a) (substituteT from to b)
  Function str terms -> Function str (Prelude.map (substituteT from to) terms)
  Var x
    | x == from -> to
    | otherwise -> Var x
  otherwise -> term
