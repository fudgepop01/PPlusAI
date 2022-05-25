#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal var22 19
if var20 >= 0 && var20 < 38
GotoByValue var20
Goto __ANGLE_FIX__
else
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
SetVarByNum STACK_POP -1
var23 = -1
endif
if !(True)
// jab123
label jab123
var22 = STACK_POP
SetVarByNum STACK_POP 4.1
SetVarByNum STACK_POP -3.32
SetVarByNum STACK_POP 9.08
SetVarByNum STACK_POP 7.6
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 50
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 4 20 50 OWeight 0
Return
// jab123_strong
label jab123_strong
var22 = STACK_POP
SetVarByNum STACK_POP 14.09
SetVarByNum STACK_POP 2.16
SetVarByNum STACK_POP 7.06
SetVarByNum STACK_POP 10.97
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 60
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 6 30 60 OWeight 0
Return
// dashattack
label dashattack
var22 = STACK_POP
SetVarByNum STACK_POP 28.59
SetVarByNum STACK_POP 1.12
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 6.62
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 55
STACK_PUSH var22 0
var22 = 110
CalcKnockback var23 ODamage 11 70 55 OWeight 0
Return
// dashattack_mid
label dashattack_mid
var22 = STACK_POP
SetVarByNum STACK_POP 24.83
SetVarByNum STACK_POP -2.58
SetVarByNum STACK_POP 6.05
SetVarByNum STACK_POP 5.68
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 60
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 9 35 60 OWeight 0
Return
// dashattack_strong
label dashattack_strong
var22 = STACK_POP
SetVarByNum STACK_POP 38.37
SetVarByNum STACK_POP 2.07
SetVarByNum STACK_POP 5.42
SetVarByNum STACK_POP 6.66
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 55
STACK_PUSH var22 0
var22 = 110
CalcKnockback var23 ODamage 12 70 55 OWeight 0
Return
// ftilt
label ftilt
var22 = STACK_POP
SetVarByNum STACK_POP 2.73
SetVarByNum STACK_POP -5.54
SetVarByNum STACK_POP 10.81
SetVarByNum STACK_POP 8.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 9 30 70 OWeight 0
Return
// utilt
label utilt
var22 = STACK_POP
SetVarByNum STACK_POP 2.14
SetVarByNum STACK_POP -10.18
SetVarByNum STACK_POP 5.86
SetVarByNum STACK_POP 5.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 31
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 116
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 8 40 116 OWeight 0
Return
// utilt_start_outer
label utilt_start_outer
var22 = STACK_POP
SetVarByNum STACK_POP 4.63
SetVarByNum STACK_POP -6.7
SetVarByNum STACK_POP 8.87
SetVarByNum STACK_POP 12.41
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 31
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 110
CalcKnockback var23 ODamage 12 50 100 OWeight 0
Return
// utilt_end_outer
label utilt_end_outer
var22 = STACK_POP
SetVarByNum STACK_POP -11.93
SetVarByNum STACK_POP -8.71
SetVarByNum STACK_POP 12.77
SetVarByNum STACK_POP 11.51
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 31
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 85
CalcKnockback var23 ODamage 13 50 100 OWeight 0
Return
// dtilt
label dtilt
var22 = STACK_POP
SetVarByNum STACK_POP 16.44
SetVarByNum STACK_POP 1.3
SetVarByNum STACK_POP 4.07
SetVarByNum STACK_POP 4.15
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 40
STACK_PUSH var22 0
var22 = 30
CalcKnockback var23 ODamage 9 40 40 OWeight 0
Return
// dtilt_outer
label dtilt_outer
var22 = STACK_POP
SetVarByNum STACK_POP 21.28
SetVarByNum STACK_POP 2.84
SetVarByNum STACK_POP 4.11
SetVarByNum STACK_POP 4.15
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 40
STACK_PUSH var22 0
var22 = 30
CalcKnockback var23 ODamage 10 50 40 OWeight 0
Return
// fsmash
label fsmash
var22 = STACK_POP
SetVarByNum STACK_POP 4.93
SetVarByNum STACK_POP 3.57
SetVarByNum STACK_POP 11.72
SetVarByNum STACK_POP 13.75
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 48
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 14 60 70 OWeight 0
Return
// fsmash_outer
label fsmash_outer
var22 = STACK_POP
SetVarByNum STACK_POP 9.24
SetVarByNum STACK_POP 3.17
SetVarByNum STACK_POP 11.98
SetVarByNum STACK_POP 16.21
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 48
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 80
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 20 80 70 OWeight 0
Return
// usmash
label usmash
var22 = STACK_POP
SetVarByNum STACK_POP -4.41
SetVarByNum STACK_POP -16.36
SetVarByNum STACK_POP 4.78
SetVarByNum STACK_POP 5.07
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 41
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 15 30 80 OWeight 0
Return
// usmash_strong
label usmash_strong
var22 = STACK_POP
SetVarByNum STACK_POP -4.31
SetVarByNum STACK_POP -23.43
SetVarByNum STACK_POP 4.39
SetVarByNum STACK_POP 4.68
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 41
SetVarByNum STACK_POP 18
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 18 60 80 OWeight 0
Return
// dsmash
label dsmash
var22 = STACK_POP
SetVarByNum STACK_POP 15.03
SetVarByNum STACK_POP -1.16
SetVarByNum STACK_POP 4.3
SetVarByNum STACK_POP 4.3
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 62
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 72
STACK_PUSH var22 0
var22 = 75
CalcKnockback var23 ODamage 11 70 72 OWeight 0
Return
// dsmash_hit1_outer
label dsmash_hit1_outer
var22 = STACK_POP
SetVarByNum STACK_POP 20.16
SetVarByNum STACK_POP 0.53
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 62
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 70
CalcKnockback var23 ODamage 16 70 100 OWeight 0
Return
// dsmash_hit2_mid
label dsmash_hit2_mid
var22 = STACK_POP
SetVarByNum STACK_POP -17.54
SetVarByNum STACK_POP 0.34
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 21
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 62
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 72
STACK_PUSH var22 0
var22 = 75
CalcKnockback var23 ODamage 11 70 72 OWeight 0
Return
// dsmash_hit2_outer
label dsmash_hit2_outer
var22 = STACK_POP
SetVarByNum STACK_POP -21.89
SetVarByNum STACK_POP 1.26
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 21
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 62
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 75
CalcKnockback var23 ODamage 16 70 100 OWeight 0
Return
// nspecial
label nspecial
var22 = STACK_POP
SetVarByNum STACK_POP -1.05
SetVarByNum STACK_POP -1.74
SetVarByNum STACK_POP 4.53
SetVarByNum STACK_POP 5.28
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 46
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 7 34 100 OWeight 0
Return
// nspecial_strong
label nspecial_strong
var22 = STACK_POP
SetVarByNum STACK_POP -1.02
SetVarByNum STACK_POP 3.7
SetVarByNum STACK_POP 13.21
SetVarByNum STACK_POP 15.9
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 46
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 7 40 100 OWeight 0
Return
// sspecial
label sspecial
var22 = STACK_POP
SetVarByNum STACK_POP 2.64
SetVarByNum STACK_POP 2.49
SetVarByNum STACK_POP 11.86
SetVarByNum STACK_POP 14.11
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 55
SetVarByNum STACK_POP 25
STACK_PUSH var22 0
var22 = 96
CalcKnockback var23 ODamage 4 55 25 OWeight 0
Return
// grab
label grab
var22 = STACK_POP
SetVarByNum STACK_POP 4.18
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 7.28
SetVarByNum STACK_POP 4.36
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 32
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
STACK_PUSH var22 0
var22 = 0
CalcKnockback var23 ODamage 0 0 0 OWeight 0
Return
// fthrow
label fthrow
var22 = STACK_POP
SetVarByNum STACK_POP 4.18
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 7.28
SetVarByNum STACK_POP 4.36
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 27
SetVarByNum STACK_POP 33
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 45
STACK_PUSH var22 0
var22 = 50
CalcKnockback var23 ODamage 4 70 45 OWeight 0
Return
// dthrow
label dthrow
var22 = STACK_POP
SetVarByNum STACK_POP 4.18
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 7.28
SetVarByNum STACK_POP 4.36
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 38
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 65
SetVarByNum STACK_POP 50
STACK_PUSH var22 0
var22 = 50
CalcKnockback var23 ODamage 5 65 50 OWeight 0
Return
// bthrow
label bthrow
var22 = STACK_POP
SetVarByNum STACK_POP 4.18
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 7.28
SetVarByNum STACK_POP 4.36
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 42
SetVarByNum STACK_POP 41
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 60
STACK_PUSH var22 0
var22 = 117
CalcKnockback var23 ODamage 4 70 60 OWeight 0
Return
// uthrow
label uthrow
var22 = STACK_POP
SetVarByNum STACK_POP 4.18
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 7.28
SetVarByNum STACK_POP 4.36
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 42
SetVarByNum STACK_POP 46
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 130
STACK_PUSH var22 0
var22 = 87
CalcKnockback var23 ODamage 4 60 130 OWeight 0
Return
// nair
label nair
var22 = STACK_POP
SetVarByNum STACK_POP -2.83
SetVarByNum STACK_POP -4.83
SetVarByNum STACK_POP 11.05
SetVarByNum STACK_POP 5.77
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 49
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 40
STACK_PUSH var22 0
var22 = 100
CalcKnockback var23 ODamage 4 30 40 OWeight 0
Return
// nair_hit1_strong
label nair_hit1_strong
var22 = STACK_POP
SetVarByNum STACK_POP -4.7
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 4.44
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 49
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 40
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 4 30 40 OWeight 0
Return
// nair_hit2_strong
label nair_hit2_strong
var22 = STACK_POP
SetVarByNum STACK_POP -4.42
SetVarByNum STACK_POP -4.63
SetVarByNum STACK_POP 4.53
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 49
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 10 50 80 OWeight 0
Return
// fair
label fair
var22 = STACK_POP
SetVarByNum STACK_POP 0.6
SetVarByNum STACK_POP 1.07
SetVarByNum STACK_POP 7.18
SetVarByNum STACK_POP 10.45
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 10 30 70 OWeight 0
Return
// fair_outer
label fair_outer
var22 = STACK_POP
SetVarByNum STACK_POP 7.49
SetVarByNum STACK_POP 0.8
SetVarByNum STACK_POP 6.42
SetVarByNum STACK_POP 12.81
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 42
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 67
CalcKnockback var23 ODamage 13 42 70 OWeight 0
Return
// bair
label bair
var22 = STACK_POP
SetVarByNum STACK_POP -18.28
SetVarByNum STACK_POP -2.43
SetVarByNum STACK_POP 9.14
SetVarByNum STACK_POP 9.77
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = -361
CalcKnockback var23 ODamage 10 30 70 OWeight 0
Return
// bair_outer
label bair_outer
var22 = STACK_POP
SetVarByNum STACK_POP -23.66
SetVarByNum STACK_POP 2.65
SetVarByNum STACK_POP 12.77
SetVarByNum STACK_POP 14.84
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = -361
CalcKnockback var23 ODamage 13 30 70 OWeight 0
Return
// uair
label uair
var22 = STACK_POP
SetVarByNum STACK_POP -12.28
SetVarByNum STACK_POP -12.24
SetVarByNum STACK_POP 12.33
SetVarByNum STACK_POP 6.51
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 43
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 80
CalcKnockback var23 ODamage 10 30 70 OWeight 0
Return
// uair_outer
label uair_outer
var22 = STACK_POP
SetVarByNum STACK_POP -14.71
SetVarByNum STACK_POP -10.41
SetVarByNum STACK_POP 15.81
SetVarByNum STACK_POP 9.7
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 43
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 13 40 70 OWeight 0
Return
// dair
label dair
var22 = STACK_POP
SetVarByNum STACK_POP -13.58
SetVarByNum STACK_POP 3.98
SetVarByNum STACK_POP 12.09
SetVarByNum STACK_POP 8.52
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 59
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 80
CalcKnockback var23 ODamage 10 40 70 OWeight 0
Return
// dair_outer
label dair_outer
var22 = STACK_POP
SetVarByNum STACK_POP -18
SetVarByNum STACK_POP 8.5
SetVarByNum STACK_POP 16.38
SetVarByNum STACK_POP 10.39
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 59
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 290
CalcKnockback var23 ODamage 13 40 70 OWeight 0
Return
endif
Return
elif Equal var22 12
  var22 = 13
