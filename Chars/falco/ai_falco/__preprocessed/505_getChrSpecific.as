#include <Definition_AIMain.h>
id 0x8505
unk 0x0

//= XReciever
if Equal var22 19 || Equal var22 19.1
  // chr cs moveData
if Equal var22 19.1
  if var20 >= 0 && var20 < 30
    GotoByValue var20
    Return
    if !(True)
      label _jab123Str
      LOGSTR 1784766976 825373440 0 0 0
      Return
      label _dashattackStr
      LOGSTR 1684108032 1751217152 1952539392 1795162112 0
      Return
      label _dashattack_weakStr
      LOGSTR 1684108032 1751217152 1952539392 1801418496 1700883200
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
      label _usmash_backStr
      LOGSTR 1970498816 1634953216 1600282880 1667956736 0
      Return
      label _dsmashStr
      LOGSTR 1685286144 1634953216 0 0 0
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
      label _nair_weakStr
      LOGSTR 1851877632 1918859008 1700883200 0 0
      Return
      label _fairStr
      LOGSTR 1717659904 1912602624 0 0 0
      Return
      label _bairStr
      LOGSTR 1650551040 1912602624 0 0 0
      Return
      label _bair_weakStr
      LOGSTR 1650551040 1918859008 1700883200 0 0
      Return
      label _uairStr
      LOGSTR 1969318144 1912602624 0 0 0
      Return
      label _uair_hit2Str
      LOGSTR 1969318144 1918855168 1769222656 0 0
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
if var20 >= 0 && var20 < 30
  var22 = var20 + 30
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
  SetVarAttackData 7.72 -4.33 5.68 3.59 2 1 15 4 0 0 100
  var22 = 70
  Return
// dashattack; 1
label dashattack
  SetVarAttackData 8.24 -3.91 5.94 4.7 4 3 35 9 0 35 90
  var22 = 72
  Return
// dashattack_weak; 2
label dashattack_weak
  SetVarAttackData 12.67 -3.9 9.09 4.7 8 9 35 6 0 20 90
  var22 = 72
  Return
// ftilt; 3
label ftilt
  SetVarAttackData 0.64 -5.66 10.65 3.56 5 4 26 9 0 0 100
  var22 = 361
  Return
// utilt; 4
label utilt
  SetVarAttackData -10.36 0.66 10.45 11.47 5 6 22 9 0 30 120
  var22 = 90
  Return
// dtilt; 5
label dtilt
  SetVarAttackData 2.06 -0.27 7.93 3.13 7 2 27 13 0 25 125
  var22 = 75
  Return
// fsmash; 6
label fsmash
  SetVarAttackData 11.62 -1.21 11.42 8.98 13 9 42 17 0 40 90
  var22 = 361
  Return
// usmash; 7
label usmash
  SetVarAttackData 1.16 -1.07 6.3 11.06 8 3 46 14 0 25 100
  var22 = 95
  Return
// usmash_back; 8
label usmash_back
  SetVarAttackData -12.26 -12.54 12.27 7.86 12 5 46 12 0 10 100
  var22 = -361
  Return
// dsmash; 9
label dsmash
  SetVarAttackData -14.66 4.08 13.37 5.19 7 4 46 16 0 20 70
  var22 = 25
  Return
// nspecial; 10
label nspecial
  SetVarAttackData 5 -2 200 2 20 10 60 -3 1 5 100
  var22 = 361
  Return
// nspecialair; 11
label nspecialair
  SetVarAttackData 5 -2 200 2 13 17 8 -3 1 5 100
  var22 = 361
  Return
// uspecial; 12
label uspecial
  SetVarAttackData -8.5 0 8 8 44 22 9999.9999 16 0 80 60
  var22 = 80
  Return
// dspecial; 13
label dspecial
  SetVarAttackData -6 -1 6 6 1 0 5 8 0 110 50
  var22 = 84
  Return
// dspecialair; 14
label dspecialair
  SetVarAttackData -6 -1 6 6 1 0 5 8 0 110 50
  var22 = 84
  Return
// sspecial; 15
label sspecial
  SetVarAttackData -4 0 27 4 17 3 61 7 0 74 60
  var22 = 65
  Return
// sspecialair; 16
label sspecialair
  SetVarAttackData -4 0 27 4 17 3 91 7 0 72 38
  var22 = 270
  Return
// grab; 17
label grab
  SetVarAttackData 2.43 -3.82 5.47 3.91 7 0 32 0 0 0 0
  var22 = 0
  Return
// fthrow; 18
label fthrow
  SetVarAttackData 2.43 -3.82 5.47 3.91 7 10 35 3 0 35 135
  var22 = 45
  Return
// dthrow; 19
label dthrow
  SetVarAttackData 2.43 -3.82 5.47 3.91 7 32 45 1 0 150 40
  var22 = 270
  Return
// bthrow; 20
label bthrow
  SetVarAttackData 2.43 -3.82 5.47 3.91 7 8 40 2 0 80 85
  var22 = 56
  Return
// uthrow; 21
label uthrow
  SetVarAttackData 2.43 -3.82 5.47 3.91 7 6 40 2 0 75 110
  var22 = 90
  Return
// nair; 22
label nair
  SetVarAttackData -3.45 -0.61 6.92 4.77 4 3 41 12 0 10 100
  var22 = 361
  Return
