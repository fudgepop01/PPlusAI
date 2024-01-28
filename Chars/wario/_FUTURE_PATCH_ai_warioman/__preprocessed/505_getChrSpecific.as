#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal var22 19 || Equal var22 19.1
if Equal var22 19.1
Return
endif
if var20 >= 0 && var20 < 28
  GotoByValue var20
  Goto __ANGLE_FIX__
  Return
else
  SetVarAttackData -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
  var23 = -1
  Return
endif
if !(True)
// jab123
label jab123
  SetVarAttackData -4 3 10.5 8 3 2 7 4 0 25 20
  var22 = 72
  Return
// jab123_2
label jab123_2
  SetVarAttackData 1 3 10.5 9.75 4 2 6 4 0 25 20
  var22 = 30
  Return
// dashattack
label dashattack
  SetVarAttackData 8.93 8 19.59 10 4 19 10 12 0 60 75
  var22 = 70
  Return
// ftilt
label ftilt
  SetVarAttackData -1.5 -0.36 13.85 8.01 14 3 17 16 0 35 100
  var22 = 38
  Return
// utilt
label utilt
  SetVarAttackData -15 0 15 12.5 12 15 18 15 0 65 74
  var22 = 90
  Return
// dtilt
label dtilt
  SetVarAttackData 6 1 10 5 5 4 9 9 0 30 80
  var22 = 30
  Return
// fsmash
label fsmash
  SetVarAttackData 4.46 -3.02 12.44 7.84 9 14 34 20 0 30 77
  var22 = 361
  Return
// usmash
label usmash
  SetVarAttackData -38 22 38 38 12 18 31 15 0 60 90
  var22 = 50
  Return
// dsmash
label dsmash
  SetVarAttackData -32 10 32 12 11 3 31 18 1 25 80
  var22 = 275
  Return
// uspecial
label uspecial
  SetVarAttackData -13 2.41 13 37.74 2 23 44 14 0 50 100
  var22 = 80
  Return
// uspecialair
label uspecialair
  SetVarAttackData -13 2.41 13 37.74 2 23 44 14 0 50 100
  var22 = 80
  Return
// sspecial
label sspecial
  SetVarAttackData 69.07 1.37 28.2 5.92 26 12 56 26 0 50 80
  var22 = 361
  Return
// sspecial_mid
label sspecial_mid
  SetVarAttackData 27.74 1.37 48.86 5.92 6 32 56 21 0 50 85
  var22 = 361
  Return
// sspecial_jump
label sspecial_jump
  SetVarAttackData -3.014 2.156 56.294 19.131 1 41 51 15 0 20 100
  var22 = 361
  Return
// sspecialair
label sspecialair
  SetVarAttackData 6.5 -2.48 21.95 6.61 11 14 45 15 0 50 80
  var22 = 361
  Return
// grab
label grab
  SetVarAttackData 3.5 -2.5 6 4.5 2 35 32 0 0 0 0
  var22 = 0
  Return
// grab_dash
label grab_dash
  SetVarAttackData -5.25 -1.75 43.519 4.75 2 35 32 0 0 0 0
  var22 = 0
  Return
// fthrow
label fthrow
  SetVarAttackData 3.5 -2.5 6 4.5 2 36 38 3 0 60 100
  var22 = 40
  Return
// dthrow
label dthrow
  SetVarAttackData 3.5 -2.5 6 4.5 2 28 48 13 0 130 0
  var22 = 90
  Return
// bthrow
label bthrow
  SetVarAttackData 3.5 -2.5 6 4.5 2 26 78 15 0 60 100
  var22 = 45
  Return
// uthrow
label uthrow
  SetVarAttackData 3.5 -2.5 6 4.5 2 24 46 13 0 60 100
  var22 = 90
  Return
// nair
label nair
  SetVarAttackData -16 3 15.5 8 4 3 21 15 0 30 90
  var22 = 361
  Return
// nair_fall
label nair_fall
  SetVarAttackData -16 3 15.5 9 4 34 21 12 0 20 100
  var22 = 361
  Return
