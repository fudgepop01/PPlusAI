#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal var22 19
if var20 >= 0 && var20 < 26
GotoByValue var20
else
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
SetVarByNum var22 83
SetVarByNum STACK_POP 3.3
SetVarByNum STACK_POP -5.29
SetVarByNum STACK_POP 6.78
SetVarByNum STACK_POP 5.1
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 17
CalcKnockback var23 ODamage 6 35 100 OWeight 1
Return
// dashattack
label dashattack
var22 = STACK_POP
SetVarByNum var22 80
SetVarByNum STACK_POP 6.15
SetVarByNum STACK_POP -3.82
SetVarByNum STACK_POP 11.44
SetVarByNum STACK_POP 4.68
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 37
CalcKnockback var23 ODamage 9 80 60 OWeight 0
Return
// dashattack_weak
label dashattack_weak
var22 = STACK_POP
SetVarByNum var22 80
SetVarByNum STACK_POP 11.79
SetVarByNum STACK_POP -3.76
SetVarByNum STACK_POP 13.15
SetVarByNum STACK_POP 4.75
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 37
CalcKnockback var23 ODamage 6 40 60 OWeight 0
Return
// ftilt
label ftilt
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 5.35
SetVarByNum STACK_POP -2.93
SetVarByNum STACK_POP 6.89
SetVarByNum STACK_POP 4.71
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 28
CalcKnockback var23 ODamage 8 10 100 OWeight 0
Return
// utilt
label utilt
var22 = STACK_POP
SetVarByNum var22 85
SetVarByNum STACK_POP -1.73
SetVarByNum STACK_POP -0.72
SetVarByNum STACK_POP 10.93
SetVarByNum STACK_POP 7.9
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 27
CalcKnockback var23 ODamage 8 25 134 OWeight 0
Return
// utilt_late
label utilt_late
var22 = STACK_POP
SetVarByNum var22 78
SetVarByNum STACK_POP -17.06
SetVarByNum STACK_POP -0.72
SetVarByNum STACK_POP 19.16
SetVarByNum STACK_POP 17.31
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 27
CalcKnockback var23 ODamage 8 25 134 OWeight 0
Return
// dtilt
label dtilt
var22 = STACK_POP
SetVarByNum var22 80
SetVarByNum STACK_POP 3.11
SetVarByNum STACK_POP 0.54
SetVarByNum STACK_POP 10.75
SetVarByNum STACK_POP 4.43
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 19
CalcKnockback var23 ODamage 8 40 80 OWeight 0
Return
// fsmash
label fsmash
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 19.43
SetVarByNum STACK_POP -2.97
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 52
CalcKnockback var23 ODamage 20 30 80 OWeight 0
Return
// fsmash_weak
label fsmash_weak
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 6.27
SetVarByNum STACK_POP -3.92
SetVarByNum STACK_POP 3.92
SetVarByNum STACK_POP 3.92
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 52
CalcKnockback var23 ODamage 12 30 80 OWeight 0
Return
// usmash
label usmash
var22 = STACK_POP
SetVarByNum var22 90
SetVarByNum STACK_POP -13.53
SetVarByNum STACK_POP -4.9
SetVarByNum STACK_POP 13.53
SetVarByNum STACK_POP 11.87
SetVarByNum STACK_POP 32
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 62
CalcKnockback var23 ODamage 10 40 118 OWeight 0
Return
// dsmash
label dsmash
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 6.81
SetVarByNum STACK_POP 4.13
SetVarByNum STACK_POP 6.86
SetVarByNum STACK_POP 6.86
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 43
CalcKnockback var23 ODamage 17 30 103 OWeight 0
Return
// dspecial
label dspecial
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 3.71
SetVarByNum STACK_POP -9.58
SetVarByNum STACK_POP 11.95
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 41
CalcKnockback var23 ODamage 1 64 100 OWeight 1
Return
// sspecial
label sspecial
var22 = STACK_POP
SetVarByNum var22 87
SetVarByNum STACK_POP 8.92
SetVarByNum STACK_POP -13.5
SetVarByNum STACK_POP 6.37
SetVarByNum STACK_POP 7.95
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 48
CalcKnockback var23 ODamage 10 65 64 OWeight 0
Return
// sspecialair
label sspecialair
var22 = STACK_POP
SetVarByNum var22 87
SetVarByNum STACK_POP 8.92
SetVarByNum STACK_POP -13.5
SetVarByNum STACK_POP 6.37
SetVarByNum STACK_POP 7.95
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 48
CalcKnockback var23 ODamage 10 65 64 OWeight 0
Return
// grab
label grab
var22 = STACK_POP
SetVarByNum var22 0
SetVarByNum STACK_POP 1.21
SetVarByNum STACK_POP -2.92
SetVarByNum STACK_POP 6.63
SetVarByNum STACK_POP 6.16
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 29
CalcKnockback var23 ODamage 0 0 0 OWeight 0
Return
// fthrow
label fthrow
var22 = STACK_POP
SetVarByNum var22 45
SetVarByNum STACK_POP 1.21
SetVarByNum STACK_POP -2.92
SetVarByNum STACK_POP 6.63
SetVarByNum STACK_POP 6.16
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 97
CalcKnockback var23 ODamage 8 70 80 OWeight 0
Return
// dthrow
label dthrow
var22 = STACK_POP
SetVarByNum var22 69
SetVarByNum STACK_POP 1.21
SetVarByNum STACK_POP -2.92
SetVarByNum STACK_POP 6.63
SetVarByNum STACK_POP 6.16
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 51
CalcKnockback var23 ODamage 6 65 50 OWeight 0
Return
// bthrow
label bthrow
var22 = STACK_POP
SetVarByNum var22 135
SetVarByNum STACK_POP 1.21
SetVarByNum STACK_POP -2.92
SetVarByNum STACK_POP 6.63
SetVarByNum STACK_POP 6.16
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 51
CalcKnockback var23 ODamage 11 70 80 OWeight 0
Return
// uthrow
label uthrow
var22 = STACK_POP
SetVarByNum var22 90
SetVarByNum STACK_POP 1.21
SetVarByNum STACK_POP -2.92
SetVarByNum STACK_POP 6.63
SetVarByNum STACK_POP 6.16
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 71
CalcKnockback var23 ODamage 12 100 67 OWeight 0
Return
// nair
label nair
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -12.95
SetVarByNum STACK_POP 3.97
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 41
CalcKnockback var23 ODamage 4 70 80 OWeight 0
Return
// nair_multihit
label nair_multihit
var22 = STACK_POP
SetVarByNum var22 110
SetVarByNum STACK_POP -12.95
SetVarByNum STACK_POP 3.97
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 33
SetVarByNum STACK_POP 41
CalcKnockback var23 ODamage 1 40 100 OWeight 1
Return
// fair
label fair
var22 = STACK_POP
SetVarByNum var22 84
SetVarByNum STACK_POP 2.3
SetVarByNum STACK_POP 2.42
SetVarByNum STACK_POP 6.22
SetVarByNum STACK_POP 6.35
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 36
CalcKnockback var23 ODamage 14 40 100 OWeight 0
Return
// bair
label bair
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -24.03
SetVarByNum STACK_POP 5.62
SetVarByNum STACK_POP 10.73
SetVarByNum STACK_POP 14.13
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 29
CalcKnockback var23 ODamage 13 20 100 OWeight 0
Return
// uair
label uair
var22 = STACK_POP
SetVarByNum var22 55
SetVarByNum STACK_POP -4.93
SetVarByNum STACK_POP -4.01
SetVarByNum STACK_POP 12.84
SetVarByNum STACK_POP 10.87
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 29
CalcKnockback var23 ODamage 12 0 100 OWeight 0
Return
// uair_late
label uair_late
var22 = STACK_POP
SetVarByNum var22 65
SetVarByNum STACK_POP -22.91
SetVarByNum STACK_POP -6.86
SetVarByNum STACK_POP 19.04
SetVarByNum STACK_POP 11.67
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
CalcKnockback var23 ODamage 11 0 100 OWeight 0
Return
// dair
label dair
var22 = STACK_POP
SetVarByNum var22 270
SetVarByNum STACK_POP -5.71
SetVarByNum STACK_POP 12.15
SetVarByNum STACK_POP 7.13
SetVarByNum STACK_POP 10.9
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 43
CalcKnockback var23 ODamage 15 20 100 OWeight 0
Return
endif
PRINTLN
SetVarByNum STACK_POP var23
Goto __ANGLE_FIX__
Return
elif Equal var22 12
  var22 = 17