elif Equal var22 13
  var22 = 3
elif Equal var22 14
  var22 = 14.77
elif Equal var22 15
  var22 = 26.23
elif Equal var22 16
  var22 = 35
elif Equal var22 17
  var22 = 50
elif Equal var22 18
  var22 = -40
elif Equal var22 100
  var22 = 0
if !(True) || Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30|| Equal var20 31|| Equal var20 32|| Equal var20 33|| Equal var20 34|| Equal var20 35|| Equal var20 36|| Equal var20 37
    var22 = 1
  endif
elif Equal var22 200
  getCurrentPredictValue var17 4
  var23 = PT_AGGRESSION * 30 + 25
  if var17 <= var23 || OFramesHitstun > 0 || OFramesHitlag > 0
    if OCurrAction >= 66 && OCurrAction <= 89 && !(Equal OCurrAction 73)
    elif Equal OCurrAction 73 && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction 60
    else
      var22 = 0
      Return
    endif
    var22 = 1
    Return
  endif
  var22 = 0
elif Equal var22 0.001
if !(True) || Equal var20 17 || Equal var20 18 || Equal var20 32 || Equal var20 33
  var22 = -1
elif !(True) || Equal var20 8 || Equal var20 13 || Equal var20 14 || Equal var20 28 || Equal var20 29 || Equal var20 34 || Equal var20 35 || Equal var20 36 || Equal var20 37
  var22 = 0
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 15 || Equal var20 16 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27 || Equal var20 30 || Equal var20 31
  var22 = 1
