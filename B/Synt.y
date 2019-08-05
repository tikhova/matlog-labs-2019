{
module Synt where
import Lex
}

%name parse
%tokentype { Token }
%error { parseError }

%token
  '('  { TLBracket }
  ')'  { TRBracket }
  Not  { TNot }
  Or   { TOr }
  And  { TAnd }
  Impl { TImpl }
  Var  { TVar $$ }

%%

Expression:
  Disjunction                    { $1 }
  | Disjunction Impl Expression  { Wrap Impl $1 $3 }

Disjunction:
  Conjunction { $1 }
  | Disjunction Or Conjunction  { Wrap Or $1 $3}

Conjunction:
  Negation                      { $1 }
  | Conjunction And Negation    { Wrap And $1 $3 }

Negation:
  Not Negation                  { Not $2 }
  | Var                         { Var $1 }
  | '(' Expression ')'          { $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Sign = Or
            | And
            | Impl
            deriving (Eq, Ord)

instance Show Sign where
  show Impl = "->"
  show Or   = "|"
  show And  = "&"

data Expression = Wrap Sign Expression Expression
                  | Not Expression
                  | Var String
                  deriving (Eq, Ord)

instance Show Expression where
  show (Var str) = str
  show (Not exp) = "(!" ++ (show exp) ++ ")"
  show (Wrap x y z) = "(" ++ show x ++ "," ++ show y ++ "," ++ show z ++ ")"
}
