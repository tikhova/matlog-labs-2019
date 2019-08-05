module Axioms where

import Synt
import Data.Maybe

axiomIndex :: Expression -> Maybe Int
axiomIndex expr =
  case expr of
    -- 1
    (Wrap Impl a (Wrap Impl b a'))
      | (a == a') -> Just 1
    -- 2
    (Wrap Impl
      (Wrap Impl a b)
      (Wrap Impl
        (Wrap Impl a' (Wrap Impl b' c))
        (Wrap Impl a'' c')))
          | (a == a' && a' == a'') && (b == b') && (c == c') -> Just 2
    -- 3
    (Wrap Impl
      a
      (Wrap Impl b (Wrap And a' b')))
        | (a == a') && (b == b') -> Just 3
    -- 4 & 5
    (Wrap Impl (Wrap And a b) c)
      | (a == c) -> Just 4
      | (b == c) -> Just 5
    -- 6 & 7
    (Wrap Impl a (Wrap Or b c))
      | (a == b) -> Just 6
      | (a == c) -> Just 7
    -- 8
    (Wrap Impl (Wrap Impl a b)
      (Wrap Impl
        (Wrap Impl c b')
        (Wrap Impl (Wrap Or a' c') b'')))
          | (a == a') && (b == b' && b' == b'') && (c == c') -> Just 8
    -- 9
    (Wrap Impl
      (Wrap Impl a b)
      (Wrap Impl (Wrap Impl a' (Not b')) (Not a'')))
        | (a == a' && a' == a'') && (b == b') -> Just 9
    -- 10
    (Wrap Impl (Not (Not a)) a')
      | (a == a') -> Just 10
    _ -> Nothing