endif
elif Equal var22 0.002
if !(True) || Equal var20 36 || Equal var20 37
  var22 = -1
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27 || Equal var20 28 || Equal var20 29 || Equal var20 30 || Equal var20 31 || Equal var20 32 || Equal var20 33
  var22 = 0
elif !(True) || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 13 || Equal var20 14 || Equal var20 34 || Equal var20 35
  var22 = 1
endif
elif Equal var22 30000
  var22 = LevelValue * 0.0015
  if Rnd < var22
    ADJUST_PERSONALITY 0 -3 1
    ADJUST_PERSONALITY 0 1.35 1
    ADJUST_PERSONALITY 3 -3 1
    ADJUST_PERSONALITY 10 -3 1
    ADJUST_PERSONALITY 4 -3 1
    ADJUST_PERSONALITY 5 -3 1
    ADJUST_PERSONALITY 0 3 Rnd
    ADJUST_PERSONALITY 3 3 Rnd
    ADJUST_PERSONALITY 10 3 Rnd
    ADJUST_PERSONALITY 4 3 Rnd
    ADJUST_PERSONALITY 5 3 Rnd
  else
    var22 = (1 - (LevelValue / 50)) * 0.6
    if PT_AGGRESSION >= 1.8 && Rnd <= 0.35
      var22 = Rnd * -1
      ADJUST_PERSONALITY 0 var22 Rnd
    endif 
    if CHANCE_MUL_LE PT_BAITCHANCE 0.3
      ADJUST_PERSONALITY 3 -0.004 var22
    elif CHANCE_MUL_GE PT_BAITCHANCE 0.8
      ADJUST_PERSONALITY 3 0.008 var22
    endif
    if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.2
      ADJUST_PERSONALITY 1 -0.002 var22
    elif CHANCE_MUL_GE PT_BAIT_DASHAWAYCHANCE 0.6
      ADJUST_PERSONALITY 1 0.003 var22
    endif
    if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.2
      ADJUST_PERSONALITY 2 -0.002 var22
    elif CHANCE_MUL_GE PT_BAIT_WDASHAWAYCHANCE 0.6
      ADJUST_PERSONALITY 2 0.003 var22
    endif
    if CHANCE_MUL_LE PT_WALL_CHANCE 0.3 || Equal var21 16.3
      ADJUST_PERSONALITY 10 -0.002 var22
    elif CHANCE_MUL_GE PT_WALL_CHANCE 0.3
      ADJUST_PERSONALITY 10 0.003 var22
    endif
    if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
      ADJUST_PERSONALITY 4 -0.004 var22
    elif CHANCE_MUL_GE PT_BRAVECHANCE 0.7
      ADJUST_PERSONALITY 4 0.003 var22
    endif
    if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.3 || Equal var21 7
      ADJUST_PERSONALITY 5 -0.008 var22
    elif CHANCE_MUL_GE PT_CIRCLECAMPCHANCE 0.6
      ADJUST_PERSONALITY 5 0.002 var22
    endif
    if CHANCE_MUL_LE PT_JUMPINESS 0.95
      ADJUST_PERSONALITY 7 -0.003 var22
    elif CHANCE_MUL_GE PT_JUMPINESS 0.95
      ADJUST_PERSONALITY 7 0.004 var22
    endif
    if CHANCE_MUL_LE PT_DJUMPINESS 0.98
      ADJUST_PERSONALITY 6 -0.003 var22
    elif CHANCE_MUL_GE PT_DJUMPINESS 0.98
      ADJUST_PERSONALITY 6 0.004 var22
    endif
    if CHANCE_MUL_LE PT_PLATCHANCE 0.7
      ADJUST_PERSONALITY 8 -0.003 var22
    elif CHANCE_MUL_GE PT_PLATCHANCE 0.7
      ADJUST_PERSONALITY 8 0.002 var22
    endif
    
    var22 = (1 - (LevelValue / 50))
    if CalledFrom BoardPlatform
      ADJUST_PERSONALITY 8 -0.04 var22
    elif CalledFrom ExecuteAttack
      // if PT_AGGRESSION < 0.2 && LevelValue >= 60
      //   ADJUST_PERSONALITY 0 1.5 1
      //   ADJUST_PERSONALITY 3 -0.75 1
      // endif
      ADJUST_PERSONALITY 0 0.002 var22
      ADJUST_PERSONALITY 3 0.002 var22
    elif CalledFrom Shield 
      ADJUST_PERSONALITY 0 -0.002 var22
      ADJUST_PERSONALITY 4 0.002 var22
    elif CalledFrom Wavedash
      if Rnd < 0.5
        ADJUST_PERSONALITY 2 -0.02 var22
      endif
      if Rnd < 0.5
        ADJUST_PERSONALITY 1 0.02 var22
      endif
      if Equal var16 1 || Equal var16 5
        ADJUST_PERSONALITY 0 -0.004 var22
      elif Equal var16 2
        ADJUST_PERSONALITY 0 0.002 var22
      endif
    elif CalledFrom DashScr
      if Rnd < 0.5
        ADJUST_PERSONALITY 1 -0.002 var22
      endif
      if Rnd < 0.5
        ADJUST_PERSONALITY 2 0.002 var22
      endif
      if Equal var16 1
        ADJUST_PERSONALITY 0 -0.0025 var22
        ADJUST_PERSONALITY 4 -0.002 var22
      elif Equal var16 2
        ADJUST_PERSONALITY 0 0.0025 var22
        ADJUST_PERSONALITY 4 0.002 var22
      endif
    endif
  endif
