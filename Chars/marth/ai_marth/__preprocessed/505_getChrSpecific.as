#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal var22 19 || Equal var22 19.1
  // chr cs moveData
if Equal var22 19.1
  if var20 >= 0 && var20 < 38
    GotoByValue var20
    Return
    if !(True)
      label _jab123Str
      LOGSTR 1784766976 825373440 0 0 0
      Return
      label _jab123_strongStr
      LOGSTR 1784766976 825373440 1601401856 1919905280 1728053248
      Return
      label _dashattackStr
      LOGSTR 1684108032 1751217152 1952539392 1795162112 0
      Return
      label _dashattack_strongStr
      LOGSTR 1684108032 1751217152 1952539392 1801417472 1953656576
      Return
      label _ftiltStr
      LOGSTR 1718905088 1819541504 0 0 0
      Return
      label _utiltStr
      LOGSTR 1970563328 1819541504 0 0 0
      Return
      label _utilt_start_outerStr
      LOGSTR 1970563328 1819565824 1937006848 1920229120 1869968384
      Return
      label _utilt_end_outerStr
      LOGSTR 1970563328 1819565824 1701733376 1601139968 1952805376
      Return
      label _dtiltStr
      LOGSTR 1685350656 1819541504 0 0 0
      Return
      label _dtilt_outerStr
      LOGSTR 1685350656 1819565824 1869968384 1701969920 0
      Return
      label _fsmashStr
      LOGSTR 1718840576 1634953216 0 0 0
      Return
      label _fsmash_outerStr
      LOGSTR 1718840576 1634953216 1601139968 1952805376 0
      Return
      label _usmashStr
      LOGSTR 1970498816 1634953216 0 0 0
      Return
      label _usmash_strongStr
      LOGSTR 1970498816 1634953216 1601401856 1919905280 1728053248
      Return
      label _dsmashStr
      LOGSTR 1685286144 1634953216 0 0 0
      Return
      label _dsmash_hit1_outerStr
      LOGSTR 1685286144 1634953216 1600678144 1949392640 1869968384
      Return
      label _dsmash_hit2Str
      LOGSTR 1685286144 1634953216 1600678144 1949433856 0
      Return
      label _dsmash_hit2_outerStr
      LOGSTR 1685286144 1634953216 1600678144 1949458176 1869968384
      Return
      label _nspecialStr
      LOGSTR 1853059072 1701013760 1634467840 0 0
      Return
      label _nspecialairStr
      LOGSTR 1853059072 1701013760 1634492672 1769078784 0
      Return
      label _uspecialStr
      LOGSTR 1970499584 1701013760 1634467840 0 0
      Return
      label _uspecialairStr
      LOGSTR 1970499584 1701013760 1634492672 1769078784 0
      Return
      label _sspecialStr
      LOGSTR 1936945152 1701013760 1634467840 0 0
      Return
      label _grabStr
      LOGSTR 1735549184 1644167168 0 0 0
      Return
      label _fthrowStr
      LOGSTR 1718904832 1919907584 0 0 0
      Return
      label _dthrowStr
      LOGSTR 1685350400 1919907584 0 0 0
      Return
      label _bthrowStr
      LOGSTR 1651795968 1919907584 0 0 0
      Return
      label _uthrowStr
      LOGSTR 1970563072 1919907584 0 0 0
      Return
      label _nairStr
      LOGSTR 1851877632 1912602624 0 0 0
      Return
      label _nair_hit2_innerStr
      LOGSTR 1851877632 1918855168 1769222656 1600744960 1852142080
      Return
      label _nair_hit2_strongStr
      LOGSTR 1851877632 1918855168 1769222656 1601401856 1919905280
      Return
      label _fairStr
      LOGSTR 1717659904 1912602624 0 0 0
      Return
      label _fair_outerStr
      LOGSTR 1717659904 1918856960 1970562304 1912602624 0
      Return
      label _bairStr
      LOGSTR 1650551040 1912602624 0 0 0
      Return
      label _uairStr
      LOGSTR 1969318144 1912602624 0 0 0
      Return
      label _uair_outerStr
      LOGSTR 1969318144 1918856960 1970562304 1912602624 0
      Return
      label _dairStr
      LOGSTR 1684105472 1912602624 0 0 0
      Return
      label _dair_outerStr
      LOGSTR 1684105472 1918856960 1970562304 1912602624 0
      Return
    endif
  else
    LOGSTR 1313808384 1297044992 1157627904 0 0
    Return
  endif