// fair
label fair
  SetVarAttackData -6 5 13.5 10.5 5 2 19 15 0 20 90
  var22 = 35
  Return
// fair_fall
label fair_fall
  SetVarAttackData -6 5 13.5 10.5 5 10 19 11 0 15 90
  var22 = 35
  Return
// bair
label bair
  SetVarAttackData -22.65 3.09 9.02 8.25 10 9 22 15 0 20 90
  var22 = 361
  Return
// uair
label uair
  SetVarAttackData -15 3 15 15 8 1 9 18 0 35 80
  var22 = 75
  Return
// dair
label dair
  SetVarAttackData -6.2 2.95 5.7 5.7 15 14 33 17 0 60 80
  var22 = 270
  Return
endif
Return
elif Equal var22 12
  var22 = 9
elif Equal var22 13
  var22 = 3
elif Equal var22 14
  var22 = 12.03
elif Equal var22 15
  var22 = 58.8
elif Equal var22 16
  var22 = 15
elif Equal var22 17
  var22 = 60
elif Equal var22 18
  STACK_PUSH var23 0
  if var21 >= 16.7
    var22 = 50
    var22 -= 10
  else
    var22 = 0
  endif
  var23 = HurtboxSize * 1.5
  var22 += var23
  if NumJumps > 0
    var23 = NumJumps - 1
    var23 *= 58.8 * 0.7
    var23 += 58.8
    var22 += var23
  endif
//   {RECOVERY_ADDITIONS}
  var23 = BBoundary * -1
  var23 -= 15
  // LOGSTR 1919251456 544367872 1667524864 1936982016 0
  // LOGVAL var22
  // LOGVAL var23
  // PRINTLN
  if var22 > var23
    var22 = var23
  endif
  var23 = STACK_POP
elif Equal var22 100
  var22 = 0
if  Equal var20 10 || Equal var20 14 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27
    var22 = 1
  endif
elif Equal var22 200
  if XDistLE 70
    getCurrentPredictValue var17 4
    var23 = PT_AGGRESSION * 5 + 10
    // LOGVAL_NL var17
    if var17 > 200
      var22 = 0
      Return
    elif var17 <= var23 || OFramesHitstun > 0
      var22 = 1
      // LOGSTR_NL 1230184448 1129270528 1112481792 674310400 0
      Return
    endif
    if OCurrAction >= 66 && OCurrAction <= 89 && !(Equal OCurrAction 73)
    elif Equal OCurrAction 73 && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction 60
    else
      // LOGSTR_NL 1313821696 541282048 1296191232 1229866752 0
      var22 = 0
      Return
    endif
    // LOGSTR_NL 1230184448 1129270528 1112481792 674375936 0
    var22 = 1
    Return
  endif
  var22 = 0
elif Equal var22 300
  var22 = 0
  if Equal CanCancelAttack 1
  elif Equal HitboxConnected 1 && HasCurry
  elif CurrAction >= 103 && CurrAction <= 109
  elif Equal CurrAction 22 
    if Equal PrevAction 33
      Return
    elif AnimFrame <= 3
      Return
    endif
  elif CurrAction >= 24 && !(Equal CurrAction 73) && !(Equal CurrAction 103) && !(Equal CurrAction 108)
    Return
  endif
  var22 = 1
elif Equal var22 0.001
if Equal var20 25
  var22 = -1
elif Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 5 || Equal var20 6 || Equal var20 11 || Equal var20 12 || Equal var20 13 || Equal var20 14 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 23 || Equal var20 24
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 0.002
if !(True)
  var22 = -1
elif !(True)
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 30000

elif Equal var22 20000

elif Equal var22 10000

