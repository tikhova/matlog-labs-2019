module Annotation where

data Annotation = Axiom Int
                  | Hypothesis Int
                  | ModusPonens (Int, Int)

instance Show Annotation where
  show (Axiom x)            = "Ax. sch. " ++ show x
  show (Hypothesis x)       = "Hypothesis " ++ show x
  show (ModusPonens (x, y)) = "M.P. " ++ show x ++ ", " ++ show y