elif Equal var22 13
  var22 = 8
elif Equal var22 14
  var22 = 25
elif Equal var22 15
  var22 = 36
elif Equal var22 16
  var22 = 35
elif Equal var22 17
  var22 = 50
elif Equal var22 18
  var22 = -40
elif Equal var22 100
  var22 = 0
if !(True) || Equal var20 13|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22|| Equal var20 23|| Equal var20 24|| Equal var20 25
    var22 = 1
  endif
elif Equal var22 200
  getCurrentPredictValue var17 4
  var23 = PT_AGGRESSION * 20
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
if !(True) || Equal var20 22 || Equal var20 24
  var22 = -1
elif !(True) || Equal var20 5 || Equal var20 9 || Equal var20 19 || Equal var20 20 || Equal var20 25
  var22 = 0
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 21 || Equal var20 23
  var22 = 1
endif
elif Equal var22 0.002
if !(True) || Equal var20 25
  var22 = -1
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 10 || Equal var20 11 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22
  var22 = 0
elif !(True) || Equal var20 5 || Equal var20 9 || Equal var20 12 || Equal var20 13 || Equal var20 23 || Equal var20 24
  var22 = 1
endif
elif Equal var22 30000
  if CalledFrom BoardPlatform
    ADJUST_PERSONALITY 8 -0.04
  elif CalledFrom ExecuteAttack
    ADJUST_PERSONALITY 0 -0.005
    ADJUST_PERSONALITY 3 0.02
  elif CalledFrom Shield 
    ADJUST_PERSONALITY 0 0.04
    ADJUST_PERSONALITY 4 0.02
  elif CalledFrom Wavedash
    if Rnd < 0.5
      ADJUST_PERSONALITY 2 -0.02
    endif
    if Rnd < 0.5
      ADJUST_PERSONALITY 1 0.02
    endif
    if Equal var16 1 || Equal var16 5
      ADJUST_PERSONALITY 0 -0.02
    elif Equal var16 2
      ADJUST_PERSONALITY 0 0.02
    endif
  elif CalledFrom JumpScr
    ADJUST_PERSONALITY 7 -0.025
    if Equal var16 1
      ADJUST_PERSONALITY 0 -0.03
      ADJUST_PERSONALITY 4 -0.03
    elif Equal var16 3
      ADJUST_PERSONALITY 0 0.025
    endif
  elif CalledFrom AerialDrift
    ADJUST_PERSONALITY 6 -0.01
  elif CalledFrom DashScr
    if Rnd < 0.5
      ADJUST_PERSONALITY 1 -0.02
    endif
    if Rnd < 0.5
      ADJUST_PERSONALITY 2 0.02
    endif
    if Equal var16 1
      ADJUST_PERSONALITY 0 -0.025
      ADJUST_PERSONALITY 4 -0.02
    elif Equal var16 2
      ADJUST_PERSONALITY 0 0.025
      ADJUST_PERSONALITY 4 0.02
    endif
  endif
elif Equal var22 20000
  if Rnd <= 0.01 && Rnd <= 0.1
    var22 = Rnd * 0.006
    ADJUST_PERSONALITY 8 var22
    var22 = Rnd * 0.004
    ADJUST_PERSONALITY 0 var22
    var22 = Rnd * 0.002
    ADJUST_PERSONALITY 4 var22
    var22 = Rnd * 0.0005
    ADJUST_PERSONALITY 7 var22
    var22 = Rnd * 0.0003
    ADJUST_PERSONALITY 6 var22
    var22 = Rnd * 0.004
    ADJUST_PERSONALITY 3 var22
  endif
elif Equal var22 10000
  ADJUST_PERSONALITY 5 0.01
elif Equal var22 0.003 || Equal var22 0.004
  STACK_PUSH var22
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
Return
Return