Return
endif
if var20 >= 0 && var20 < 38
  var22 = var20 + 38
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
  SetVarAttackData 4.1 2.16 12.05 10.97 4 3 25 4 0 20 50
  var22 = 361
  Return
// jab123_strong; 1
label jab123_strong
  SetVarAttackData 14.09 2.16 7.06 10.97 4 3 25 6 0 30 60
  var22 = 361
  Return
// dashattack; 2
label dashattack
  SetVarAttackData 24.83 2.07 12.19 8 12 3 40 11 0 70 55
  var22 = 110
  Return
// dashattack_strong; 3
label dashattack_strong
  SetVarAttackData 38.37 2.07 5.42 6.66 12 3 40 12 0 70 55
  var22 = 110
  Return
// ftilt; 4
label ftilt
  SetVarAttackData 2.73 -0.76 13.49 12.87 7 3 35 9 0 30 70
  var22 = 361
  Return
// utilt; 5
label utilt
  SetVarAttackData 2.14 -10.18 5.86 5.5 6 2 31 8 0 40 116
  var22 = 361
  Return
// utilt_start_outer; 6
label utilt_start_outer
  SetVarAttackData 4.63 -6.7 8.87 12.41 6 2 31 12 0 50 100
  var22 = 70
  Return
// utilt_end_outer; 7
label utilt_end_outer
  SetVarAttackData -11.93 -8.71 12.77 11.51 9 3 31 13 0 50 100
  var22 = 95
  Return
// dtilt; 8
label dtilt
  SetVarAttackData 7.71 2.84 10.89 6.61 7 2 19 9 0 40 40
  var22 = 30
  Return
// dtilt_outer; 9
label dtilt_outer
  SetVarAttackData 21.28 2.84 4.11 4.15 7 2 19 10 0 50 40
  var22 = 30
  Return
// fsmash; 10
label fsmash
  SetVarAttackData 4.93 3.57 14.14 16.41 11 3 48 14 0 60 70
  var22 = 361
  Return
// fsmash_outer; 11
label fsmash_outer
  SetVarAttackData 9.24 3.17 11.98 16.21 11 3 48 20 0 80 70
  var22 = 361
  Return
// usmash; 12
label usmash
  SetVarAttackData -4.41 -16.36 4.78 5.07 9 4 41 15 0 30 80
  var22 = 90
  Return
// usmash_strong; 13
label usmash_strong
  SetVarAttackData -4.31 -23.43 4.39 4.68 9 4 41 18 0 60 80
  var22 = 90
  Return
// dsmash; 14
label dsmash
  SetVarAttackData 2.16 -1.16 10.73 4.87 6 2 62 11 0 70 72
  var22 = 75
  Return
// dsmash_hit1_outer; 15
label dsmash_hit1_outer
  SetVarAttackData 20.16 0.53 3.91 3.91 6 2 62 16 0 70 100
  var22 = 70
  Return
// dsmash_hit2; 16
label dsmash_hit2
  SetVarAttackData -17.54 0.34 10.03 4.9 21 2 62 11 0 30 100
  var22 = -361
  Return
// dsmash_hit2_outer; 17
label dsmash_hit2_outer
  SetVarAttackData -21.89 1.26 3.91 3.91 21 2 62 16 0 70 100
  var22 = 105
  Return
// nspecial; 18
label nspecial
  SetVarAttackData -1.05 3.96 13.23 16.03 17 5 46 7 0 34 100
  var22 = 361
  Return
// nspecialair; 19
label nspecialair
  SetVarAttackData -1.05 3.96 13.23 16.03 17 5 46 7 0 34 100
  var22 = 361
  Return
