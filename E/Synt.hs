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
happyExpList = Happy_Data_Array.listArray (0,177) ([32768,47240,1,57890,2,0,16,8736,46,0,0,0,0,0,0,0,0,0,0,0,1024,1,8192,0,0,1,34944,184,8704,738,2048,0,0,32,0,128,0,2,0,0,0,0,0,0,256,2048,0,34816,2952,8192,11810,32768,32896,0,16,0,64,0,8224,32,0,0,1024,0,4096,1040,0,0,32768,32896,0,514,2,2056,8,8736,46,34944,184,8704,738,0,0,0,0,0,32,0,0,0,4096,0,8224,32,0,2,0,16,0,0,0,0,0,1,0,1032,0,34952,11,8736,46,256,0,0,0,0,0,0,0,0,0,0,0,0,2056,8,0,0,256,1,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseHeader","%start_parseExpression","Header","Expressions","Expression","Disjunction","Conjunction","Unary","Predicate","Terms","Term","Summand","Multiplied","'('","')'","','","'.'","Not","Or","And","Impl","Var","Plus","Multiply","Increment","Exists","Any","Pred","'='","'0'","'|-'","%eof"]
        bit_start = st * 34
        bit_end = (st + 1) * 34
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..33]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (16) = happyShift action_12
action_0 (20) = happyShift action_13
action_0 (24) = happyShift action_14
action_0 (28) = happyShift action_15
action_0 (29) = happyShift action_16
action_0 (30) = happyShift action_17
action_0 (32) = happyShift action_18
action_0 (33) = happyShift action_3
action_0 (5) = happyGoto action_19
action_0 (6) = happyGoto action_20
action_0 (7) = happyGoto action_21
action_0 (8) = happyGoto action_5
action_0 (9) = happyGoto action_6
action_0 (10) = happyGoto action_7
action_0 (11) = happyGoto action_8
action_0 (13) = happyGoto action_9
action_0 (14) = happyGoto action_10
action_0 (15) = happyGoto action_11
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_12
action_1 (20) = happyShift action_13
action_1 (24) = happyShift action_14
action_1 (28) = happyShift action_15
action_1 (29) = happyShift action_16
action_1 (30) = happyShift action_17
action_1 (32) = happyShift action_18
action_1 (7) = happyGoto action_4
action_1 (8) = happyGoto action_5
action_1 (9) = happyGoto action_6
action_1 (10) = happyGoto action_7
action_1 (11) = happyGoto action_8
action_1 (13) = happyGoto action_9
action_1 (14) = happyGoto action_10
action_1 (15) = happyGoto action_11
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (33) = happyShift action_3
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (16) = happyShift action_12
action_3 (20) = happyShift action_13
action_3 (24) = happyShift action_14
action_3 (28) = happyShift action_15
action_3 (29) = happyShift action_16
action_3 (30) = happyShift action_17
action_3 (32) = happyShift action_18
action_3 (7) = happyGoto action_38
action_3 (8) = happyGoto action_5
action_3 (9) = happyGoto action_6
action_3 (10) = happyGoto action_7
action_3 (11) = happyGoto action_8
action_3 (13) = happyGoto action_9
action_3 (14) = happyGoto action_10
action_3 (15) = happyGoto action_11
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (34) = happyAccept
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (21) = happyShift action_36
action_5 (23) = happyShift action_37
action_5 _ = happyReduce_6

action_6 (22) = happyShift action_35
action_6 _ = happyReduce_8

action_7 _ = happyReduce_10

action_8 _ = happyReduce_12

action_9 (25) = happyShift action_33
action_9 (31) = happyShift action_34
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (26) = happyShift action_32
action_10 _ = happyReduce_22

action_11 (27) = happyShift action_31
action_11 _ = happyReduce_24

action_12 (16) = happyShift action_12
action_12 (20) = happyShift action_13
action_12 (24) = happyShift action_14
action_12 (28) = happyShift action_15
action_12 (29) = happyShift action_16
action_12 (30) = happyShift action_17
action_12 (32) = happyShift action_18
action_12 (7) = happyGoto action_29
action_12 (8) = happyGoto action_5
action_12 (9) = happyGoto action_6
action_12 (10) = happyGoto action_7
action_12 (11) = happyGoto action_8
action_12 (13) = happyGoto action_30
action_12 (14) = happyGoto action_10
action_12 (15) = happyGoto action_11
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (16) = happyShift action_12
action_13 (20) = happyShift action_13
action_13 (24) = happyShift action_14
action_13 (28) = happyShift action_15
action_13 (29) = happyShift action_16
action_13 (30) = happyShift action_17
action_13 (32) = happyShift action_18
action_13 (10) = happyGoto action_28
action_13 (11) = happyGoto action_8
action_13 (13) = happyGoto action_9
action_13 (14) = happyGoto action_10
action_13 (15) = happyGoto action_11
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (16) = happyShift action_27
action_14 _ = happyReduce_27

action_15 (24) = happyShift action_26
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (24) = happyShift action_25
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (16) = happyShift action_24
action_17 _ = happyReduce_17

action_18 _ = happyReduce_29

action_19 (34) = happyAccept
action_19 _ = happyFail (happyExpListPerState 19)

action_20 (33) = happyShift action_23
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (18) = happyShift action_22
action_21 _ = happyReduce_4

action_22 (16) = happyShift action_12
action_22 (20) = happyShift action_13
action_22 (24) = happyShift action_14
action_22 (28) = happyShift action_15
action_22 (29) = happyShift action_16
action_22 (30) = happyShift action_17
action_22 (32) = happyShift action_18
action_22 (6) = happyGoto action_54
action_22 (7) = happyGoto action_21
action_22 (8) = happyGoto action_5
action_22 (9) = happyGoto action_6
action_22 (10) = happyGoto action_7
action_22 (11) = happyGoto action_8
action_22 (13) = happyGoto action_9
action_22 (14) = happyGoto action_10
action_22 (15) = happyGoto action_11
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (16) = happyShift action_12
action_23 (20) = happyShift action_13
action_23 (24) = happyShift action_14
action_23 (28) = happyShift action_15
action_23 (29) = happyShift action_16
action_23 (30) = happyShift action_17
action_23 (32) = happyShift action_18
action_23 (7) = happyGoto action_53
action_23 (8) = happyGoto action_5
action_23 (9) = happyGoto action_6
action_23 (10) = happyGoto action_7
action_23 (11) = happyGoto action_8
action_23 (13) = happyGoto action_9
action_23 (14) = happyGoto action_10
action_23 (15) = happyGoto action_11
action_23 _ = happyFail (happyExpListPerState 23)

action_24 (16) = happyShift action_43
action_24 (24) = happyShift action_14
action_24 (32) = happyShift action_18
action_24 (12) = happyGoto action_52
action_24 (13) = happyGoto action_49
action_24 (14) = happyGoto action_10
action_24 (15) = happyGoto action_11
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (19) = happyShift action_51
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (19) = happyShift action_50
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (16) = happyShift action_43
action_27 (24) = happyShift action_14
action_27 (32) = happyShift action_18
action_27 (12) = happyGoto action_48
action_27 (13) = happyGoto action_49
action_27 (14) = happyGoto action_10
action_27 (15) = happyGoto action_11
action_27 _ = happyFail (happyExpListPerState 27)

action_28 _ = happyReduce_13

action_29 (17) = happyShift action_47
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (17) = happyShift action_46
action_30 (25) = happyShift action_33
action_30 (31) = happyShift action_34
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_30

action_32 (16) = happyShift action_43
action_32 (24) = happyShift action_14
action_32 (32) = happyShift action_18
action_32 (15) = happyGoto action_45
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (16) = happyShift action_43
action_33 (24) = happyShift action_14
action_33 (32) = happyShift action_18
action_33 (14) = happyGoto action_44
action_33 (15) = happyGoto action_11
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (16) = happyShift action_43
action_34 (24) = happyShift action_14
action_34 (32) = happyShift action_18
action_34 (13) = happyGoto action_42
action_34 (14) = happyGoto action_10
action_34 (15) = happyGoto action_11
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (16) = happyShift action_12
action_35 (20) = happyShift action_13
action_35 (24) = happyShift action_14
action_35 (28) = happyShift action_15
action_35 (29) = happyShift action_16
action_35 (30) = happyShift action_17
action_35 (32) = happyShift action_18
action_35 (10) = happyGoto action_41
action_35 (11) = happyGoto action_8
action_35 (13) = happyGoto action_9
action_35 (14) = happyGoto action_10
action_35 (15) = happyGoto action_11
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (16) = happyShift action_12
action_36 (20) = happyShift action_13
action_36 (24) = happyShift action_14
action_36 (28) = happyShift action_15
action_36 (29) = happyShift action_16
action_36 (30) = happyShift action_17
action_36 (32) = happyShift action_18
action_36 (9) = happyGoto action_40
action_36 (10) = happyGoto action_7
action_36 (11) = happyGoto action_8
action_36 (13) = happyGoto action_9
action_36 (14) = happyGoto action_10
action_36 (15) = happyGoto action_11
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (16) = happyShift action_12
action_37 (20) = happyShift action_13
action_37 (24) = happyShift action_14
action_37 (28) = happyShift action_15
action_37 (29) = happyShift action_16
action_37 (30) = happyShift action_17
action_37 (32) = happyShift action_18
action_37 (7) = happyGoto action_39
action_37 (8) = happyGoto action_5
action_37 (9) = happyGoto action_6
action_37 (10) = happyGoto action_7
action_37 (11) = happyGoto action_8
action_37 (13) = happyGoto action_9
action_37 (14) = happyGoto action_10
action_37 (15) = happyGoto action_11
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_2

action_39 _ = happyReduce_7

action_40 (22) = happyShift action_35
action_40 _ = happyReduce_9

action_41 _ = happyReduce_11

action_42 (25) = happyShift action_33
action_42 _ = happyReduce_19

action_43 (16) = happyShift action_43
action_43 (24) = happyShift action_14
action_43 (32) = happyShift action_18
action_43 (13) = happyGoto action_60
action_43 (14) = happyGoto action_10
action_43 (15) = happyGoto action_11
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (26) = happyShift action_32
action_44 _ = happyReduce_23

action_45 (27) = happyShift action_31
action_45 _ = happyReduce_25

action_46 _ = happyReduce_28

action_47 _ = happyReduce_14

action_48 (17) = happyShift action_59
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (18) = happyShift action_58
action_49 (25) = happyShift action_33
action_49 _ = happyReduce_20

action_50 (16) = happyShift action_12
action_50 (20) = happyShift action_13
action_50 (24) = happyShift action_14
action_50 (28) = happyShift action_15
action_50 (29) = happyShift action_16
action_50 (30) = happyShift action_17
action_50 (32) = happyShift action_18
action_50 (7) = happyGoto action_57
action_50 (8) = happyGoto action_5
action_50 (9) = happyGoto action_6
action_50 (10) = happyGoto action_7
action_50 (11) = happyGoto action_8
action_50 (13) = happyGoto action_9
action_50 (14) = happyGoto action_10
action_50 (15) = happyGoto action_11
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (16) = happyShift action_12
action_51 (20) = happyShift action_13
action_51 (24) = happyShift action_14
action_51 (28) = happyShift action_15
action_51 (29) = happyShift action_16
action_51 (30) = happyShift action_17
action_51 (32) = happyShift action_18
action_51 (7) = happyGoto action_56
action_51 (8) = happyGoto action_5
action_51 (9) = happyGoto action_6
action_51 (10) = happyGoto action_7
action_51 (11) = happyGoto action_8
action_51 (13) = happyGoto action_9
action_51 (14) = happyGoto action_10
action_51 (15) = happyGoto action_11
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (17) = happyShift action_55
action_52 _ = happyFail (happyExpListPerState 52)

action_53 _ = happyReduce_3

action_54 _ = happyReduce_5

action_55 _ = happyReduce_18

action_56 _ = happyReduce_15

action_57 _ = happyReduce_16

action_58 (16) = happyShift action_43
action_58 (24) = happyShift action_14
action_58 (32) = happyShift action_18
action_58 (12) = happyGoto action_61
action_58 (13) = happyGoto action_49
action_58 (14) = happyGoto action_10
action_58 (15) = happyGoto action_11
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_26

action_60 (17) = happyShift action_46
action_60 (25) = happyShift action_33
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_21

happyReduce_2 = happySpecReduce_2  5 happyReduction_2
happyReduction_2 (HappyAbsSyn7  happy_var_2)
	_
	 =  HappyAbsSyn5
		 (([], happy_var_2)
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_3  5 happyReduction_3
happyReduction_3 (HappyAbsSyn7  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ((happy_var_1, happy_var_3)
	)
happyReduction_3 _ _ _  = notHappyAtAll 

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
		 (Quant Any happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_16 = happyReduce 4 10 happyReduction_16
happyReduction_16 ((HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TVar happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn10
		 (Quant Exists happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_17 = happySpecReduce_1  11 happyReduction_17
happyReduction_17 (HappyTerminal (TPredicate happy_var_1))
	 =  HappyAbsSyn11
		 (Predicate happy_var_1 []
	)
happyReduction_17 _  = notHappyAtAll 

happyReduce_18 = happyReduce 4 11 happyReduction_18
happyReduction_18 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TPredicate happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (Predicate happy_var_1 happy_var_3
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
	action 34 34 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TLBracket -> cont 16;
	TRBracket -> cont 17;
	TComma -> cont 18;
	TDot -> cont 19;
	TNot -> cont 20;
	TOr -> cont 21;
	TAnd -> cont 22;
	TImpl -> cont 23;
	TVar happy_dollar_dollar -> cont 24;
	TPlus -> cont 25;
	TMul -> cont 26;
	TIncr -> cont 27;
	TExists -> cont 28;
	TAny -> cont 29;
	TPredicate happy_dollar_dollar -> cont 30;
	TEq -> cont 31;
	TZero -> cont 32;
	TTur -> cont 33;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 34 tk tks = happyError' (tks, explist)
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
