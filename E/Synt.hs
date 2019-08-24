{-# OPTIONS_GHC -w #-}
module Synt where
import Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,179) ([0,2,8,17424,172,0,8192,16384,45328,2,0,0,0,0,0,0,0,0,0,0,0,0,16512,0,8192,0,0,8,2048,22050,0,50241,10,32,0,0,16,0,512,0,64,0,0,0,0,0,0,8712,86,2048,0,0,2,0,4,0,4096,0,0,2,0,2050,16,0,0,4096,0,0,2050,4,0,0,1024,8208,32768,512,4,16400,128,33280,5512,16384,45328,2,8712,86,0,0,0,0,0,1024,0,0,0,0,128,0,2050,16,0,4,0,256,0,0,0,0,0,2048,0,0,1032,0,17424,172,33280,5512,16384,256,2,8712,86,0,4096,8192,22664,1,0,0,256,0,0,0,0,0,0,64,513,0,0,0,2050,0,0,0,8192,0,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseHeader","%start_parseExpression","Header","Expressions","Expression","Disjunction","Conjunction","Unary","Predicate","Terms","Term","Summand","Multiplied","'('","')'","'['","']'","','","'.'","Not","Or","And","Impl","Var","Plus","Multiply","Increment","Exists","Any","Break","Pred","'='","'0'","'|-'","%eof"]
        bit_start = st * 37
        bit_end = (st + 1) * 37
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..36]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (18) = happyShift action_20
action_0 (36) = happyShift action_3
action_0 (5) = happyGoto action_19
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_12
action_1 (22) = happyShift action_13
action_1 (26) = happyShift action_14
action_1 (30) = happyShift action_15
action_1 (31) = happyShift action_16
action_1 (33) = happyShift action_17
action_1 (35) = happyShift action_18
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (9) = happyGoto action_6
action_1 (10) = happyGoto action_7
action_1 (11) = happyGoto action_8
action_1 (13) = happyGoto action_9
action_1 (14) = happyGoto action_10
action_1 (15) = happyGoto action_11
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (36) = happyShift action_3
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (16) = happyShift action_12
action_3 (22) = happyShift action_13
action_3 (26) = happyShift action_14
action_3 (30) = happyShift action_15
action_3 (31) = happyShift action_16
action_3 (33) = happyShift action_17
action_3 (35) = happyShift action_18
action_3 (7) = happyGoto action_37
action_3 (8) = happyGoto action_5
action_3 (9) = happyGoto action_6
action_3 (10) = happyGoto action_7
action_3 (11) = happyGoto action_8
action_3 (13) = happyGoto action_9
action_3 (14) = happyGoto action_10
action_3 (15) = happyGoto action_11
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (37) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (23) = happyShift action_35
action_5 (25) = happyShift action_36
action_5 _ = happyReduce_6

action_6 (24) = happyShift action_34
action_6 _ = happyReduce_8

action_7 _ = happyReduce_10

action_8 _ = happyReduce_12

action_9 (27) = happyShift action_32
action_9 (34) = happyShift action_33
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (28) = happyShift action_31
action_10 _ = happyReduce_22

action_11 (29) = happyShift action_30
action_11 _ = happyReduce_24

action_12 (16) = happyShift action_12
action_12 (22) = happyShift action_13
action_12 (26) = happyShift action_14
action_12 (30) = happyShift action_15
action_12 (31) = happyShift action_16
action_12 (33) = happyShift action_17
action_12 (35) = happyShift action_18
action_12 (7) = happyGoto action_28
action_12 (8) = happyGoto action_5
action_12 (9) = happyGoto action_6
action_12 (10) = happyGoto action_7
action_12 (11) = happyGoto action_8
action_12 (13) = happyGoto action_29
action_12 (14) = happyGoto action_10
action_12 (15) = happyGoto action_11
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (16) = happyShift action_12
action_13 (22) = happyShift action_13
action_13 (26) = happyShift action_14
action_13 (30) = happyShift action_15
action_13 (31) = happyShift action_16
action_13 (33) = happyShift action_17
action_13 (35) = happyShift action_18
action_13 (10) = happyGoto action_27
action_13 (11) = happyGoto action_8
action_13 (13) = happyGoto action_9
action_13 (14) = happyGoto action_10
action_13 (15) = happyGoto action_11
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (16) = happyShift action_26
action_14 _ = happyReduce_27

action_15 (26) = happyShift action_25
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (26) = happyShift action_24
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (18) = happyShift action_23
action_17 _ = happyReduce_17

action_18 _ = happyReduce_29

action_19 (37) = happyAccept
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (16) = happyShift action_12
action_20 (22) = happyShift action_13
action_20 (26) = happyShift action_14
action_20 (30) = happyShift action_15
action_20 (31) = happyShift action_16
action_20 (33) = happyShift action_17
action_20 (35) = happyShift action_18
action_20 (6) = happyGoto action_21
action_20 (7) = happyGoto action_22
action_20 (8) = happyGoto action_5
action_20 (9) = happyGoto action_6
action_20 (10) = happyGoto action_7
action_20 (11) = happyGoto action_8
action_20 (13) = happyGoto action_9
action_20 (14) = happyGoto action_10
action_20 (15) = happyGoto action_11
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (19) = happyShift action_53
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (20) = happyShift action_52
action_22 _ = happyReduce_4

action_23 (16) = happyShift action_51
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (21) = happyShift action_50
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (21) = happyShift action_49
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (16) = happyShift action_42
action_26 (26) = happyShift action_14
action_26 (35) = happyShift action_18
action_26 (12) = happyGoto action_47
action_26 (13) = happyGoto action_48
action_26 (14) = happyGoto action_10
action_26 (15) = happyGoto action_11
action_26 _ = happyFail (happyExpListPerState 26)

action_27 _ = happyReduce_13

action_28 (17) = happyShift action_46
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (17) = happyShift action_45
action_29 (27) = happyShift action_32
action_29 (34) = happyShift action_33
action_29 _ = happyFail (happyExpListPerState 29)

action_30 _ = happyReduce_30

action_31 (16) = happyShift action_42
action_31 (26) = happyShift action_14
action_31 (35) = happyShift action_18
action_31 (15) = happyGoto action_44
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (16) = happyShift action_42
action_32 (26) = happyShift action_14
action_32 (35) = happyShift action_18
action_32 (14) = happyGoto action_43
action_32 (15) = happyGoto action_11
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (16) = happyShift action_42
action_33 (26) = happyShift action_14
action_33 (35) = happyShift action_18
action_33 (13) = happyGoto action_41
action_33 (14) = happyGoto action_10
action_33 (15) = happyGoto action_11
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (16) = happyShift action_12
action_34 (22) = happyShift action_13
action_34 (26) = happyShift action_14
action_34 (30) = happyShift action_15
action_34 (31) = happyShift action_16
action_34 (33) = happyShift action_17
action_34 (35) = happyShift action_18
action_34 (10) = happyGoto action_40
action_34 (11) = happyGoto action_8
action_34 (13) = happyGoto action_9
action_34 (14) = happyGoto action_10
action_34 (15) = happyGoto action_11
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (16) = happyShift action_12
action_35 (22) = happyShift action_13
action_35 (26) = happyShift action_14
action_35 (30) = happyShift action_15
action_35 (31) = happyShift action_16
action_35 (33) = happyShift action_17
action_35 (35) = happyShift action_18
action_35 (9) = happyGoto action_39
action_35 (10) = happyGoto action_7
action_35 (11) = happyGoto action_8
action_35 (13) = happyGoto action_9
action_35 (14) = happyGoto action_10
action_35 (15) = happyGoto action_11
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (16) = happyShift action_12
action_36 (22) = happyShift action_13
action_36 (26) = happyShift action_14
action_36 (30) = happyShift action_15
action_36 (31) = happyShift action_16
action_36 (33) = happyShift action_17
action_36 (35) = happyShift action_18
action_36 (7) = happyGoto action_38
action_36 (8) = happyGoto action_5
action_36 (9) = happyGoto action_6
action_36 (10) = happyGoto action_7
action_36 (11) = happyGoto action_8
action_36 (13) = happyGoto action_9
action_36 (14) = happyGoto action_10
action_36 (15) = happyGoto action_11
action_36 _ = happyFail (happyExpListPerState 36)

action_37 _ = happyReduce_2

action_38 _ = happyReduce_7

action_39 (24) = happyShift action_34
action_39 _ = happyReduce_9

action_40 _ = happyReduce_11

action_41 (27) = happyShift action_32
action_41 _ = happyReduce_19

action_42 (16) = happyShift action_42
action_42 (26) = happyShift action_14
action_42 (35) = happyShift action_18
action_42 (13) = happyGoto action_61
action_42 (14) = happyGoto action_10
action_42 (15) = happyGoto action_11
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (28) = happyShift action_31
action_43 _ = happyReduce_23

action_44 (29) = happyShift action_30
action_44 _ = happyReduce_25

action_45 _ = happyReduce_28

action_46 _ = happyReduce_14

action_47 (17) = happyShift action_60
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (20) = happyShift action_59
action_48 (27) = happyShift action_32
action_48 _ = happyReduce_20

action_49 (16) = happyShift action_12
action_49 (22) = happyShift action_13
action_49 (26) = happyShift action_14
action_49 (30) = happyShift action_15
action_49 (31) = happyShift action_16
action_49 (33) = happyShift action_17
action_49 (35) = happyShift action_18
action_49 (7) = happyGoto action_58
action_49 (8) = happyGoto action_5
action_49 (9) = happyGoto action_6
action_49 (10) = happyGoto action_7
action_49 (11) = happyGoto action_8
action_49 (13) = happyGoto action_9
action_49 (14) = happyGoto action_10
action_49 (15) = happyGoto action_11
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (16) = happyShift action_12
action_50 (22) = happyShift action_13
action_50 (26) = happyShift action_14
action_50 (30) = happyShift action_15
action_50 (31) = happyShift action_16
action_50 (33) = happyShift action_17
action_50 (35) = happyShift action_18
action_50 (7) = happyGoto action_57
action_50 (8) = happyGoto action_5
action_50 (9) = happyGoto action_6
action_50 (10) = happyGoto action_7
action_50 (11) = happyGoto action_8
action_50 (13) = happyGoto action_9
action_50 (14) = happyGoto action_10
action_50 (15) = happyGoto action_11
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (16) = happyShift action_42
action_51 (26) = happyShift action_14
action_51 (35) = happyShift action_18
action_51 (12) = happyGoto action_56
action_51 (13) = happyGoto action_48
action_51 (14) = happyGoto action_10
action_51 (15) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (16) = happyShift action_12
action_52 (22) = happyShift action_13
action_52 (26) = happyShift action_14
action_52 (30) = happyShift action_15
action_52 (31) = happyShift action_16
action_52 (33) = happyShift action_17
action_52 (35) = happyShift action_18
action_52 (6) = happyGoto action_55
action_52 (7) = happyGoto action_22
action_52 (8) = happyGoto action_5
action_52 (9) = happyGoto action_6
action_52 (10) = happyGoto action_7
action_52 (11) = happyGoto action_8
action_52 (13) = happyGoto action_9
action_52 (14) = happyGoto action_10
action_52 (15) = happyGoto action_11
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (36) = happyShift action_54
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (16) = happyShift action_12
action_54 (22) = happyShift action_13
action_54 (26) = happyShift action_14
action_54 (30) = happyShift action_15
action_54 (31) = happyShift action_16
action_54 (33) = happyShift action_17
action_54 (35) = happyShift action_18
action_54 (7) = happyGoto action_64
action_54 (8) = happyGoto action_5
action_54 (9) = happyGoto action_6
action_54 (10) = happyGoto action_7
action_54 (11) = happyGoto action_8
action_54 (13) = happyGoto action_9
action_54 (14) = happyGoto action_10
action_54 (15) = happyGoto action_11
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_5

action_56 (17) = happyShift action_63
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_15

action_58 _ = happyReduce_16

action_59 (16) = happyShift action_42
action_59 (26) = happyShift action_14
action_59 (35) = happyShift action_18
action_59 (12) = happyGoto action_62
action_59 (13) = happyGoto action_48
action_59 (14) = happyGoto action_10
action_59 (15) = happyGoto action_11
action_59 _ = happyFail (happyExpListPerState 59)

action_60 _ = happyReduce_26

action_61 (17) = happyShift action_45
action_61 (27) = happyShift action_32
action_61 _ = happyFail (happyExpListPerState 61)

action_62 _ = happyReduce_21

action_63 (19) = happyShift action_65
action_63 _ = happyFail (happyExpListPerState 63)

action_64 _ = happyReduce_3

action_65 _ = happyReduce_18

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (([], happy_var_2)
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 5 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn7  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 ((happy_var_2, happy_var_5)
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_1  6 happyReduction_4
happyReduction_4 (HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 ([happy_var_1]
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_3  6 happyReduction_5
happyReduction_5 (HappyAbsSyn6  happy_var_3)
	_
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn6
		 (happy_var_1 : happy_var_3
	)
happyReduction_5 _ _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (happy_var_1
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_3  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (Wrap Impl happy_var_1 happy_var_3
	)
happyReduction_7 _ _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_1  8 happyReduction_8
happyReduction_8 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_1
	)
happyReduction_8 _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_3  8 happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Wrap Or happy_var_1 happy_var_3
	)
happyReduction_9 _ _ _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_1  9 happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (happy_var_1
	)
happyReduction_10 _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  9 happyReduction_11
happyReduction_11 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Wrap And happy_var_1 happy_var_3
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  10 happyReduction_12
happyReduction_12 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  10 happyReduction_13
happyReduction_13 (HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (Not happy_var_2
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  10 happyReduction_14
happyReduction_14 _
	(HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn10
		 (happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4 10 happyReduction_15
happyReduction_15 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Any happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 10 happyReduction_16
happyReduction_16 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Exists happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 (HappyTerminal (TPredicate happy_var_1))
	 =  HappyAbsSyn11
		 (Predicate happy_var_1 []
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 6 11 happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TPredicate happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Predicate happy_var_1 happy_var_4
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_3  11 happyReduction_19
happyReduction_19 (HappyAbsSyn13  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn11
		 (Predicate "=" [happy_var_1, happy_var_3]
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_1  12 happyReduction_20
happyReduction_20 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 ([happy_var_1]
	)
happyReduction_20 _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1 : happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_1  13 happyReduction_22
happyReduction_22 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_22 _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  13 happyReduction_23
happyReduction_23 (HappyAbsSyn14  happy_var_3)
	_
	(HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn13
		 (WrapT Add happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  14 happyReduction_24
happyReduction_24 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  14 happyReduction_25
happyReduction_25 (HappyAbsSyn15  happy_var_3)
	_
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (WrapT Mul happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happyReduce 4 15 happyReduction_26
happyReduction_26 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn15
		 (Function happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_27 = happySpecReduce_1  15 happyReduction_27
happyReduction_27 (HappyTerminal (TVar happy_var_1))
	 =  HappyAbsSyn15
		 (Var happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  15 happyReduction_28
happyReduction_28 _
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 _
	 =  HappyAbsSyn15
		 (Zero
	)

happyReduce_30 = happySpecReduce_2  15 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn15
		 (Function "++" [happy_var_1]
	)
happyReduction_30 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 37 37 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLBracket -> cont 16;
	TRBracket -> cont 17;
	TLSBracket -> cont 18;
	TRSBracket -> cont 19;
	TComma -> cont 20;
	TDot -> cont 21;
	TNot -> cont 22;
	TOr -> cont 23;
	TAnd -> cont 24;
	TImpl -> cont 25;
	TVar happy_dollar_dollar -> cont 26;
	TPlus -> cont 27;
	TMul -> cont 28;
	TIncr -> cont 29;
	TExists -> cont 30;
	TAny -> cont 31;
	TBreak -> cont 32;
	TPredicate happy_dollar_dollar -> cont 33;
	TEq -> cont 34;
	TZero -> cont 35;
	TTur -> cont 36;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 37 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseHeader tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn5 z -> happyReturn z; _other -> notHappyAtAll })

parseExpression tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_1 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError _ = error "Parse error"

data Sign = Or
            | And
            | Impl
            deriving (Eq, Ord)

data Operation = Add | Mul deriving (Eq, Ord)

data Expression = Wrap Sign Expression Expression
                  | Not Expression
                  | Any String Expression
                  | Exists String Expression
                  | Predicate String [Term]
                  deriving (Eq, Ord)

data Term = WrapT Operation Term Term
            | Function String [Term]
            | Increment Term
            | Var String
            | Zero
            deriving (Eq, Ord)
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}







# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc-8.6.5/include/ghcversion.h" #-}















{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc668_0/ghc_2.h" #-}
































































































































































































{-# LINE 7 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