// uspecial; 20
label uspecial
  SetVarAttackData 6.67 -0.46 3.91 3.91 5 0 141 13 0 80 70
  var22 = 361
  Return
// uspecialair; 21
label uspecialair
  SetVarAttackData 3.46 0.62 3.91 3.91 5 0 141 10 0 60 70
  var22 = 74
  Return
// sspecial; 22
label sspecial
  SetVarAttackData 2.64 2.49 11.86 14.11 6 2 29 4 0 55 25
  var22 = 96
  Return
// grab; 23
label grab
  SetVarAttackData 4.18 -4.63 7.28 4.36 7 0 32 0 0 0 0
  var22 = 0
  Return
// fthrow; 24
label fthrow
  SetVarAttackData 4.18 -4.63 7.28 4.36 7 13 33 4 0 70 45
  var22 = 50
  Return
// dthrow; 25
label dthrow
  SetVarAttackData 4.18 -4.63 7.28 4.36 7 13 44 5 0 65 50
  var22 = 50
  Return
// bthrow; 26
label bthrow
  SetVarAttackData 4.18 -4.63 7.28 4.36 7 6 41 4 0 70 60
  var22 = 117
  Return
// uthrow; 27
label uthrow
  SetVarAttackData 4.18 -4.63 7.28 4.36 7 11 46 4 0 60 130
  var22 = 87
  Return
// nair; 28
label nair
  SetVarAttackData -4.7 -4.63 11.99 5.87 6 1 49 4 0 30 40
  var22 = 100
  Return
// nair_hit2_inner; 29
label nair_hit2_inner
  SetVarAttackData -16.24 -0.66 17.76 11.01 6 15 49 10 0 50 80
  var22 = 361
  Return
// nair_hit2_strong; 30
label nair_hit2_strong
  SetVarAttackData -4.42 -4.63 4.53 3.91 15 6 49 10 0 50 80
  var22 = 361
  Return
// fair; 31
label fair
  SetVarAttackData -3.13 1.07 9.04 10.45 4 3 29 9 0 20 70
  var22 = 361
  Return
// fair_outer; 32
label fair_outer
  SetVarAttackData 7.49 0.8 6.42 12.81 4 3 29 13 0 42 70
  var22 = 67
  Return
// bair; 33
label bair
  SetVarAttackData -23.66 2.65 12.77 14.84 7 4 34 10 0 30 70
  var22 = -361
  Return
// uair; 34
label uair
  SetVarAttackData -14.71 -8.42 15.81 10.69 5 3 43 10 0 30 70
  var22 = 80
  Return
// uair_outer; 35
label uair_outer
  SetVarAttackData -14.71 -10.41 15.81 9.7 5 3 43 13 0 40 70
  var22 = 90
  Return
// dair; 36
label dair
  SetVarAttackData -18 8.5 16.38 10.78 6 3 59 10 0 40 70
  var22 = 80
  Return
// dair_outer; 37
label dair_outer
  SetVarAttackData -18 8.5 16.38 10.39 6 3 59 13 0 40 70
  var22 = 290
  Return
endif
Return
elif Equal var22 12
  // chr cs dashForceTurnFrame
  var22 = 13
elif Equal var22 13
  // chr cs dashDanceMinFrames
  var22 = 3
elif Equal var22 14
  // chr cs shortHopHeight
  var22 = 14.77
elif Equal var22 15
  // chr cs djumpHeight
  var22 = 26.23
elif Equal var22 16
  // chr cs wavedashDist
  var22 = 42
elif Equal var22 17
  // chr cs recoveryDistX
  var22 = 80
elif Equal var22 18
  // chr cs recoveryDistY
  STACK_PUSH var23 0
  if var21 >= 16.7
    var22 = 40
    var22 -= 10
    var22 *= 0.9
  else
    var22 = 0
  endif
  var22 += HurtboxSize
  if NumJumps > 0
    var23 = NumJumps - 1
    var23 *= 26.23 * 0.7
    var23 += 26.23
    var22 += var23
  endif
