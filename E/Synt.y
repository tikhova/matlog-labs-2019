{
module Synt where
import Lex
}

%name parseHeader Header
%name parseExpression Expression
%tokentype { Token }
%error { parseError }

%token
  '('       { TLBracket }
  ')'       { TRBracket }
  ','       { TComma }
  '.'       { TDot }
  Not       { TNot }
  Or        { TOr }
  And       { TAnd }
  Impl      { TImpl }
  Var       { TVar $$ }
  Plus      { TPlus }
  Multiply  { TMul }
  Increment { TIncr }
  Exists    { TExists }
  Any       { TAny }
  Pred      { TPredicate $$ }
  '='       { TEq }
  '0'       { TZero }
  '|-'      { TTur }

  %left     Mul
  %left     Add
  %right    Impl
  %left     Or
  %left     And
%%

Header:
  '|-' Expression                     { ([], $2) }
  | Expressions '|-' Expression       { ($1, $3) }

Expressions:
  Expression                          { [$1] }
  | Expression ',' Expressions        { $1 : $3 }

Expression:
  Disjunction                         { $1 }
  | Disjunction Impl Expression       { Wrap Impl $1 $3 }

Disjunction:
  Conjunction                         { $1 }
  | Disjunction Or Conjunction        { Wrap Or $1 $3}

Conjunction:
  Unary                               { $1 }
  | Conjunction And Unary             { Wrap And $1 $3 }

Unary:
  Predicate                           { $1 }
  | Not Unary                         { Not $2 }
  | '(' Expression ')'                { $2 }
  | Any Var '.' Expression            { Quant Any $2 $4 }
  | Exists Var '.' Expression         { Quant Exists $2 $4 }

Predicate:
  Pred                                { Predicate $1 [] }
  | Pred '(' Terms ')'                { Predicate $1 $3 }
  | Term '=' Term                     { Predicate "=" [$1, $3] }

Terms:
  Term                                { [$1] }
  | Term ',' Terms                    { $1 : $3 }

Term:
  Summand                             { $1 }
  | Term Plus Summand                 { WrapT Add $1 $3 }

Summand:
  Multiplied                          { $1 }
  | Summand Multiply Multiplied       { WrapT Mul $1 $3}

Multiplied:
  Var '(' Terms ')'                   { Function $1 $3 }
  | Var                               { Var $1 }
  | '(' Term ')'                      { $2 }
  | '0'                               { Zero }
  | Multiplied Increment              { Function "++" [$1] }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"

data Sign = Or
            | And
            | Impl
            deriving (Eq, Ord, Show)

data Operation = Add | Mul deriving (Eq, Ord, Show)

data Quantifier = Any | Exists deriving (Eq, Ord, Show)

data Expression = Wrap Sign Expression Expression
                  | Not Expression
                  | Quant Quantifier String Expression
                  | Predicate String [Term]
                  deriving (Eq, Ord, Show)

data Term = WrapT Operation Term Term
            | Function String [Term]
            | Increment Term
            | Var String
            | Zero
            deriving (Eq, Ord, Show)
}