elif Equal var22 20000
  if Rnd <= 0.02 && Rnd <= 0.1
  var22 = 200
  XGoto GetChrSpecific
  XReciever
    if Equal var22 0
      var22 = (1 - (LevelValue / 50)) * 0.6
      ADJUST_PERSONALITY 3 0.004 var22
      ADJUST_PERSONALITY 1 0.002 var22
      ADJUST_PERSONALITY 2 0.002 var22
      ADJUST_PERSONALITY 10 0.001 var22
      ADJUST_PERSONALITY 5 0.002 var22
    endif
  endif
elif Equal var22 10000
  ADJUST_PERSONALITY 5 0.025 1
elif Equal var22 40000
  var22 = (1 - (LevelValue / 100)) * 60 + 10
  var22 *= PT_REACTION_TIME
  GetCommitPredictChance var23 LevelValue
  var23 = 1.1 - var23
  var23 *= 0.5
  var22 *= var23
  var23 = AnimFrame
  MOD var22 var23 var22
  if var22 <= 1 || Equal var21 10.4
  var22 = 0.004
  XGoto GetChrSpecific
  XReciever
var23 = var22
    if Equal var21 16.4 || Equal var21 10.2
    elif var23 >= 12
      var22 = var23 * 2
      if OCurrAction >= 74 && OCurrAction <= 101
      elif XDistLE var22 && OAttacking
        var21 = 10.6
        if CHANCE_MUL_LE PT_AGGRESSION 0.6
          var21 = 10.2
        endif
      endif
      predictAverage var22 10 LevelValue
      var22 *= 1
      var22 += var23 + 20
      if XDistLE var22
        RetrieveFullATKD var22 var23 var17 var23 var23 var23 var23 OCurrSubaction 1
        if Equal var22 0
          var22 = OEndFrame
        endif 
        if OAnimFrame >= var17 || Equal OHitboxConnected 1
          var23 = var22 - OAnimFrame
        else
          var23 = -1
        endif
        if var23 > 0
          var21 =  16.4
        endif
      endif
    endif
  endif
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 0
    // react to/read the opponent's attack patterns
    var22 = (1 - (LevelValue / 100)) * 30 + 4
    var22 *= PT_REACTION_TIME
    var23 = AnimFrame + 10
    MOD var17 var23 var22
    var23 = OAnimFrame + 10
    MOD var23 var23 var22
    if var17 > 1 && var23 > 1
    elif Equal OCurrAction 77 && OAnimFrame > 25
    elif var21 >= 16 && var21 < 17 && ODistLE 30
    elif Equal var21 16.4 || Equal var21 10.2 || Equal var21 10.6
    elif var21 >= 16.7
    elif !(Equal var21 13) && OFramesHitstun <= 0 && !(CalledFrom Shield) && !(Equal var21 10.2)
      if OCurrAction < 66 || OCurrAction >= 72
        predictAverage var22 10 LevelValue
        var22 += 15
        if Equal var21 12 || Equal CurrAction 73
          var22 += 14
        endif
        if ODistLE var22
          GetCommitPredictChance var17 LevelValue
          if Equal var21 12 || Equal CurrAction 73
            var22 = Damage * 0.2
            var17 += var22
          endif
          // var22 = (Rnd * 12) + (1 - LevelValue / 100) * 15 + 8
          // var22 *= PT_REACTION_TIME
          if Rnd < var17 && Rnd < var17
            if Rnd < 0.7
              CallI DefendHub
            elif Equal var21 12 || Equal CurrAction 73
              CallI DefendHub
            endif
          endif
        endif
      endif
    endif
  endif