//   {RECOVERY_ADDITIONS}
  var23 = BBoundary * -1
  var23 -= 25
  // LOGSTR str("ret recdist")
  // LOGVAL chr_trait_return
  // LOGVAL anotherTempVar
  // PRINTLN
  if var22 > var23
    var22 = var23
  endif
  // chr_trait_return -= 20
  var23 = STACK_POP
elif Equal var22 100
  // chr chk_isAerialAttack
  var22 = 0
if  Equal var20 19 || Equal var20 21 || var20 >= 28 && var20 <= 37
    var22 = 1
  endif
elif Equal var22 200
  // chr chk_OInCombo
  Goto saveTempRegs
  if XDistLE 60 || OFramesHitstun > 0
    getCurrentPredictValue var17 4
    var23 = PT_AGGRESSION * 5 + 10
    // LOGSTR_NL str("posthitstun")
    // LOGVAL_NL globTempVar
    if var17 > 200
      var22 = 0
      Goto restoreTempRegs
      Return
    elif var17 <= var23 || OFramesHitstun > 0
      var22 = 1
      // LOGSTR_NL str("IS COMBO (1)")
      Goto restoreTempRegs
      Return
    endif
    if OCurrAction >= 66 && OCurrAction <= 89 && !(Equal OCurrAction 73)
    elif Equal OCurrAction 73 && OYDistFloor > 15
    elif Equal HitboxConnected 1 || Equal PrevAction 60
    else
      // LOGSTR_NL str("NOT COMBOING")
      var22 = 0
      Goto restoreTempRegs
      Return
    endif
    // LOGSTR_NL str("IS COMBO (2)")
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
if Equal var20 16 || Equal var20 17 || Equal var20 33
  var22 = -1
elif Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 11 || Equal var20 14 || Equal var20 15 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 23 || Equal var20 24 || Equal var20 25 || Equal var20 26 || Equal var20 27 || Equal var20 28 || Equal var20 31 || Equal var20 32
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 0.002
  // chr get_moveDirY
if Equal var20 36 || Equal var20 37
  var22 = -1
elif Equal var20 13
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 30000
  // evt gotHit
  if Equal TRAINING_MODE_OPTION -1
    if Rnd < 0.02
      Goto shuffle_AI
    endif
    if !(True)
      label shuffle_AI
        var22 = LevelValue * 0.005
        if Rnd < var22
          ADJUST_PERSONALITY 0 -1 PT_AGGRESSION
          var22 = LevelValue * 0.005
          ADJUST_PERSONALITY 0 var22 Rnd
          ADJUST_PERSONALITY 3 -1 PT_BAITCHANCE
          ADJUST_PERSONALITY 11 -1 PT_WALL_CHANCE
          ADJUST_PERSONALITY 4 -1 PT_BRAVECHANCE
          ADJUST_PERSONALITY 5 -1 PT_CIRCLECAMPCHANCE
          ADJUST_PERSONALITY 0 3.75 Rnd
          ADJUST_PERSONALITY 3 1.6 Rnd
          ADJUST_PERSONALITY 11 1.4 Rnd
          ADJUST_PERSONALITY 4 1.3 Rnd
          ADJUST_PERSONALITY 5 0.2 Rnd
          if Rnd < 0.25
            ADJUST_PERSONALITY 1 -1 PT_BAIT_DASHAWAYCHANCE
            ADJUST_PERSONALITY 1 0.9 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 2 -1 PT_BAIT_WDASHAWAYCHANCE
            ADJUST_PERSONALITY 2 0.9 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 7 -1 PT_JUMPINESS
            ADJUST_PERSONALITY 7 0.15000000000000002 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 6 -1 PT_DJUMPINESS
            ADJUST_PERSONALITY 6 0.06 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 8 -1 PT_PLATCHANCE
            ADJUST_PERSONALITY 8 0.30000000000000004 Rnd
          endif
        endif
      Return
    endif
  endif
