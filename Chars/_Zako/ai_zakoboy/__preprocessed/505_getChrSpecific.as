#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal var22 19 || Equal var22 19.1
  // chr cs moveData
if Equal var22 19.1
  if var20 >= 0 && var20 < 15
    GotoByValue var20
    Return
    if !(True)
      label _jab123Str
      LOGSTR 1784766976 825373440 0 0 0
      Return
      label _jab123_2Str
      LOGSTR 1784766976 825373440 1597112320 0 0
      Return
      label _jab123_3Str
      LOGSTR 1784766976 825373440 1597177856 0 0
      Return
      label _dashattackStr
      LOGSTR 1684108032 1751217152 1952539392 1795162112 0
      Return
      label _ftiltStr
      LOGSTR 1718905088 1819541504 0 0 0
      Return
      label _utiltStr
      LOGSTR 1970563328 1819541504 0 0 0
      Return
      label _dtiltStr
      LOGSTR 1685350656 1819541504 0 0 0
      Return
      label _fsmashStr
      LOGSTR 1718840576 1634953216 0 0 0
      Return
      label _usmashStr
      LOGSTR 1970498816 1634953216 0 0 0
      Return
      label _dsmashStr
      LOGSTR 1685286144 1634953216 0 0 0
      Return
      label _nairStr
      LOGSTR 1851877632 1912602624 0 0 0
      Return
      label _fairStr
      LOGSTR 1717659904 1912602624 0 0 0
      Return
      label _bairStr
      LOGSTR 1650551040 1912602624 0 0 0
      Return
      label _uairStr
      LOGSTR 1969318144 1912602624 0 0 0
      Return
      label _dairStr
      LOGSTR 1684105472 1912602624 0 0 0
      Return
    endif
  else
    LOGSTR 1313808384 1297044992 1157627904 0 0
    Return
  endif
Return
endif
if var20 >= 0 && var20 < 15
  var22 = var20 + 15
  GotoByValue var22
  Goto __ANGLE_FIX__
  Return
else
  SetVarAttackData -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1
  var23 = -1
  Return
endif
if !(True)
// jab123; 0
label jab123
  SetVarAttackData -1 -8 8 4.5 2 3 22 3 1 20 100
  var22 = 80
  Return
// jab123_2; 1
label jab123_2
  SetVarAttackData 1 -8 9.5 4 4 3 21 2 1 20 100
  var22 = 80
  Return
// jab123_3; 2
label jab123_3
  SetVarAttackData 3 -8 10 6 5 7 41 7 0 10 70
  var22 = 70
  Return
// dashattack; 3
label dashattack
  SetVarAttackData 13 -4 14 7 6 10 40 10 0 30 70
  var22 = 361
  Return
// ftilt; 4
label ftilt
  SetVarAttackData 3 -3 11.5 9 8 3 37 10 0 10 100
  var22 = 361
  Return
// utilt; 5
label utilt
  SetVarAttackData 0 5 13.5 20 16 5 46 13 0 40 80
  var22 = 361
  Return
// dtilt; 6
label dtilt
  SetVarAttackData 2 1 13.5 8 10 5 36 10 0 25 75
  var22 = 80
  Return
// fsmash; 7
label fsmash
  SetVarAttackData 5 -7 16.5 5 6 4 66 17 0 20 100
  var22 = 361
  Return
// usmash; 8
label usmash
  SetVarAttackData -4 -3 9.5 18 13 8 63 13 0 30 128
  var22 = 83
  Return
// dsmash; 9
label dsmash
  SetVarAttackData -28 -1 25 11 7 13 61 16 0 30 100
  var22 = 361
  Return
// nair; 10
label nair
  SetVarAttackData -3 -2 11.5 10 6 23 55 7 0 40 100
  var22 = 361
  Return
// fair; 11
label fair
  SetVarAttackData -8 -2 11.5 6.5 13 17 46 10 0 20 100
  var22 = 361
  Return
// bair; 12
label bair
  SetVarAttackData -19 -3 8.5 7 9 8 40 12 0 20 100
  var22 = 361
  Return
// uair; 13
label uair
  SetVarAttackData -18 -8 18.5 13.5 5 8 34 13 0 10 100
  var22 = 361
  Return
// dair; 14
label dair
  SetVarAttackData -5 11 6.5 14.5 15 5 55 14 0 40 100
  var22 = 270
  Return
