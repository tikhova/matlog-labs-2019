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
  not  { TNot }
  or  { TOr }
  and  { TAnd }
  impl { TImpl }
  var  { TVar $$ }

%%

Expression:
  Disjunction                   { $1 }
  | Disjunction impl Expression  { impl $1 $3 }

Disjunction:
  Conjunction { $1 }
  | Disjunction or Conjunction  { or $1 $3}

Conjunction:
  Negation                      { $1 }
  | Conjunction and Negation    { and $1 $3 }

Negation:
  not Negation                  { not $2 }
  | var                         { var $1 }
  | '(' Expression ')'          { $2 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data BiFunction = or | and | impl |

instance Show Sign where
  show impl = "->"
  show or   = "|"
  show and  = "&"

data Expression = Sign Expression Expression
                  | not Expression
                  | var String

instance Show Expression where
  show (var str) = str
  show (not exp) = "(!" ++ (show exp) ++ ")"
  show (fun x y) = "(" ++ show fun ++ "," ++ show x ++ "," ++ show y ++ ")"
}