elif Equal var22 20000
  // evt chrChecks
  if !(Equal DEBUG_VALUE 0) && var21 < 16.7
    var21 = 16
  endif 
  if Equal TRAINING_MODE_OPTION -1
    var17 = (LevelValue / 35) * 0.05
    ADJUST_PERSONALITY 0 0.003 var17
    PredictOMov var22 14
    if Rnd < var17
      PredictOMov var23 10
      var22 -= var23
      if var22 > 0.1
        var22 *= 5
        // if PT_AGGRESSION > 1.5
        //   ADJUST_PERSONALITY idx_aggression -0.025 immediateTempVar
        // endif
        ADJUST_PERSONALITY 11 0.045 var22
        ADJUST_PERSONALITY 1 0.001 var22
        ADJUST_PERSONALITY 2 0.005 var22
        ADJUST_PERSONALITY 7 0.01 var22
        ADJUST_PERSONALITY 6 0.01 var22
      endif
      PredictOMov var22 4
      PredictOMov var23 1
      if var23 > var22
        var22 = var23
      endif
      if var22 >= 0.35
        ADJUST_PERSONALITY 0 0.025 var22
        ADJUST_PERSONALITY 11 -0.025 var22
        ADJUST_PERSONALITY 3 0.025 var22
        ADJUST_PERSONALITY 1 0.005 var22
        ADJUST_PERSONALITY 4 0.01 var22
      endif
      PredictOMov var22 14
      PredictOMov var23 10
      var23 -= var22
      if var23 >= 0.075
        var23 *= 5
        ADJUST_PERSONALITY 3 0.05 var23
        ADJUST_PERSONALITY 11 -0.05 var23
        ADJUST_PERSONALITY 0 0.05 var23
        ADJUST_PERSONALITY 4 0.05 var23
        ADJUST_PERSONALITY 6 0.02 var23
      endif
    endif
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
var23 = var22
    if Rnd <= 0.02
      if Equal var23 0
        var22 = (LevelValue / 35) * 0.1
        ADJUST_PERSONALITY 3 0.002 var22
        ADJUST_PERSONALITY 1 0.001 var22
        ADJUST_PERSONALITY 2 0.001 var22
        ADJUST_PERSONALITY 11 0.004 var22
        ADJUST_PERSONALITY 5 0.005 var22
      endif
    elif CHANCE_MUL_LE PT_AGGRESSION 0.001 && LevelValue >= 60 && Equal var23 0 && var22 < 0.08
      ADJUST_PERSONALITY 0 -11 1
      ADJUST_PERSONALITY 0 1.65 1
      ADJUST_PERSONALITY 3 0.4 1
      ADJUST_PERSONALITY 11 1.2 1
    elif Rnd < 0.04000000000000001
      var22 = (LevelValue / 35) * 0.4
      ADJUST_PERSONALITY 11 0.015 var22
      ADJUST_PERSONALITY 5 0.015 var22
    elif Rnd < 0.04000000000000001 && FramesHitstun > 0
      Goto shuffle_AI
    endif
  endif
elif Equal var22 10000
  // evt rangedHit
  ADJUST_PERSONALITY 5 0.025 Rnd