endif
Return
elif Equal var22 12
  // chr cs dashForceTurnFrame
  var22 = 10
elif Equal var22 13
  // chr cs dashDanceMinFrames
  var22 = 3
elif Equal var22 14
  // chr cs shortHopHeight
  var22 = 10.31
elif Equal var22 15
  // chr cs djumpHeight
  var22 = 35.57
elif Equal var22 16
  // chr cs wavedashDist
  var22 = 20
elif Equal var22 17
  // chr cs recoveryDistX
  var22 = 40
elif Equal var22 18
  // chr cs recoveryDistY
  STACK_PUSH var23 0
  if var21 >= 16.7
    var22 = 20
    var22 -= 10
    var22 *= 0.9
  else
    var22 = 0
  endif
  var22 += HurtboxSize
  if NumJumps > 0
    var23 = NumJumps - 1
    var23 *= 35.57 * 0.7
    var23 += 35.57
    var22 += var23
  endif
//   {RECOVERY_ADDITIONS}
  var23 = BBoundary * -1
  var23 -= 25
  // LOGSTR 1919251456 544367872 1667524864 1936982016 0
  // LOGVAL var22
  // LOGVAL var23
  // PRINTLN
  if var22 > var23
    var22 = var23
  endif
  // var22 -= 20
  var23 = STACK_POP
elif Equal var22 100
  // chr chk_isAerialAttack
  var22 = 0
if  var20 >= 10 && var20 <= 14
    var22 = 1
  endif
elif Equal var22 200
  // chr chk_OInCombo
  Goto saveTempRegs
  if XDistLE 70
    getCurrentPredictValue var17 4
    var23 = PT_AGGRESSION * 5 + 10
    // LOGVAL_NL var17
    if var17 > 200
      var22 = 0
      Goto restoreTempRegs
      Return
    elif var17 <= var23 || OFramesHitstun > 0
      var22 = 1
      // LOGSTR_NL 1230184448 1129270528 1112481792 674310400 0
      Goto restoreTempRegs
      Return
    endif
    if OCurrAction >= 66 && OCurrAction <= 89 && !(Equal OCurrAction 73)
    elif Equal OCurrAction 73 && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction 60
    else
      // LOGSTR_NL 1313821696 541282048 1296191232 1229866752 0
      var22 = 0
      Goto restoreTempRegs
      Return
    endif
    // LOGSTR_NL 1230184448 1129270528 1112481792 674375936 0
    var22 = 1
    Goto restoreTempRegs
    Return
  endif
  var22 = 0
  Goto restoreTempRegs
elif Equal var22 300
  // chr chk_actionableOnGround
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
  // chr get_moveDir
if Equal var20 12
  var22 = -1
elif Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 8 || Equal var20 10
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 0.002
  // chr get_moveDirY
if !(True)
  var22 = -1
elif !(True)
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 30000
  // evt gotHit

elif Equal var22 20000
  // evt chrChecks

elif Equal var22 10000
  // evt rangedHit

elif Equal var22 40000
  // evt checkDefend
  if var21 < 16.7 && !(Equal var21 16.4)
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
    if Equal var22 0 && !(Equal var21 12)
      // react to/read the opponent's attack patterns
      var22 = (1 - (LevelValue / 100)) * 30 + 4
      var22 *= PT_REACTION_TIME
      var23 = AnimFrame + 10
      MOD var17 var23 var22
      var23 = OAnimFrame + 10
      MOD var23 var23 var22
      if var17 > 1 && var23 > 1
      elif Equal OCurrAction 77 && OAnimFrame > 25
      // elif Equal AirGroundState 2 && var21 > 16
      elif var21 >= 10 && var21 <= 10.6
      elif Equal var21 16.3 || Equal var21 10.2 || Equal var21 10.6
      elif !(Equal var21 13) && OFramesHitstun <= 0 && !(CalledFrom Shield) && !(Equal var21 10.2)
        if OCurrAction < 66 || OCurrAction >= 72
          predictAverage var22 10
          var22 += 15
          var17 = OPos * var22
          GetYDistFloorOffset var17 var17 10 1
          if XDistLE var22 && var17 > 0
            GetCommitPredictChance var17
            // if Equal var21 10.5
            //   var17 *= 0.06 * PT_BAITCHANCE
            // endif
            if Rnd < var17 && Rnd < 0.7
              CallI DefendHub
            endif
          endif
        endif
      endif
    endif
  endif
