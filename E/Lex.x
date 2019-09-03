{
module Lex where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-z]
$Alpha = [A-Z]

tokens :-

  $white+ ;
  \n      { \s -> TBreak}
  \,      { \s -> TComma}
  \.      { \s -> TDot }
  \(      { \s -> TLBracket }
  \)      { \s -> TRBracket }
  \[      { \s -> TLSBracket }
  \]      { \s -> TRSBracket }
  \!      { \s -> TNot }
  \|      { \s -> TOr }
  \&      { \s -> TAnd }
  \+      { \s -> TPlus }
  \*      { \s -> TMul }
  \'      { \s -> TIncr }
  \@      { \s -> TAny }
  \?      { \s -> TExists }
  "->"    { \s -> TImpl }
  "0"     { \s -> TZero }
  \=      { \s -> TEq }
  "|-"    { \s -> TTur }
  $alpha [$digit]* { \s -> TVar s }
  $Alpha [$digit]* { \s -> TPredicate s}

{
data Token = TBreak      |
             TComma      |
             TDot        |
             TLBracket   |
             TRBracket   |
             TLSBracket  |
             TRSBracket  |
             TNot        |
             TOr         |
             TAnd        |
             TPlus       |
             TMul        |
             TIncr       |
             TAny        |
             TExists     |
             TImpl       |
             TZero       |
             TEq         |
             TTur        |
             TVar String |
             TPredicate String
             deriving (Eq, Show)
}