elif Equal var22 40000
  // evt checkDefend
  if !(CalledFrom AttackedHub)
    var23 = LevelValue + 2
    var22 = Rnd * var23
    if var21 < 16.7 && TRAINING_MODE_OPTION <= 1 && !(CalledFrom RecoveryHub) && !(Equal var15 -20) && var22 > 1
  var22 = 0.004
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
      if var17 < 3
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
        if Equal var22 0 && !(Equal var21 12)
          // react to/read the opponent's attack patterns
          var22 = (1 - (LevelValue / 100)) * 40 + 5
          var22 *= PT_REACTION_TIME
          MOD var17 GameTimer var22
          var23 = OAnimFrame + 2
          MOD var23 var23 var22
          LOGSTR 1635022336 996635648 1979711488 0 0
          LOGVAL var17
          LOGVAL var23
          PRINTLN
          if var17 > 1 && var23 >= 1
          elif Equal OCurrAction 77 && OAnimFrame > 25
          elif Equal var21 16.5 || Equal var21 10.2
          elif !(Equal var21 13) && OFramesHitstun <= 0 && !(CalledFrom Shield) && !(Equal var21 10.2)
            // LOGSTR_NL str("defending")
            if OCurrAction >= 3 && OCurrAction <= 15 && OAnimFrame > 5
              GetCommitPredictChance var17
              if var17 >= 0.15
                // LOGSTR_NL str("wall prio")
                predictAverage var22 10
                var22 -= 10
                var23 = var22
                var23 += 20
                var17 = TopNX - OTopNX
                Abs var17
                if var17 > var22 && var17 < var23
                  var21 = 16.3
                  Return
                endif
              endif
            elif !(Equal var21 10.6)
              if OCurrAction < 66 || OCurrAction >= 72 || OAnimFrame > 15
                // LOGSTR_NL str("defendChance")
                predictAverage var22 10
                // LOGSTR str("hitDist")
                // LOGVAL immediateTempVar
                var22 += 35
                var17 = OPos * var22
                GetYDistFloorOffset var17 var17 10 1
                var23 = OTopNX - TopNX
                Abs var23
                var23 -= 40
                if var23 > 0 && var23 < var22 && var17 > 0
                  LOGSTR_NL 1684366848 1701733376 1130914048 1852007680 0
                  GetCommitPredictChance var17
                  var17 *= 1.75
                  // if Equal currGoal cg_bait_dashdance
                  //   globTempVar *= 0.06 * PT_BAITCHANCE
                  // endif
                  var22 = 0.13
                  if var21 >= 16
                    var22 = 0.15
                  endif
                  PredictOMov var23 10
                  var23 *= 0.5
                  var17 -= var23
                  PredictOMov var23 4
                  var23 *= 0.5
                  var17 -= var23
                  if var17 > var22 && Rnd < 0.7
                    // LOGSTR_NL str("defNorm")
                    CallI DefendHub
                  endif
                  if Equal AirGroundState 1
                    // LOGSTR_NL str("defGrnd")
                    PredictOMov var22 14
                    PredictOMov var23 15
                    PredictOMov var17 10
                    var22 -= var23
                    var17 -= var23
                    var22 -= var17
                    Abs var22
                    if var22 < 0.1 && Rnd < 0.5
                      var21 = 10.2
                    endif
                    PredictOMov var22 14
                    PredictOMov var23 15
                    PredictOMov var17 4
                    var23 -= var22
                    var17 -= var22
                    if var23 < -0.1 && var17 < 0.1
                      var21 = 10.5
                    endif
                  endif
                endif
              endif
            endif
          endif
        endif
      endif
      var23 = LevelValue + 2
      var22 = Rnd * var23
      if var22 > 1
        if !(Equal var21 16.5) && !(Equal var21 16.41) && !(Equal var21 13) && !(Equal var21 10.2)
          var22 = (1 - (LevelValue / 100)) * 80 + 10
          var22 *= PT_REACTION_TIME
          GetCommitPredictChance var23
          var23 = 1.1 - var23
          var23 *= 0.25
          var22 *= var23
          MOD var22 GameTimer var22
          // LOGSTR str("immTV GCS")
          // LOGVAL immediateTempVar
          // PRINTLN
          if var22 <= 1 || Equal var21 10.4
  var22 = 0.004
  XGoto GetChrSpecific
  //= XReciever
