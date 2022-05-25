#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal var22 19
if var20 >= 0 && var20 < 28
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
SetVarByNum STACK_POP 5.44
SetVarByNum STACK_POP -1.02
SetVarByNum STACK_POP 7.1
SetVarByNum STACK_POP 5.2
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 53
STACK_PUSH var22 0
var22 = 80
CalcKnockback var23 ODamage 4 20 53 OWeight 0
Return
// dashattack
label dashattack
var22 = STACK_POP
SetVarByNum STACK_POP 22.13
SetVarByNum STACK_POP 2.1
SetVarByNum STACK_POP 7.77
SetVarByNum STACK_POP 11.07
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 39
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 106
CalcKnockback var23 ODamage 9 35 100 OWeight 0
Return
// ftilt
label ftilt
var22 = STACK_POP
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP -0.5
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 31
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 150
STACK_PUSH var22 0
var22 = 50
CalcKnockback var23 ODamage 6 25 150 OWeight 0
Return
// utilt
label utilt
var22 = STACK_POP
SetVarByNum STACK_POP -2.94
SetVarByNum STACK_POP -0.02
SetVarByNum STACK_POP 7.72
SetVarByNum STACK_POP 13.37
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 26
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 105
STACK_PUSH var22 0
var22 = 85
CalcKnockback var23 ODamage 10 30 105 OWeight 0
Return
// dtilt
label dtilt
var22 = STACK_POP
SetVarByNum STACK_POP 2.99
SetVarByNum STACK_POP 1.09
SetVarByNum STACK_POP 10.53
SetVarByNum STACK_POP 5.18
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 26
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 68
CalcKnockback var23 ODamage 8 30 100 OWeight 0
Return
// fsmash
label fsmash
var22 = STACK_POP
SetVarByNum STACK_POP 0.68
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 19.56
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 48
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 86
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 15 45 86 OWeight 0
Return
// usmash
label usmash
var22 = STACK_POP
SetVarByNum STACK_POP -8.37
SetVarByNum STACK_POP 0.97
SetVarByNum STACK_POP 14.37
SetVarByNum STACK_POP 13.92
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 100
CalcKnockback var23 ODamage 12 40 100 OWeight 0
Return
// usmash_late
label usmash_late
var22 = STACK_POP
SetVarByNum STACK_POP -23.36
SetVarByNum STACK_POP 0.61
SetVarByNum STACK_POP 12.18
SetVarByNum STACK_POP 13.74
SetVarByNum STACK_POP 18
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 40
CalcKnockback var23 ODamage 11 25 100 OWeight 0
Return
// dsmash
label dsmash
var22 = STACK_POP
SetVarByNum STACK_POP 3.03
SetVarByNum STACK_POP 2.24
SetVarByNum STACK_POP 8.87
SetVarByNum STACK_POP 5.22
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 40
CalcKnockback var23 ODamage 15 25 100 OWeight 0
Return
// dsmash_late
label dsmash_late
var22 = STACK_POP
SetVarByNum STACK_POP -18.24
SetVarByNum STACK_POP 2.25
SetVarByNum STACK_POP 8.5
SetVarByNum STACK_POP 5.35
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 40
CalcKnockback var23 ODamage 13 25 100 OWeight 0
Return
// nspecial
label nspecial
var22 = STACK_POP
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP -2
SetVarByNum STACK_POP 200
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
STACK_PUSH var22 0
var22 = 0
CalcKnockback var23 ODamage 3 0 0 OWeight 0
Return
// nspecialair
label nspecialair
var22 = STACK_POP
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP -2
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
STACK_PUSH var22 0
var22 = 0
CalcKnockback var23 ODamage 3 0 0 OWeight 0
Return
// dspecial
label dspecial
var22 = STACK_POP
SetVarByNum STACK_POP -8
SetVarByNum STACK_POP 1.5
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 69
CalcKnockback var23 ODamage 5 70 100 OWeight 0
Return
// dspecialair
label dspecialair
var22 = STACK_POP
SetVarByNum STACK_POP -8
SetVarByNum STACK_POP 1.5
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 69
CalcKnockback var23 ODamage 5 70 100 OWeight 0
Return
// sspecial
label sspecial
var22 = STACK_POP
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 59
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 30
CalcKnockback var23 ODamage 16 60 100 OWeight 0
Return
// sspecialair
label sspecialair
var22 = STACK_POP
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 59
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 30
CalcKnockback var23 ODamage 16 60 100 OWeight 0
Return
// grab
label grab
var22 = STACK_POP
SetVarByNum STACK_POP 1.3
SetVarByNum STACK_POP -1.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4.5
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
SetVarByNum STACK_POP 1.3
SetVarByNum STACK_POP -1.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 27
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 54
SetVarByNum STACK_POP 135
STACK_PUSH var22 0
var22 = 45
CalcKnockback var23 ODamage 2 54 135 OWeight 0
Return
// dthrow
label dthrow
var22 = STACK_POP
SetVarByNum STACK_POP 1.3
SetVarByNum STACK_POP -1.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 48
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 50
STACK_PUSH var22 0
var22 = 55
CalcKnockback var23 ODamage 3 70 50 OWeight 0
Return
// bthrow
label bthrow
var22 = STACK_POP
SetVarByNum STACK_POP 1.3
SetVarByNum STACK_POP -1.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 43
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 58
STACK_PUSH var22 0
var22 = 120
CalcKnockback var23 ODamage 5 70 58 OWeight 0
Return
// uthrow
label uthrow
var22 = STACK_POP
SetVarByNum STACK_POP 1.3
SetVarByNum STACK_POP -1.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 110
STACK_PUSH var22 0
var22 = 77
CalcKnockback var23 ODamage 2 70 110 OWeight 0
Return
// nair
label nair
var22 = STACK_POP
SetVarByNum STACK_POP -7.79
SetVarByNum STACK_POP 1.8
SetVarByNum STACK_POP 7.8
SetVarByNum STACK_POP 8.33
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 0
CalcKnockback var23 ODamage 4 20 100 OWeight 1
Return
// fair
label fair
var22 = STACK_POP
SetVarByNum STACK_POP -0.91
SetVarByNum STACK_POP 1.35
SetVarByNum STACK_POP 8.97
SetVarByNum STACK_POP 7.32
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 70
CalcKnockback var23 ODamage 15 25 100 OWeight 0
Return
// bair
label bair
var22 = STACK_POP
SetVarByNum STACK_POP -16.58
SetVarByNum STACK_POP -1.86
SetVarByNum STACK_POP 8.84
SetVarByNum STACK_POP 4.86
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 28
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 102
STACK_PUSH var22 0
var22 = -361
CalcKnockback var23 ODamage 14 22 102 OWeight 0
Return
// uair
label uair
var22 = STACK_POP
SetVarByNum STACK_POP -0.11
SetVarByNum STACK_POP -3.93
SetVarByNum STACK_POP 8.18
SetVarByNum STACK_POP 5.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 57
CalcKnockback var23 ODamage 11 20 100 OWeight 0
Return
// uair_late
label uair_late
var22 = STACK_POP
SetVarByNum STACK_POP -14.58
SetVarByNum STACK_POP -0.49
SetVarByNum STACK_POP 15.41
SetVarByNum STACK_POP 12.97
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 50
CalcKnockback var23 ODamage 11 20 100 OWeight 0
Return
// dair
label dair
var22 = STACK_POP
SetVarByNum STACK_POP -5.5
SetVarByNum STACK_POP 10.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 7.5
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 36
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 85
STACK_PUSH var22 0
var22 = 290
CalcKnockback var23 ODamage 15 30 85 OWeight 0
Return
// dair_meteor
label dair_meteor
var22 = STACK_POP
SetVarByNum STACK_POP -5.5
SetVarByNum STACK_POP 10.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 7.5
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 36
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 270
CalcKnockback var23 ODamage 14 15 100 OWeight 0
Return
endif
Return
elif Equal var22 12
  var22 = 9