elif Equal var22 40000

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
    
  elif Equal OCurrAction 24
    var22 = OEndFrame - OAnimFrame
    var22 *= 0.65
  elif OCurrAction >= 30 && OCurrAction <= 32
    var22 = OEndFrame - OAnimFrame
  elif Equal OCurrAction 33 && OYDistFloor > 15
    var22 = 35
  elif Equal OCurrAction 16 && OYDistFloor > 0
    var22 = OYDistFloor * 0.5
  elif Equal OCurrAction 26 || Equal OCurrAction 27 || Equal OCurrAction 28
    GetAttribute var22 940; 1
    var22 = 10 + var22
  elif Equal OCurrAction 29
    GetRaBasic var17 5 1
    var22 = var17 + 15
  elif OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274
    if Equal var22 0
      var22 = OEndFrame
    endif 
    var22 = var22 - OAnimFrame
  elif OCurrAction >= 74 && OCurrAction <= 101
    var22 = OEndFrame - OAnimFrame
  elif OCurrAction >= 119 && OCurrAction <= 120
    var22 = OEndFrame - OAnimFrame
  elif OFramesHitstun > 0
    if Equal OAirGroundState 1
      var22 = 8
    else
      var22 = OFramesHitstun + OFramesHitlag
    endif
  endif
  if var22 > -1
    var22 += 5
  endif
  if Equal STACK_POP 0.004
    if OCurrAction >= 36 && OCurrAction <= 52 || OCurrAction >= 274
      STACK_PUSH var22 0

      RetrieveFullATKD var22 -1 var17 -1 var23 -1 -1 OCurrSubaction 1
      if Equal var22 0
        var22 = OEndFrame
      endif 
      if OAnimFrame >= var17 || Equal OHitboxConnected 1
        var22 = var22 - OAnimFrame
        STACK_TOSS 1
        Return
      elif !(XDistLE var23)
        var22 = STACK_POP
        Return
      else
        var22 = -1
        STACK_TOSS 1
        Return
      endif
      var22 = STACK_POP
    endif
  endif
elif Equal var22 21
  GetCommitPredictChance var23
  PredictOMov var22 12
  var23 += var22

  if var23 < 0.5
    var23 -= 1
    var23 *= -1
  endif

  var22 = var23
elif Equal var22 22
  // STACK = [framesAhead, xVarTarget, yVarTarget]

  var2 = STACK_POP
  if OCurrAction >= 256


    var22 = OCurrAction + 256
    RetrieveFullATKD var3 var4 var5 var6 var22 var22 var22 var22 1
    if Equal var3 -1
      SeekNoCommit esc_recovery
    endif
    // move_lastHitFrame += 6
    var0 = OTopNX
    var1 = OTopNY
    if Equal var3 0
    elif Equal var3 3




      var22 = var4 - var2
      if XDistLE var5 || OActionTimer > var4
      else
        var6 *= ODirection
        var0 += var6
      endif
    elif Equal var3 2




      var22 = var4 - var2
      if XDistLE var5 || OActionTimer > var4
      else
        var1 += var6
      endif
    elif Equal var3 1



      
      Norm var22 OXSpeed OYSpeed
      Abs var22
      if Equal var22 0
        SeekNoCommit esc_recovery
      endif 
      var23 = var22
      var22 = 1 / var23
      var17 = OXSpeed * var22
      var22 = OYSpeed * var22

      var17 *= var6
      var22 *= var6
      
      var23 = var2 + OActionTimer
      if var23 > var4
        // mult totalDist by (OActionTimer + var2) / totalTime
        var5 -= var4
        if var23 > var5
          var23 = var5
        endif
        // var23 = var5 - var23
        var23 -= OActionTimer
        var23 /= var5
        var17 *= var23
        var22 *= var23
        var0 += var17
        var1 += var22
      endif
    endif
  else
    SeekNoCommit esc_recovery
  endif
  SetVarByNum STACK_POP var0
  SetVarByNum STACK_POP var1
  if !(True)
    label esc_recovery
    STACK_TOSS 2
  endif
endif
Return
label __ANGLE_FIX__
// if CalledFrom CheckAttackWillHit
//   LOGSTR 1634625280 1818558464 0 0 0
//   LOGVAL var22
// endif
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
// if CalledFrom CheckAttackWillHit
//   LOGSTR 1886351360 1885692928 1449226752 0 0
//   LOGVAL var23
//   PRINTLN
// endif
SetVarByNum var23 var22
Return
Return
