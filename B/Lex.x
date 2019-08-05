{
module Lex where
}

%wrapper "basic"

$digit = 0-9
$alpha = [A-Z]

tokens :-

  $white+ ;
  \(      { \s -> TLBracket }
  \)      { \s -> TRBracket}
  \!      { \s -> TNot }
  \|      { \s -> TOr }
  \&      { \s -> TAnd }
  "->"    { \s -> TImpl }
  $alpha [$alpha $digit \' \’]* { \s -> TVar s }

{
data Token = TLBracket | TRBracket | TNot | TOr | TAnd | TImpl | TVar String deriving (Eq, Show)
}