elif Equal var22 0.003 || Equal var22 0.004
  // chr get_OEndlag
  Goto saveTempRegs
  STACK_PUSH var22 0
  var22 = -1
  RetrieveFullATKD var22 var17 var23 var23 var23 var23 var23 OCurrSubaction 1
  if Equal var22 0
    var22 = OEndFrame
  endif 
  if Equal OCurrAction 51 && OYDistFloor < 25
    if Equal OCurrSubaction AttackAirN
      GetAttribute var17 300 1
    elif Equal OCurrSubaction AttackAirF
      GetAttribute var17 304 1
    elif Equal OCurrSubaction AttackAirB
      GetAttribute var17 308 1
    elif Equal OCurrSubaction AttackAirHi
      GetAttribute var17 312 1
    elif Equal OCurrSubaction AttackAirLw
      GetAttribute var17 316 1
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
    GetAttribute var22 940 1
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
      var23 += Width
      var23 += OWidth
      if Equal var22 0
        var22 = OEndFrame
      endif 
      if OAnimFrame >= var17 || Equal OHitboxConnected 1
        var22 = var22 - OAnimFrame
        STACK_TOSS 1
        Goto restoreTempRegs
        Return
      elif !(XDistLE var23)
        var22 = STACK_POP
        Goto restoreTempRegs
        Return
      else
        var22 = -1
        STACK_TOSS 1
        Goto restoreTempRegs
        Return
      endif
      var22 = STACK_POP
      Goto restoreTempRegs
    endif
  else
    Goto restoreTempRegs
  endif
elif Equal var22 23
  Goto saveTempRegs
  if !(CalledFrom ExecuteAttack)
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
    var23 = 0
    if Equal var22 1
      var22 = 0
      Goto restoreTempRegs
      Return
    elif OYDistBackEdge < -10
    elif !(Equal var21 16.4) && var21 < 16.7
      var22 = OTopNY - TopNY
      if var22 <= 30
        var23 = 1
      endif
    endif
    if !(Equal var23 1) 
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
      if var22 <= 10
        var23 = 1
      endif
    endif

    if OCurrAction >= 96 && OCurrAction <= 97
      predictOOption var17 13
      predictionConfidence var22 13
      if var22 >= 0.3
        var22 = 0
        var23 = OPos * 20
        if Equal var17 1
          var22 -= var23
        elif Equal var17 3
          var22 += var23
        endif
      endif
    elif Equal var23 1
      GetAttribute var22 40 1
if  var20 >= 10 && var20 <= 14
        if var7 > 10
          var7 = 10
        endif
      endif
      var22 *= 0.4 * var7 * OPos
      predictOOption var17 9
      predictionConfidence var23 9  

      if Equal var17 1 && var23 >= 0.3
        predictOOption var23 8 
        predictAverage var17 10
        var17 *= OPos
        if Equal var21 16.3
        elif Equal var23 3
          // LOGSTR_NL 1431192576 1163023104 1213157120 1409286144 0
          var23 = OXSpeed
          var23 *= OPos
          if OCurrAction >= 2 && OCurrAction <= 25 && var23 >= 0
          else
            var22 *= 5
          endif
          var22 = var17 * -1
          var22 -= var22
        elif Equal var23 2
          // LOGSTR_NL 1331053824 1381189632 1330598912 0 0
          var22 = OPos * 15
          GetYDistFloorOffset var22 var22 5 1
          if !(Equal var22 -1)
            // var22 *= 5
            var22 = var17
            var22 += var22
          endif
        endif
      endif
    else 
      var22 = 0
    endif
  else 
    var22 = 0
  endif

  Goto restoreTempRegs
elif Equal var22 21
  // chr calc_certainty
  Goto saveTempRegs

  GetCommitPredictChance var23
  PredictOMov var22 12
  var23 += var22

  if var23 < 0.5
    var23 -= 1
    var23 *= -1
  endif

  var22 = var23
  Goto restoreTempRegs
elif Equal var22 22
  // chr calc_ORecoverPos
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
  if !(True)
    label esc_recovery
    EstOXCoord var0 var2
    EstOYCoord var1 var2
  endif
  SetVarByNum STACK_POP var0
  SetVarByNum STACK_POP var1
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
label saveTempRegs
STACK_PUSH var17 0
STACK_PUSH var23 0
Return
label restoreTempRegs
var23 = STACK_POP
var17 = STACK_POP
Return
Return