var17 = var22
            // LOGSTR str("OEndL")
            // LOGVAL OEndLag
            // PRINTLN
            if !(Equal var20 -1) && !(Equal var21 16.3)
            elif var17 >= 3
              GetAttribute var23 40 0
              var22 = var17 * var23 * 0.6
              if OCurrAction >= 74 && OCurrAction <= 101
              elif !(XDistLE var22) && OAttacking && var17 <= 13
                if CHANCE_MUL_LE PT_BAITCHANCE 0.2
                  var21 = 10
                  if CHANCE_MUL_LE PT_AGGRESSION 0.3 && CHANCE_MUL_LE PT_BRAVECHANCE 0.4
                    var21 = 10.2
                    if CHANCE_MUL_LE PT_AGGRESSION 0.25
                      var21 = 16
                    endif
                  endif
                endif
              else
                predictAverage var22 10
                var22 *= 1
                var22 += var17 + 5
                var17 = var22 * 0.3
                if OAttacking
                  var17 += 5
                endif
                var23 = OTopNY + 5
                DrawDebugRectOutline OTopNX var23 var17 1 255 0 0 221
                var23 += 5
                DrawDebugRectOutline OTopNX var23 var22 1 255 255 0 221
                if XDistLE var17
                  var21 = 16.4
                elif XDistLE var22
                  var21 = 16
                endif
              endif
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
  elif Equal OCurrAction 16
    if OYDistFloor > 0
      var22 = OYDistFloor * 0.8
    else
      var22 = OYDistBackEdge * 0.9
      Abs var22
      var22 = var22 + OXDistBackEdge
    endif
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
    if OCurrAction >= 90 && OCurrAction <= 95
      var22 = 80
    endif
  elif OCurrAction >= 119 && OCurrAction <= 120
    var22 = OEndFrame - OAnimFrame
  elif OFramesHitstun > 0
    if Equal OAirGroundState 1
      var22 = 8
    else
      var22 = OFramesHitstun + OFramesHitlag
    endif
  endif
  if Equal STACK_POP 0.004 && !(Equal CurrAction 29)
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
        var22 = -500
        STACK_TOSS 1
        Goto restoreTempRegs
        Return
      endif
    else
      Goto restoreTempRegs
    endif
  else
    Goto restoreTempRegs
  endif
elif Equal var22 23
  var22 = 0
  Return
  Goto saveTempRegs
  if !(CalledFrom ExecuteAttack) && CurrAction < 32 && PrevAction < 32 && var21 < 16.7
    // GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    var23 = 0
    // if Equal immediateTempVar 1
    //   chr_trait_return = 0
    //   Goto restoreTempRegs
    //   Return
    // if OYDistFloor > 10
    // elif !(Equal currGoal cg_attack_reversal)
    //   immediateTempVar = OTopNY - TopNY
    //   if immediateTempVar <= 30
    //     anotherTempVar = 1
    //   endif
    // endif
    if OYDistFloor < 10 && var21 < 16.7
    // elif !(Equal anotherTempVar 0) 
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
      if var22 <= 5
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
      // $ifAerialAttack()
      //   if move_hitFrame > 10
      //     move_hitFrame = 10
      //   endif
      // endif
      // TODO
      var22 *= 0.6000000000000001
      predictOOption var17 9
      predictionConfidence var23 9  

      // FIXME
      // globTempVar = op_bait_move
      // anotherTempVar = 1

      if Equal var17 1 && var23 >= 0.6
        predictOOption var23 8 
        predictAverage var17 10
        // FIXME
        // anotherTempVar = op_baitdir_overshoot
        var17 *= OPos
        if Equal var21 16.3
        elif Equal var23 3
          // LOGSTR_NL str("UNDERSHOOT")
          var23 = OXSpeed
          var23 *= OPos
          if OCurrAction >= 2 && OCurrAction <= 25 && var23 >= 0
          else
            var22 *= 5
          endif
          // chr_trait_return = immediateTempVar
          // immediateTempVar *= -1
        elif Equal var23 2
          // LOGSTR_NL str("OVERSHOOT")
          var23 = 15 * var22
          GetYDistFloorOffset var23 var23 5 1
          if !(Equal var23 -1)
            // immediateTempVar *= 5
            // chr_trait_return = immediateTempVar * -1
            var22 *= -1
          else
            var22 = 0
          endif
        endif
      endif
      var22 *= OPos
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
    
  // up to var6 is free
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
        // mult totalDist by (OActionTimer + framesAhead) / totalTime
        var5 -= var4
        if var23 > var5
          var23 = var5
        endif
        // anotherTempVar = movementEnd - anotherTempVar
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
//   LOGSTR str("angle")
//   LOGVAL immediateTempVar
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
//   LOGSTR str("poppedVar")
//   LOGVAL anotherTempVar
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