elif Equal var22 0.003 || Equal var22 0.004
  STACK_PUSH var22 0
  var22 = -1
  RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
  if Equal var22 0
    var22 = OEndFrame
  endif 
  if Equal OCurrAction 51 && OYDistFloor < 25
    if Equal OCurrSubaction AttackAirN
      GetAttribute var17 300; 1
    elif Equal OCurrSubaction AttackAirF
      GetAttribute var17 304; 1
    elif Equal OCurrSubaction AttackAirB
      GetAttribute var17 308; 1
    elif Equal OCurrSubaction AttackAirHi
      GetAttribute var17 312; 1
    elif Equal OCurrSubaction AttackAirLw
      GetAttribute var17 316; 1
    endif
    var23 = OYDistFloor * 0.7
    var22 = var22 - OEndFrame
    var22 *= 1.25
    var22 += var17 + var23
    var22 += 5
    
  elif Equal OCurrAction 24
    var22 = OEndFrame - OAnimFrame
    var22 *= 0.65
    var22 += 5
  elif Equal OCurrAction 33 && OYDistBackEdge < -15
    var22 = 35
    var22 += 5
  elif Equal OCurrAction 26 || Equal OCurrAction 27 || Equal OCurrAction 16
    GetAttribute var22 940; 1
    var22 = 10 + var22
    var22 += 5
  elif Equal OCurrAction 29
    GetRaBasic var17 5 1
    var22 = var17 + 15
    var22 += 5
  elif OAttacking 
    if Equal var22 0
      var22 = OEndFrame
    endif 
    var22 = var22 - OAnimFrame
    var22 += 5
  elif OCurrAction >= 74 && OCurrAction <= 101
    var22 = OEndFrame - OAnimFrame
    var22 += 5
  elif OFramesHitstun > 0
    if Equal OAirGroundState 1
      var22 = 8
    else
      var22 = OFramesHitstun + OFramesHitlag
    endif
    var22 += 5
  endif
  if Equal STACK_POP 0.004
    if OAttacking
      RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
      if Equal var22 0
        var22 = OEndFrame
      endif 
      if OAnimFrame >= var17 || Equal OHitboxConnected 1
        var22 = var22 - OAnimFrame
      else
        var22 = -1
      endif
    endif
  endif
elif Equal var22 21
  var23 = 0
  PredictOMov var22 10 LevelValue
  if var22 > var23
    var23 = var22
  endif
  PredictOMov var22 4 LevelValue
  if var22 > var23
    var23 = var22
  endif
  PredictOMov var22 7 LevelValue
  if var22 > var23
    var23 = var22
  endif
  PredictOMov var22 14 LevelValue
  if var22 > var23
    var23 = var22
  endif
  PredictOMov var22 15 LevelValue
  if var22 > var23
    var23 = var22
  endif
  var22 = var23
endif
Return
label __ANGLE_FIX__
if Equal OAirGroundState 1
  if Equal var22 361
    if var23 < 32
      var22 = var23 * 0.03125 * 44
    else
      var22 = 44
    endif
  elif Equal var22 -361
    if var23 < 32
      var22 = 180 - var23 * 0.03125 * 44
    else
      var22 = 136
    endif
  endif
elif Equal var22 361
  var22 = 45
elif Equal var22 -361
  var22 = 135
endif
var23 = STACK_POP
SetVarByNum var23 var22
Return
Return
