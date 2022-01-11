#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal var22 19
if var20 >= 0 && var20 < 31
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
SetVarByNum var22 80
SetVarByNum STACK_POP 2.15
SetVarByNum STACK_POP -1.84
SetVarByNum STACK_POP 7.43
SetVarByNum STACK_POP 3.28
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 16
CalcKnockback var23 ODamage 3 20 100 OWeight 1
Return
// jab123_2
label jab123_2
var22 = STACK_POP
SetVarByNum var22 85
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 0.26
SetVarByNum STACK_POP 7.08
SetVarByNum STACK_POP 4.22
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 22
CalcKnockback var23 ODamage 2 20 100 OWeight 1
Return
// jab123_3
label jab123_3
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 7.36
SetVarByNum STACK_POP -3.51
SetVarByNum STACK_POP 6.23
SetVarByNum STACK_POP 3.45
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 38
CalcKnockback var23 ODamage 4 25 100 OWeight 0
Return
// dashattack
label dashattack
var22 = STACK_POP
SetVarByNum var22 75
SetVarByNum STACK_POP 6.63
SetVarByNum STACK_POP -2.22
SetVarByNum STACK_POP 9.49
SetVarByNum STACK_POP 6.72
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 38
CalcKnockback var23 ODamage 9 55 80 OWeight 0
Return
// dashattack_late
label dashattack_late
var22 = STACK_POP
SetVarByNum var22 90
SetVarByNum STACK_POP 16.6
SetVarByNum STACK_POP -1.22
SetVarByNum STACK_POP 13.69
SetVarByNum STACK_POP 7.35
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 38
CalcKnockback var23 ODamage 5 35 80 OWeight 0
Return
// ftilt
label ftilt
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 4.29
SetVarByNum STACK_POP -1.92
SetVarByNum STACK_POP 5.89
SetVarByNum STACK_POP 4.24
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 39
CalcKnockback var23 ODamage 9 10 100 OWeight 0
Return
// ftilt_strong
label ftilt_strong
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 13.7
SetVarByNum STACK_POP -1.86
SetVarByNum STACK_POP 4.25
SetVarByNum STACK_POP 5.38
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 39
CalcKnockback var23 ODamage 12 10 100 OWeight 0
Return
// utilt
label utilt
var22 = STACK_POP
SetVarByNum var22 100
SetVarByNum STACK_POP -7.44
SetVarByNum STACK_POP -4.44
SetVarByNum STACK_POP 9.85
SetVarByNum STACK_POP 11.75
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 30
CalcKnockback var23 ODamage 8 40 110 OWeight 0
Return
// dtilt
label dtilt
var22 = STACK_POP
SetVarByNum var22 50
SetVarByNum STACK_POP 4.05
SetVarByNum STACK_POP -1.07
SetVarByNum STACK_POP 4.89
SetVarByNum STACK_POP 3.7
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 18
CalcKnockback var23 ODamage 8 20 75 OWeight 0
Return
// dtilt_outer
label dtilt_outer
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 13.2
SetVarByNum STACK_POP 0.47
SetVarByNum STACK_POP 3.33
SetVarByNum STACK_POP 3.37
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 18
CalcKnockback var23 ODamage 8 20 75 OWeight 0
Return
// fsmash
label fsmash
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 3.22
SetVarByNum STACK_POP -2.89
SetVarByNum STACK_POP 13.85
SetVarByNum STACK_POP 6.38
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 51
CalcKnockback var23 ODamage 14 40 100 OWeight 0
Return
// usmash
label usmash
var22 = STACK_POP
SetVarByNum var22 90
SetVarByNum STACK_POP -13.5
SetVarByNum STACK_POP -1.93
SetVarByNum STACK_POP 12.78
SetVarByNum STACK_POP 10.39
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 53
CalcKnockback var23 ODamage 11 25 117 OWeight 0
Return
// dsmash
label dsmash
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 1.58
SetVarByNum STACK_POP 8.92
SetVarByNum STACK_POP 4.11
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 44
CalcKnockback var23 ODamage 16 40 80 OWeight 0
Return
// dsmash_hit2
label dsmash_hit2
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -18.08
SetVarByNum STACK_POP 0.61
SetVarByNum STACK_POP 9.18
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 15
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 44
CalcKnockback var23 ODamage 13 35 80 OWeight 0
Return
// nspecial
label nspecial
var22 = STACK_POP
SetVarByNum var22 0
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 39
CalcKnockback var23 ODamage 3 0 0 OWeight 0
Return
// nspecialair
label nspecialair
var22 = STACK_POP
SetVarByNum var22 0
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 39
CalcKnockback var23 ODamage 3 0 0 OWeight 0
Return
// dspecial
label dspecial
var22 = STACK_POP
SetVarByNum var22 0
SetVarByNum STACK_POP -10
SetVarByNum STACK_POP 80
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
CalcKnockback var23 ODamage 0 0 0 OWeight 0
Return
// dspecialair
label dspecialair
var22 = STACK_POP
SetVarByNum var22 0
SetVarByNum STACK_POP -10
SetVarByNum STACK_POP 80
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
CalcKnockback var23 ODamage 0 0 0 OWeight 0
Return
// grab
label grab
var22 = STACK_POP
SetVarByNum var22 0
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP -3.5
SetVarByNum STACK_POP 5.75
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 32
CalcKnockback var23 ODamage 0 0 0 OWeight 0
Return
// fthrow
label fthrow
var22 = STACK_POP
SetVarByNum var22 45
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP -3.5
SetVarByNum STACK_POP 5.75
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 29
CalcKnockback var23 ODamage 11 65 55 OWeight 0
Return
// dthrow
label dthrow
var22 = STACK_POP
SetVarByNum var22 50
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP -3.5
SetVarByNum STACK_POP 5.75
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 24
SetVarByNum STACK_POP 31
CalcKnockback var23 ODamage 3 60 105 OWeight 0
Return
// bthrow
label bthrow
var22 = STACK_POP
SetVarByNum var22 45
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP -3.5
SetVarByNum STACK_POP 5.75
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 24
SetVarByNum STACK_POP 28
CalcKnockback var23 ODamage 10 55 70 OWeight 0
Return
// uthrow
label uthrow
var22 = STACK_POP
SetVarByNum var22 80
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP -3.5
SetVarByNum STACK_POP 5.75
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 33
SetVarByNum STACK_POP 41
CalcKnockback var23 ODamage 7 35 105 OWeight 0
Return
// nair
label nair
var22 = STACK_POP
SetVarByNum var22 75
SetVarByNum STACK_POP -10.84
SetVarByNum STACK_POP 6.08
SetVarByNum STACK_POP 9.27
SetVarByNum STACK_POP 9.78
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 36
CalcKnockback var23 ODamage 13 16 100 OWeight 0
Return
// nair_late
label nair_late
var22 = STACK_POP
SetVarByNum var22 60
SetVarByNum STACK_POP -11.49
SetVarByNum STACK_POP 6.96
SetVarByNum STACK_POP 11.37
SetVarByNum STACK_POP 11.76
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 36
CalcKnockback var23 ODamage 9 5 100 OWeight 0
Return
// fair
label fair
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -0.18
SetVarByNum STACK_POP -0.5
SetVarByNum STACK_POP 7.48
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 38
CalcKnockback var23 ODamage 11 10 100 OWeight 0
Return
// fair_strong
label fair_strong
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP 0.56
SetVarByNum STACK_POP -0.5
SetVarByNum STACK_POP 7.11
SetVarByNum STACK_POP 3.5
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 38
CalcKnockback var23 ODamage 15 10 100 OWeight 0
Return
// bair
label bair
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -20.29
SetVarByNum STACK_POP 1.78
SetVarByNum STACK_POP 9.49
SetVarByNum STACK_POP 4.61
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 28
CalcKnockback var23 ODamage 12 15 95 OWeight 0
Return
// uair
label uair
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -3.97
SetVarByNum STACK_POP -6.41
SetVarByNum STACK_POP 9.43
SetVarByNum STACK_POP 8.9
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 31
CalcKnockback var23 ODamage 12 20 90 OWeight 0
Return
// uair_late
label uair_late
var22 = STACK_POP
SetVarByNum var22 361
SetVarByNum STACK_POP -12.35
SetVarByNum STACK_POP -9.55
SetVarByNum STACK_POP 7.79
SetVarByNum STACK_POP 7.33
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 31
CalcKnockback var23 ODamage 8 5 100 OWeight 0
Return
// dair
label dair
var22 = STACK_POP
SetVarByNum var22 270
SetVarByNum STACK_POP -5.34
SetVarByNum STACK_POP 8.05
SetVarByNum STACK_POP 5.19
SetVarByNum STACK_POP 7.78
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 39
CalcKnockback var23 ODamage 15 30 80 OWeight 0
Return
endif
PRINTLN
SetVarByNum STACK_POP var23
Goto __ANGLE_FIX__
Return
elif Equal var22 12
  var22 = 9
elif Equal var22 13
  var22 = 4
elif Equal var22 14
  var22 = 8
elif Equal var22 15
  var22 = 25
elif Equal var22 16
  var22 = 30
elif Equal var22 17
  var22 = 50
elif Equal var22 18
  var22 = -40
elif Equal var22 100
  var22 = 0
if !(True) || Equal var20 15|| Equal var20 17|| Equal var20 23|| Equal var20 24|| Equal var20 25|| Equal var20 26|| Equal var20 27|| Equal var20 28|| Equal var20 29|| Equal var20 30
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
if !(True) || Equal var20 13 || Equal var20 27 || Equal var20 29
  var22 = -1
elif !(True) || Equal var20 7 || Equal var20 11 || Equal var20 16 || Equal var20 17 || Equal var20 23 || Equal var20 24 || Equal var20 30
  var22 = 0
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 12 || Equal var20 14 || Equal var20 15 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 25 || Equal var20 26 || Equal var20 28
  var22 = 1
endif
elif Equal var22 0.002
if !(True) || Equal var20 16 || Equal var20 17 || Equal var20 27 || Equal var20 30
  var22 = -1
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26
  var22 = 0
elif !(True) || Equal var20 7 || Equal var20 28 || Equal var20 29
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
