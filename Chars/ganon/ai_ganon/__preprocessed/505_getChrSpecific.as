#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal var22 19
if var20 >= 0 && var20 < 27
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
SetVarByNum STACK_POP -0.62
SetVarByNum STACK_POP -8.11
SetVarByNum STACK_POP 8.38
SetVarByNum STACK_POP 4.46
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 18
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 8 30 100 OWeight 0
Return
// dashattack
label dashattack
var22 = STACK_POP
SetVarByNum STACK_POP 15.63
SetVarByNum STACK_POP -3.14
SetVarByNum STACK_POP 7.92
SetVarByNum STACK_POP 5.86
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 105
CalcKnockback var23 ODamage 15 60 80 OWeight 0
Return
// dashattack_late
label dashattack_late
var22 = STACK_POP
SetVarByNum STACK_POP 21.39
SetVarByNum STACK_POP -3.14
SetVarByNum STACK_POP 9.92
SetVarByNum STACK_POP 5.86
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 60
STACK_PUSH var22 0
var22 = 100
CalcKnockback var23 ODamage 10 45 60 OWeight 0
Return
// ftilt
label ftilt
var22 = STACK_POP
SetVarByNum STACK_POP 8.06
SetVarByNum STACK_POP -6.03
SetVarByNum STACK_POP 10.42
SetVarByNum STACK_POP 5.22
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 40
CalcKnockback var23 ODamage 13 20 100 OWeight 0
Return
// utilt
label utilt
var22 = STACK_POP
SetVarByNum STACK_POP 4.43
SetVarByNum STACK_POP 3.58
SetVarByNum STACK_POP 11.64
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 78
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 22 50 78 OWeight 0
Return
// dtilt
label dtilt
var22 = STACK_POP
SetVarByNum STACK_POP 4.53
SetVarByNum STACK_POP 0.86
SetVarByNum STACK_POP 12.09
SetVarByNum STACK_POP 4.68
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 32
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 70
CalcKnockback var23 ODamage 12 30 100 OWeight 0
Return
// fsmash
label fsmash
var22 = STACK_POP
SetVarByNum STACK_POP 7.4
SetVarByNum STACK_POP -3.18
SetVarByNum STACK_POP 10.79
SetVarByNum STACK_POP 5.56
SetVarByNum STACK_POP 21
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 90
STACK_PUSH var22 0
var22 = 65
CalcKnockback var23 ODamage 22 40 90 OWeight 0
Return
// usmash
label usmash
var22 = STACK_POP
SetVarByNum STACK_POP -2.09
SetVarByNum STACK_POP -9.89
SetVarByNum STACK_POP 7.54
SetVarByNum STACK_POP 11.55
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 80
CalcKnockback var23 ODamage 22 50 80 OWeight 0
Return
// usmash_hit2
label usmash_hit2
var22 = STACK_POP
SetVarByNum STACK_POP -1.98
SetVarByNum STACK_POP -10.69
SetVarByNum STACK_POP 6.49
SetVarByNum STACK_POP 11.58
SetVarByNum STACK_POP 27
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 80
CalcKnockback var23 ODamage 19 40 80 OWeight 0
Return
// dsmash
label dsmash
var22 = STACK_POP
SetVarByNum STACK_POP 6.65
SetVarByNum STACK_POP -3.46
SetVarByNum STACK_POP 8.65
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 47
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 115
SetVarByNum STACK_POP 0
STACK_PUSH var22 0
var22 = 160
CalcKnockback var23 ODamage 8 115 0 OWeight 0
Return
// dsmash_hit2
label dsmash_hit2
var22 = STACK_POP
SetVarByNum STACK_POP -23.18
SetVarByNum STACK_POP -6.81
SetVarByNum STACK_POP 12.56
SetVarByNum STACK_POP 4.87
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 47
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 110
STACK_PUSH var22 0
var22 = 120
CalcKnockback var23 ODamage 14 60 110 OWeight 0
Return
// uspecial
label uspecial
var22 = STACK_POP
SetVarByNum STACK_POP -3.02
SetVarByNum STACK_POP -4.38
SetVarByNum STACK_POP 11.2
SetVarByNum STACK_POP 35.99
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 23
SetVarByNum STACK_POP 63
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 115
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 10 40 115 OWeight 0
Return
// dspecial
label dspecial
var22 = STACK_POP
SetVarByNum STACK_POP 1.41
SetVarByNum STACK_POP -2.7
SetVarByNum STACK_POP 31.43
SetVarByNum STACK_POP 5.49
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 41
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 76
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 17 60 76 OWeight 0
Return
// sspecial
label sspecial
var22 = STACK_POP
SetVarByNum STACK_POP 5.24
SetVarByNum STACK_POP 0.87
SetVarByNum STACK_POP 24.02
SetVarByNum STACK_POP 6.64
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 61
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 25
CalcKnockback var23 ODamage 12 60 100 OWeight 0
Return
// grab
label grab
var22 = STACK_POP
SetVarByNum STACK_POP 0.05
SetVarByNum STACK_POP -4.85
SetVarByNum STACK_POP 6.95
SetVarByNum STACK_POP 5.44
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
SetVarByNum STACK_POP 0.05
SetVarByNum STACK_POP -4.85
SetVarByNum STACK_POP 6.95
SetVarByNum STACK_POP 5.44
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 28
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 105
STACK_PUSH var22 0
var22 = 45
CalcKnockback var23 ODamage 8 45 105 OWeight 0
Return
// dthrow
label dthrow
var22 = STACK_POP
SetVarByNum STACK_POP 0.05
SetVarByNum STACK_POP -4.85
SetVarByNum STACK_POP 6.95
SetVarByNum STACK_POP 5.44
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 41
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 75
SetVarByNum STACK_POP 45
STACK_PUSH var22 0
var22 = 80
CalcKnockback var23 ODamage 7 75 45 OWeight 0
Return
// bthrow
label bthrow
var22 = STACK_POP
SetVarByNum STACK_POP 0.05
SetVarByNum STACK_POP -4.85
SetVarByNum STACK_POP 6.95
SetVarByNum STACK_POP 5.44
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 130
STACK_PUSH var22 0
var22 = 58
CalcKnockback var23 ODamage 4 30 130 OWeight 0
Return
// uthrow
label uthrow
var22 = STACK_POP
SetVarByNum STACK_POP 0.05
SetVarByNum STACK_POP -4.85
SetVarByNum STACK_POP 6.95
SetVarByNum STACK_POP 5.44
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 39
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 120
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 3 70 120 OWeight 0
Return
// nair
label nair
var22 = STACK_POP
SetVarByNum STACK_POP -1.56
SetVarByNum STACK_POP -1.77
SetVarByNum STACK_POP 10.75
SetVarByNum STACK_POP 5.26
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 65
CalcKnockback var23 ODamage 10 20 100 OWeight 0
Return
// nair_hit2
label nair_hit2
var22 = STACK_POP
SetVarByNum STACK_POP -3.75
SetVarByNum STACK_POP -2.52
SetVarByNum STACK_POP 9.53
SetVarByNum STACK_POP 7.76
SetVarByNum STACK_POP 18
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 55
CalcKnockback var23 ODamage 12 50 100 OWeight 0
Return
// fair
label fair
var22 = STACK_POP
SetVarByNum STACK_POP -2.04
SetVarByNum STACK_POP 5.77
SetVarByNum STACK_POP 11.88
SetVarByNum STACK_POP 15.03
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 17 60 80 OWeight 0
Return
// bair
label bair
var22 = STACK_POP
SetVarByNum STACK_POP -21.67
SetVarByNum STACK_POP 0.59
SetVarByNum STACK_POP 9.11
SetVarByNum STACK_POP 8.13
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 28
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = -361
CalcKnockback var23 ODamage 16 10 100 OWeight 0
Return
// uair
label uair
var22 = STACK_POP
SetVarByNum STACK_POP -6.57
SetVarByNum STACK_POP -4.22
SetVarByNum STACK_POP 12.52
SetVarByNum STACK_POP 12.87
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 12 35 100 OWeight 0
Return
// uair_mid
label uair_mid
var22 = STACK_POP
SetVarByNum STACK_POP -19.48
SetVarByNum STACK_POP -8.82
SetVarByNum STACK_POP 11.29
SetVarByNum STACK_POP 10.57
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 30
CalcKnockback var23 ODamage 10 30 80 OWeight 0
Return
// uair_tipman
label uair_tipman
var22 = STACK_POP
SetVarByNum STACK_POP -19.57
SetVarByNum STACK_POP 2.77
SetVarByNum STACK_POP 8.96
SetVarByNum STACK_POP 10.81
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 70
STACK_PUSH var22 0
var22 = 360
CalcKnockback var23 ODamage 6 20 70 OWeight 0
Return
// dair
label dair
var22 = STACK_POP
SetVarByNum STACK_POP -6.84
SetVarByNum STACK_POP 12.04
SetVarByNum STACK_POP 6.95
SetVarByNum STACK_POP 13.47
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 270
CalcKnockback var23 ODamage 22 50 100 OWeight 0
Return
endif
Return
elif Equal var22 12
  var22 = 8
