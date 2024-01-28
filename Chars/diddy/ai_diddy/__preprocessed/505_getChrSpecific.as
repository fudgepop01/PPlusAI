#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal var22 19 || Equal var22 19.1
  // chr cs moveData
if Equal var22 19.1
  if var20 >= 0 && var20 < 33
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
      label _dashattack_lateStr
      LOGSTR 1684108032 1751217152 1952539392 1801415680 1635017984
      Return
      label _ftiltStr
      LOGSTR 1718905088 1819541504 0 0 0
      Return
      label _ftilt_strongStr
      LOGSTR 1718905088 1819565824 1937011200 1869506304 0
      Return
      label _utiltStr
      LOGSTR 1970563328 1819541504 0 0 0
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
      label _usmashStr
      LOGSTR 1970498816 1634953216 0 0 0
      Return
      label _dsmashStr
      LOGSTR 1685286144 1634953216 0 0 0
      Return
      label _dsmash_hit2Str
      LOGSTR 1685286144 1634953216 1600678144 1949433856 0
      Return
      label _nspecialStr
      LOGSTR 1853059072 1701013760 1634467840 0 0
      Return
      label _nspecialairStr
      LOGSTR 1853059072 1701013760 1634492672 1769078784 0
      Return
      label _dspecialStr
      LOGSTR 1685286912 1701013760 1634467840 0 0
      Return
      label _dspecialairStr
      LOGSTR 1685286912 1701013760 1634492672 1769078784 0
      Return
      label _sspecialStr
      LOGSTR 1936945152 1701013760 1634467840 0 0
      Return
      label _sspecialairStr
      LOGSTR 1936945152 1701013760 1634492672 1769078784 0
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
      label _nair_lateStr
      LOGSTR 1851877632 1918856192 1635017984 0 0
      Return
      label _fairStr
      LOGSTR 1717659904 1912602624 0 0 0
      Return
      label _fair_strongStr
      LOGSTR 1717659904 1918857984 1953656576 1852243968 0
      Return
      label _bairStr
      LOGSTR 1650551040 1912602624 0 0 0
      Return
      label _uairStr
      LOGSTR 1969318144 1912602624 0 0 0
      Return
      label _uair_lateStr
      LOGSTR 1969318144 1918856192 1635017984 0 0
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
if var20 >= 0 && var20 < 33
  var22 = var20 + 33
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
  SetVarAttackData 2.15 -1.84 7.43 3.28 3 1 16 3 1 20 100
  var22 = 80
  Return
// jab123_2; 1
label jab123_2
  SetVarAttackData 3.5 0.26 7.08 4.22 10 1 22 2 1 20 100
  var22 = 85
  Return
// jab123_3; 2
label jab123_3
  SetVarAttackData 7.36 -3.51 6.23 3.45 22 1 38 4 0 25 100
  var22 = 361
  Return
// dashattack; 3
label dashattack
  SetVarAttackData 6.63 -2.22 9.49 6.72 7 4 38 9 0 55 80
  var22 = 75
  Return
// dashattack_late; 4
label dashattack_late
  SetVarAttackData 16.6 -1.22 13.69 7.35 12 10 38 5 0 35 80
  var22 = 90
  Return
// ftilt; 5
label ftilt
  SetVarAttackData 4.29 -1.92 5.89 4.24 10 3 39 9 0 10 100
  var22 = 361
  Return
// ftilt_strong; 6
label ftilt_strong
  SetVarAttackData 13.7 -1.86 4.25 5.38 10 3 39 12 0 10 100
  var22 = 361
  Return
// utilt; 7
label utilt
  SetVarAttackData -7.44 -4.44 9.85 11.75 6 7 30 8 0 40 110
  var22 = 100
  Return
// dtilt; 8
label dtilt
  SetVarAttackData 4.05 -1.07 4.89 3.7 5 1 18 8 0 20 75
  var22 = 50
  Return
// dtilt_outer; 9
label dtilt_outer
  SetVarAttackData 13.2 0.47 3.33 3.37 5 1 18 8 0 20 75
  var22 = 361
  Return
// fsmash; 10
label fsmash
  SetVarAttackData 3.22 -2.89 13.85 6.38 15 5 51 14 0 40 100
  var22 = 361
  Return
// usmash; 11
label usmash
  SetVarAttackData -13.5 -1.93 12.78 10.39 6 20 53 11 0 25 117
  var22 = 90
  Return
// dsmash; 12
label dsmash
  SetVarAttackData 1 1.58 8.92 4.11 7 1 44 16 0 40 80
  var22 = 361
  Return
// dsmash_hit2; 13
label dsmash_hit2
  SetVarAttackData -18.08 0.61 9.18 4 15 3 44 13 0 35 80
  var22 = 361
  Return