elif Equal var22 13
  var22 = 6
elif Equal var22 14
  var22 = 12.5
elif Equal var22 15
  var22 = 35.28
elif Equal var22 16
  var22 = 25
elif Equal var22 17
  var22 = 60
elif Equal var22 18
  var22 = -80
elif Equal var22 100
  var22 = 0
if !(True) || Equal var20 11|| Equal var20 13|| Equal var20 15|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27
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
if !(True) || Equal var20 7 || Equal var20 9 || Equal var20 23
  var22 = -1
elif !(True) || Equal var20 12 || Equal var20 13 || Equal var20 21 || Equal var20 25 || Equal var20 26 || Equal var20 27
  var22 = 0
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8 || Equal var20 10 || Equal var20 11 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 22 || Equal var20 24
  var22 = 1
endif
elif Equal var22 0.002
if !(True) || Equal var20 26 || Equal var20 27
  var22 = -1
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 4 || Equal var20 5 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23
  var22 = 0
elif !(True) || Equal var20 3 || Equal var20 6 || Equal var20 7 || Equal var20 14 || Equal var20 15 || Equal var20 24 || Equal var20 25
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
    if CHANCE_MUL_LE PT_JUMPINESS 0.95
      ADJUST_PERSONALITY 7 -0.003 var22
    elif CHANCE_MUL_GE PT_JUMPINESS 0.95
      ADJUST_PERSONALITY 7 0.004 var22
    endif
    if CHANCE_MUL_LE PT_DJUMPINESS 0.96
      ADJUST_PERSONALITY 6 -0.003 var22
    elif CHANCE_MUL_GE PT_DJUMPINESS 0.96
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