elif Equal var22 13
  var22 = 4
elif Equal var22 14
  var22 = 17.44
elif Equal var22 15
  var22 = 23.46
elif Equal var22 16
  var22 = 15
elif Equal var22 17
  var22 = 50
elif Equal var22 18
  var22 = -40
elif Equal var22 100
  var22 = 0
if !(True) || Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26
    var22 = 1
  endif
elif Equal var22 200
  getCurrentPredictValue var17 4
  var23 = PT_AGGRESSION * 25
  if var17 <= var23
    if OCurrAction >= 66 && OCurrAction <= 89 && !(Equal OCurrAction 73)
    elif Equal OCurrAction 73 && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction 60
      var22 = 1
      Return
    endif
  endif
  var22 = 0
elif Equal var22 0.001
if !(True) || Equal var20 10 || Equal var20 22 || Equal var20 24 || Equal var20 25
  var22 = -1
elif !(True) || Equal var20 26
  var22 = 0
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 9 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 23
  var22 = 1
endif
elif Equal var22 0.002
if !(True) || Equal var20 26
  var22 = -1
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 9 || Equal var20 10 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 25
  var22 = 0
elif !(True) || Equal var20 7 || Equal var20 8 || Equal var20 11 || Equal var20 23 || Equal var20 24
  var22 = 1