// nspecial; 14
label nspecial
  SetVarAttackData 5 0 60 8 14 16 39 -8 0 40 140
  var22 = 361
  Return
// nspecialair; 15
label nspecialair
  SetVarAttackData 5 0 80 8 14 16 39 -8 0 40 140
  var22 = 361
  Return
// dspecial; 16
label dspecial
  SetVarAttackData -10 80 10 40 19 0 40 -1 0 0 0
  var22 = 0
  Return
// dspecialair; 17
label dspecialair
  SetVarAttackData -10 80 10 40 19 0 40 -1 0 0 0
  var22 = 0
  Return
// sspecial; 18
label sspecial
  SetVarAttackData 5.42 -5.2 15.064 8.2 17 13 57 7 0 30 100
  var22 = 280
  Return
// sspecialair; 19
label sspecialair
  SetVarAttackData 5.42 -5.2 15.064 8.2 17 13 107 7 0 30 100
  var22 = 280
  Return
// grab; 20
label grab
  SetVarAttackData 3 -3.5 5.75 3.5 7 0 32 0 0 0 0
  var22 = 0
  Return
// fthrow; 21
label fthrow
  SetVarAttackData 3 -3.5 5.75 3.5 7 9 29 11 0 65 55
  var22 = 45
  Return
// dthrow; 22
label dthrow
  SetVarAttackData 3 -3.5 5.75 3.5 7 10.5 31 3 0 60 105
  var22 = 50
  Return
// bthrow; 23
label bthrow
  SetVarAttackData 3 -3.5 5.75 3.5 7 9 28 10 0 55 70
  var22 = 45
  Return
// uthrow; 24
label uthrow
  SetVarAttackData 3 -3.5 5.75 3.5 7 11 41 7 0 35 105
  var22 = 80
  Return
// nair; 25
label nair
  SetVarAttackData -10.84 6.08 9.27 9.78 4 3 36 13 0 16 100
  var22 = 75
  Return
// nair_late; 26
label nair_late
  SetVarAttackData -11.49 6.96 11.37 11.76 8 10 36 9 0 5 100
  var22 = 60
  Return
// fair; 27
label fair
  SetVarAttackData -0.18 -0.5 7.48 3.5 8 6 38 11 0 10 100
  var22 = 361
  Return
// fair_strong; 28
label fair_strong
  SetVarAttackData 0.56 -0.5 7.11 3.5 6 1 38 15 0 10 100
  var22 = 361
  Return
// bair; 29
label bair
  SetVarAttackData -20.29 1.78 9.49 4.61 5 3 28 12 0 15 95
  var22 = 361
  Return
// uair; 30
label uair
  SetVarAttackData -3.97 -6.41 9.43 8.9 5 2 31 12 0 20 90
  var22 = 361
  Return
// uair_late; 31
label uair_late
  SetVarAttackData -12.35 -9.55 7.79 7.33 8 1 31 8 0 5 100
  var22 = 361
  Return
// dair; 32
label dair
  SetVarAttackData -5.34 8.05 5.19 7.78 10 2 39 15 0 30 80
  var22 = 270
  Return
endif
Return
elif Equal var22 12
  // chr cs dashForceTurnFrame
  var22 = 9
elif Equal var22 13
  // chr cs dashDanceMinFrames
  var22 = 4
elif Equal var22 14
  // chr cs shortHopHeight
  var22 = 17.51
elif Equal var22 15
  // chr cs djumpHeight
  var22 = 28.93
elif Equal var22 16
  // chr cs wavedashDist
  var22 = 37
elif Equal var22 17
  // chr cs recoveryDistX
  var22 = 110
elif Equal var22 18
  // chr cs recoveryDistY
  STACK_PUSH var23 0
  if var21 >= 16.7
    var22 = 50
    var22 -= 10
    var22 *= 0.9
  else
    var22 = 0
  endif
  var22 += HurtboxSize
  if NumJumps > 0
    var23 = NumJumps - 1
    var23 *= 28.93 * 0.7
    var23 += 28.93
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
if  Equal var20 15 || Equal var20 17 || Equal var20 19 || var20 >= 25 && var20 <= 32
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
if Equal var20 13 || Equal var20 29 || Equal var20 31
  var22 = -1
elif Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 4 || Equal var20 5 || Equal var20 6 || Equal var20 8 || Equal var20 9 || Equal var20 10 || Equal var20 12 || Equal var20 14 || Equal var20 15 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 22 || Equal var20 23 || Equal var20 24 || Equal var20 27 || Equal var20 28 || Equal var20 30
  var22 = 1
else
  var22 = 0
endif
elif Equal var22 0.002
  // chr get_moveDirY