// nair_weak; 23
label nair_weak
  SetVarAttackData -3.58 -0.22 7.02 5.08 8 23 41 9 0 0 100
  var22 = 361
  Return
// fair; 24
label fair
  SetVarAttackData -0.02 -4.24 8.24 5.62 6 2 52 9 0 10 100
  var22 = 361
  Return
// bair; 25
label bair
  SetVarAttackData -14.97 -1.82 10.2 7.05 4 3 37 9 0 0 100
  var22 = 361
  Return
// bair_weak; 26
label bair_weak
  SetVarAttackData -14.91 -1.52 10.25 7.15 8 11 37 9 0 0 100
  var22 = 361
  Return
// uair; 27
label uair
  SetVarAttackData -6 -5.9 4.84 6.15 8 1 35 5 0 30 22
  var22 = 90
  Return
// uair_hit2; 28
label uair_hit2
  SetVarAttackData -7.32 -6.4 6.92 8.57 11 3 35 10 0 22 120
  var22 = 70
  Return
// dair; 29
label dair
  SetVarAttackData -5.17 1.46 6.59 6.31 5 19 51 12 0 10 100
  var22 = 290
  Return
endif
Return
elif Equal var22 12
  // chr cs dashForceTurnFrame
  var22 = 9
elif Equal var22 13
  // chr cs dashDanceMinFrames
  var22 = 6
elif Equal var22 14
  // chr cs shortHopHeight
  var22 = 12.6
elif Equal var22 15
  // chr cs djumpHeight
  var22 = 43.68
elif Equal var22 16
  // chr cs wavedashDist
  var22 = 30
elif Equal var22 17
  // chr cs recoveryDistX
  var22 = 90
elif Equal var22 18
  // chr cs recoveryDistY
  STACK_PUSH var23 0
  if var21 >= 16.7
    var22 = 55
    var22 -= 10
    var22 *= 0.9
  else
    var22 = 0
  endif
  var22 += HurtboxSize
  if NumJumps > 0
    var23 = NumJumps - 1
    var23 *= 43.68 * 0.7
    var23 += 43.68
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
if  Equal var20 11 || Equal var20 14 || Equal var20 16 || var20 >= 22 && var20 <= 29
    var22 = 1
  endif
elif Equal var22 200
  // chr chk_OInCombo
  Goto saveTempRegs
  if XDistLE 60 || OFramesHitstun > 0
    getCurrentPredictValue var17 4
    var23 = PT_AGGRESSION * 5 + 6
    LOGSTR 1886352128 1952999680 1953723392 1970143232 0
    LOGVAL var17
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
    elif Equal PrevAction 60
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
  if Equal CanCancelAttack 1 || {HasCurry && Equal HitboxConnected 1} || {CurrAction >= 103 && CurrAction <= 109}
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
if Equal var20 9 || Equal var20 25 || Equal var20 26 || Equal var20 27
  var22 = -1
elif Equal var20 0 || Equal var20 1 || Equal var20 2 || Equal var20 3 || Equal var20 5 || Equal var20 6 || Equal var20 7 || Equal var20 10 || Equal var20 11 || Equal var20 15 || Equal var20 16 || Equal var20 17 || Equal var20 18 || Equal var20 19 || Equal var20 20 || Equal var20 21 || Equal var20 24
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
          ADJUST_PERSONALITY 0 2 Rnd
          ADJUST_PERSONALITY 3 4 Rnd
          ADJUST_PERSONALITY 11 0.7 Rnd
          ADJUST_PERSONALITY 4 2 Rnd
          ADJUST_PERSONALITY 5 4 Rnd
          if Rnd < 0.25
            ADJUST_PERSONALITY 1 -1 PT_BAIT_DASHAWAYCHANCE
            ADJUST_PERSONALITY 1 5 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 2 -1 PT_BAIT_WDASHAWAYCHANCE
            ADJUST_PERSONALITY 2 5 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 7 -1 PT_JUMPINESS
            ADJUST_PERSONALITY 7 1.6 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 6 -1 PT_DJUMPINESS
            ADJUST_PERSONALITY 6 0.8 Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY 8 -1 PT_PLATCHANCE
            ADJUST_PERSONALITY 8 1.5 Rnd
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
      // if OEndLag < 3
  var22 = 200
  XGoto GetChrSpecific
  //= XReciever
        if Equal var22 0 && !(Equal var21 12)
          // react to/read the opponent's attack patterns
          var22 = (1 - (LevelValue / 100)) * 40 + 15
          var22 *= PT_REACTION_TIME
          MOD var17 GameTimer var22
          var23 = OAnimFrame + 2
          MOD var23 var23 var22
          LOGSTR 1635022336 996635648 1979711488 0 0
          LOGVAL PT_REACTION_TIME
          LOGVAL var22
          LOGVAL var17
          LOGVAL var23
          PRINTLN
          if var17 > 10 && var23 >= 10
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
                  if Equal AirGroundState 2
                    var22 *= 2.5
                  endif
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
      // endif
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
elif Equal var22 60000
  // evt checkDefend
  if CurrAction >= 223 && CurrAction <= 229
    var13 = OTopNX
    var14 = OTopNY
    XGoto MoveToGoal
    Return
  elif Equal CurrAction 220
    var13 = OTopNX
    XGoto MoveToGoal
    Return
  elif CurrAction >= 146 && CurrAction <= 148
    Button X
    Return
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
