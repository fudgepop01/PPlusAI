#include <Definition_AIMain.h>
id 0x8505
unk 0x0

XReciever

if Equal var22 19
if var20 >= 0 && var20 < 23
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
// dashattack
label dashattack
var22 = STACK_POP
SetVarByNum STACK_POP 9.31
SetVarByNum STACK_POP -2.79
SetVarByNum STACK_POP 10.78
SetVarByNum STACK_POP 6.41
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 90
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 10 22 90 OWeight 0
Return
// ftilt
label ftilt
var22 = STACK_POP
SetVarByNum STACK_POP 2.35
SetVarByNum STACK_POP -8.15
SetVarByNum STACK_POP 9.53
SetVarByNum STACK_POP 4.39
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 11 10 100 OWeight 0
Return
// utilt
label utilt
var22 = STACK_POP
SetVarByNum STACK_POP -0.24
SetVarByNum STACK_POP 3.79
SetVarByNum STACK_POP 10.77
SetVarByNum STACK_POP 15.57
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 50
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 13 50 80 OWeight 0
Return
// dtilt
label dtilt
var22 = STACK_POP
SetVarByNum STACK_POP 0.59
SetVarByNum STACK_POP 1.61
SetVarByNum STACK_POP 11.23
SetVarByNum STACK_POP 5.23
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 5
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 25
SetVarByNum STACK_POP 75
STACK_PUSH var22 0
var22 = 70
CalcKnockback var23 ODamage 12 25 75 OWeight 0
Return
// fsmash
label fsmash
var22 = STACK_POP
SetVarByNum STACK_POP 5.73
SetVarByNum STACK_POP -5.3
SetVarByNum STACK_POP 10.91
SetVarByNum STACK_POP 4.24
SetVarByNum STACK_POP 19
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 60
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 24
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 20 24 100 OWeight 0
Return
// usmash
label usmash
var22 = STACK_POP
SetVarByNum STACK_POP -2.55
SetVarByNum STACK_POP -2.89
SetVarByNum STACK_POP 8.37
SetVarByNum STACK_POP 13.9
SetVarByNum STACK_POP 22
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 126
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 13 30 126 OWeight 0
Return
// dsmash
label dsmash
var22 = STACK_POP
SetVarByNum STACK_POP 4.7
SetVarByNum STACK_POP -6.99
SetVarByNum STACK_POP 7.9
SetVarByNum STACK_POP 4.79
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 18
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 18 30 100 OWeight 0
Return
// dsmash_late
label dsmash_late
var22 = STACK_POP
SetVarByNum STACK_POP -19.56
SetVarByNum STACK_POP -3.95
SetVarByNum STACK_POP 7.05
SetVarByNum STACK_POP 4.37
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 16 20 100 OWeight 0
Return
// sspecial
label sspecial
var22 = STACK_POP
SetVarByNum STACK_POP -1.56
SetVarByNum STACK_POP -1.41
SetVarByNum STACK_POP 11.08
SetVarByNum STACK_POP 9.11
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 26
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 78
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 90
CalcKnockback var23 ODamage 7 78 80 OWeight 0
Return
// grab
label grab
var22 = STACK_POP
SetVarByNum STACK_POP -0.91
SetVarByNum STACK_POP -5.94
SetVarByNum STACK_POP 5.82
SetVarByNum STACK_POP 3.91
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
SetVarByNum STACK_POP -0.91
SetVarByNum STACK_POP -5.94
SetVarByNum STACK_POP 5.82
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 34
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 105
STACK_PUSH var22 0
var22 = 45
CalcKnockback var23 ODamage 4 45 105 OWeight 0
Return
// dthrow
label dthrow
var22 = STACK_POP
SetVarByNum STACK_POP -0.91
SetVarByNum STACK_POP -5.94
SetVarByNum STACK_POP 5.82
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 41
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 75
SetVarByNum STACK_POP 34
STACK_PUSH var22 0
var22 = 65
CalcKnockback var23 ODamage 7 75 34 OWeight 0
Return
// bthrow
label bthrow
var22 = STACK_POP
SetVarByNum STACK_POP -0.91
SetVarByNum STACK_POP -5.94
SetVarByNum STACK_POP 5.82
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 38
SetVarByNum STACK_POP 43
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 30
SetVarByNum STACK_POP 130
STACK_PUSH var22 0
var22 = 45
CalcKnockback var23 ODamage 4 30 130 OWeight 0
Return
// uthrow
label uthrow
var22 = STACK_POP
SetVarByNum STACK_POP -0.91
SetVarByNum STACK_POP -5.94
SetVarByNum STACK_POP 5.82
SetVarByNum STACK_POP 3.91
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 39
SetVarByNum STACK_POP 45
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 70
SetVarByNum STACK_POP 105
STACK_PUSH var22 0
var22 = 85
CalcKnockback var23 ODamage 3 70 105 OWeight 0
Return
// nair
label nair
var22 = STACK_POP
SetVarByNum STACK_POP -3.17
SetVarByNum STACK_POP -0.82
SetVarByNum STACK_POP 9.96
SetVarByNum STACK_POP 6.11
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP -8
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 1
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 74
CalcKnockback var23 ODamage 6 40 100 OWeight 1
Return
// nair_hit2
label nair_hit2
var22 = STACK_POP
SetVarByNum STACK_POP -3.17
SetVarByNum STACK_POP -0.82
SetVarByNum STACK_POP 9.96
SetVarByNum STACK_POP 8.49
SetVarByNum STACK_POP 20
SetVarByNum STACK_POP 9
SetVarByNum STACK_POP 44
SetVarByNum STACK_POP 7
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 7 40 100 OWeight 0
Return
// fair
label fair
var22 = STACK_POP
SetVarByNum STACK_POP 0.39
SetVarByNum STACK_POP -0.84
SetVarByNum STACK_POP 5.95
SetVarByNum STACK_POP 5.77
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP -14
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 18
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 24
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 32
CalcKnockback var23 ODamage 18 24 100 OWeight 0
Return
// fair_weak
label fair_weak
var22 = STACK_POP
SetVarByNum STACK_POP 1.09
SetVarByNum STACK_POP -0.77
SetVarByNum STACK_POP 5.65
SetVarByNum STACK_POP 5.78
SetVarByNum STACK_POP 17
SetVarByNum STACK_POP 13
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 35
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 6 35 80 OWeight 0
Return
// bair
label bair
var22 = STACK_POP
SetVarByNum STACK_POP -16.52
SetVarByNum STACK_POP -1.13
SetVarByNum STACK_POP 7.83
SetVarByNum STACK_POP 6.24
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 3
SetVarByNum STACK_POP 28
SetVarByNum STACK_POP 14
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = -361
CalcKnockback var23 ODamage 14 0 100 OWeight 0
Return
// uair
label uair
var22 = STACK_POP
SetVarByNum STACK_POP -5.5
SetVarByNum STACK_POP -2.37
SetVarByNum STACK_POP 11.48
SetVarByNum STACK_POP 12.13
SetVarByNum STACK_POP 6
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 12
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 361
CalcKnockback var23 ODamage 12 10 100 OWeight 0
Return
// uair_tipman
label uair_tipman
var22 = STACK_POP
SetVarByNum STACK_POP -16.75
SetVarByNum STACK_POP -6.93
SetVarByNum STACK_POP 10.32
SetVarByNum STACK_POP 9.85
SetVarByNum STACK_POP 11
SetVarByNum STACK_POP 2
SetVarByNum STACK_POP 29
SetVarByNum STACK_POP 10
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 8
SetVarByNum STACK_POP 80
STACK_PUSH var22 0
var22 = 150
CalcKnockback var23 ODamage 10 8 80 OWeight 0
Return
// dair
label dair
var22 = STACK_POP
SetVarByNum STACK_POP -5.76
SetVarByNum STACK_POP 10.97
SetVarByNum STACK_POP 6.75
SetVarByNum STACK_POP 12.8
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 270
CalcKnockback var23 ODamage 16 40 100 OWeight 0
Return
// dair_spike
label dair_spike
var22 = STACK_POP
SetVarByNum STACK_POP -5.4
SetVarByNum STACK_POP -3.01
SetVarByNum STACK_POP 5.49
SetVarByNum STACK_POP 5.81
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 4
SetVarByNum STACK_POP 37
SetVarByNum STACK_POP 16
SetVarByNum STACK_POP 0
SetVarByNum STACK_POP 40
SetVarByNum STACK_POP 100
STACK_PUSH var22 0
var22 = 290
CalcKnockback var23 ODamage 16 40 100 OWeight 0
Return
endif
Return
elif Equal var22 12
  var22 = 8
elif Equal var22 13
  var22 = 4
elif Equal var22 14
  var22 = 15.84
elif Equal var22 15
  var22 = 29.93
elif Equal var22 16
  var22 = 20
elif Equal var22 17
  var22 = 50
elif Equal var22 18
  var22 = -40
elif Equal var22 100
  var22 = 0
if !(True) || Equal var20 14|| Equal var20 15|| Equal var20 16|| Equal var20 17|| Equal var20 18|| Equal var20 19|| Equal var20 20|| Equal var20 21|| Equal var20 22
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
if !(True) || Equal var20 7 || Equal var20 18 || Equal var20 20
  var22 = -1
elif !(True) || Equal var20 21 || Equal var20 22
  var22 = 0
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 19
  var22 = 1
endif
elif Equal var22 0.002
if !(True) || Equal var20 21
  var22 = -1
elif !(True) || Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 22
  var22 = 0
elif !(True) || Equal var20 5 || Equal var20 19 || Equal var20 20
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