endif
elif Equal var22 30000
  var22 = LevelValue * 0.3
  if PT_AGGRESSION <= 0.2 && Rnd <= 0.2
    var22 = Rnd * 3
    ADJUST_PERSONALITY 0 var22 Rnd
  endif 
  if CHANCE_MUL_LE PT_BAITCHANCE 0.2
    ADJUST_PERSONALITY 3 -0.006 var22
  endif
  if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.1
    ADJUST_PERSONALITY 1 -0.002 var22
  elif CHANCE_MUL_GE PT_BAIT_DASHAWAYCHANCE 0.1
    ADJUST_PERSONALITY 1 0.003 var22
  endif
  if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.1
    ADJUST_PERSONALITY 2 -0.002 var22
  elif CHANCE_MUL_GE PT_BAIT_WDASHAWAYCHANCE 0.1
    ADJUST_PERSONALITY 2 0.003 var22
  endif
  if CHANCE_MUL_LE PT_WALL_CHANCE 0.4 || Equal var21 16.3
    ADJUST_PERSONALITY 10 -0.004 var22
  elif CHANCE_MUL_GE PT_WALL_CHANCE 0.4
    ADJUST_PERSONALITY 10 0.002 var22
  endif
  if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
    ADJUST_PERSONALITY 4 -0.004 var22
  elif CHANCE_MUL_GE PT_BRAVECHANCE 0.4
    ADJUST_PERSONALITY 4 0.003 var22
  endif
  if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.3 || Equal var21 7
    ADJUST_PERSONALITY 5 -0.008 var22
  elif CHANCE_MUL_GE PT_CIRCLECAMPCHANCE 0.3
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
  
  var22 = LevelValue * 0.6
  if CalledFrom BoardPlatform
    ADJUST_PERSONALITY 8 -0.04 var22
  elif CalledFrom ExecuteAttack
    if PT_AGGRESSION < 0.2 && LevelValue >= 60
      ADJUST_PERSONALITY 0 1.5 1
      ADJUST_PERSONALITY 3 -0.75 1
    endif
    ADJUST_PERSONALITY 0 -0.002 var22
    ADJUST_PERSONALITY 3 0.002 var22
  elif CalledFrom Shield 
    ADJUST_PERSONALITY 0 0.002 var22
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
elif Equal var22 20000
  if Rnd <= 0.02 && Rnd <= 0.1
  var22 = 200
  XGoto GetChrSpecific
  XReciever
    if Equal var22 0
      var22 = LevelValue * 0.4
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
  // GET_CHAR_TRAIT(var22, 0.003)
  // if var22 > 10
  //   Return
  // endif
  var22 = 200
  XGoto GetChrSpecific
  XReciever
  if Equal var22 0
    // react to/read the opponent's attack patterns
    var22 = (1 - (LevelValue / 100)) * 30 + 1
    var22 *= PT_REACTION_TIME
    var23 = AnimFrame - 1
    MOD var17 var23 var22
    var23 = OAnimFrame - 8
    MOD var23 var23 var22
    if var17 > 1 && var23 > 1
    elif Equal OCurrAction 77 && OAnimFrame > 25
    elif var21 >= 16 && var21 < 17 && ODistLE 30
    elif Equal var21 16.4 || Equal var21 10.2
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
          PredictOMov var23 15 LevelValue
          if var23 > var17
            var17 = var23
          endif
          var17 *= 2
          var22 = 2 - PT_AGGRESSION
          if var22 > 0.75
            var17 *= var22
          endif
          if Equal var21 12 || Equal CurrAction 73
            var22 = Damage * 0.1
            var17 += var22
          endif
          // var22 = (Rnd * 12) + (1 - LevelValue / 100) * 15 + 8
          // var22 *= PT_REACTION_TIME
          if Rnd < var17 && CHANCE_MUL_LE var17 2
            if Rnd < 0.7
              CallI DefendHub
            elif Equal var21 12 || Equal CurrAction 73
              CallI DefendHub
            endif
          // elif OAnimFrame >= var22 && OCurrAction >= 36 && OCurrAction <= 52
          //   if Rnd < 0.1
          //     CallI DefendHub
          //   elif Rnd < 0.3 || Equal var21 12 || Equal CurrAction 73
          //     CallI DefendHub
          //   endif
          endif
        endif
      endif
    endif
  endif
elif Equal var22 0.003 || Equal var22 0.004
  STACK_PUSH var22 0
  var22 = -1
  if Equal OCurrAction 51 && OYDistFloor < 25 && OYSpeed < 0.2
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
    var17 += OYDistFloor
    var17 *= 0.7
    var22 = var17
    var22 += 5
    
  elif Equal OCurrAction 24
    var22 = OEndFrame - OAnimFrame
    var22 += 5
  elif Equal OCurrAction 33 && OYDistBackEdge < -15
    var22 = 35
    var22 += 5
  elif Equal OCurrAction 26 || Equal OCurrAction 27 || Equal OCurrAction 16
    GetAttribute var22 940; 1
    var22 = 7 + var22
    var22 += 5
  elif Equal OCurrAction 29
    GetRaBasic var17 5 1
    var22 = var17 + 15
    var22 += 5
  elif OAttacking 
    RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
    if Equal var22 0
      var22 = OEndFrame
    endif 
    // if OAnimFrame >= var17
      var22 = var22 - OAnimFrame
      var22 += 5
    // endif
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