if Equal var20 16 || Equal var20 17 || Equal var20 29 || Equal var20 32
  var22 = -1
elif !(True)
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
          ADJUST_PERSONALITY 10 -1 PT_WALL_CHANCE
          ADJUST_PERSONALITY 4 -1 PT_BRAVECHANCE
          ADJUST_PERSONALITY 5 -1 PT_CIRCLECAMPCHANCE
          ADJUST_PERSONALITY 0 4.199999999999999 Rnd
          ADJUST_PERSONALITY 3 1.8 Rnd
          ADJUST_PERSONALITY 10 0.8 Rnd
          ADJUST_PERSONALITY 4 1.3 Rnd
          ADJUST_PERSONALITY 5 0.9 Rnd
          if Rnd < 0.25
            ADJUST_PERSONALITY 1 -1 PT_BAIT_DASHAWAYCHANCE
            ADJUST_PERSONALITY 1 1.1 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 2 -1 PT_BAIT_WDASHAWAYCHANCE
            ADJUST_PERSONALITY 2 0.3 Rnd
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
            ADJUST_PERSONALITY 8 0.75 Rnd
          endif
        endif
      Return
    endif
  endif
elif Equal var22 20000
  // evt chrChecks
  if Equal TRAINING_MODE_OPTION -1
    var17 = (LevelValue / 35) * 0.05
    ADJUST_PERSONALITY 0 0.003 var17
    if Rnd < var17
      PredictOMov var22 14
      PredictOMov var23 10
      var22 -= var23
      if var22 > 0.1
        var22 *= 5
        // if PT_AGGRESSION > 1.5
        //   ADJUST_PERSONALITY idx_aggression -0.025 immediateTempVar
        // endif
        ADJUST_PERSONALITY 10 0.045 var22
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
        ADJUST_PERSONALITY 10 -0.025 var22
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
        ADJUST_PERSONALITY 10 -0.05 var23
        ADJUST_PERSONALITY 0 0.05 var23
        ADJUST_PERSONALITY 4 0.05 var23
        ADJUST_PERSONALITY 6 0.02 var23
      endif
    endif
    if Rnd <= 0.02
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
      if Equal var22 0
        var22 = (LevelValue / 35) * 0.1
        ADJUST_PERSONALITY 3 0.002 var22
        ADJUST_PERSONALITY 1 0.001 var22
        ADJUST_PERSONALITY 2 0.001 var22
        ADJUST_PERSONALITY 10 0.005 var22
        ADJUST_PERSONALITY 5 0.002 var22
      endif
    elif CHANCE_MUL_LE PT_AGGRESSION 0.001 && LevelValue >= 60 && var22 < 0.3
      ADJUST_PERSONALITY 0 -11 1
      ADJUST_PERSONALITY 0 1.65 1
      ADJUST_PERSONALITY 3 0.4 1
      ADJUST_PERSONALITY 10 1.2 1
    elif Rnd < 0.04000000000000001
      var22 = (LevelValue / 35) * 0.4
      ADJUST_PERSONALITY 10 0.015 var22
    elif Rnd < 0.04000000000000001 && FramesHitstun > 0
      Goto shuffle_AI
    endif
  endif
elif Equal var22 10000
  // evt rangedHit
  ADJUST_PERSONALITY 5 0.025 Rnd
elif Equal var22 40000
  // evt checkDefend
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
        var22 = (1 - (LevelValue / 100)) * 30 + 10
        var22 *= PT_REACTION_TIME
        MOD var17 GameTimer var22
        var23 = OAnimFrame + 2
        MOD var23 var23 var22
        // LOGSTR str("atv;gtv")
        // LOGVAL globTempVar
        // LOGVAL anotherTempVar
        // PRINTLN
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
            if OCurrAction < 66 || OCurrAction >= 72
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
                // LOGSTR_NL str("defendChance")
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
        var22 = (1 - (LevelValue / 100)) * 60 + 10
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
  if var22 > -1
    var22 += 4
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
      // chr_trait_return = STACK_POP
      // Goto restoreTempRegs
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
    if !(Equal var23 0) 
  var22 = 0.003
  XGoto GetChrSpecific
  //= XReciever
      if var22 <= 10
        var23 = 1
      else
        var23 = 0
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
      var22 *= 0.4 * var7 * OPos
      predictOOption var17 9
      predictionConfidence var23 9  

      if Equal var17 1 && var23 >= 0.3
        predictOOption var23 8 
        predictAverage var17 10
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
          var22 = var17 * -1
          var22 -= var22
        elif Equal var23 2
          // LOGSTR_NL str("OVERSHOOT")
          var22 = OPos * 15
          GetYDistFloorOffset var22 var22 5 1
          if !(Equal var22 -1)
            // immediateTempVar *= 5
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
