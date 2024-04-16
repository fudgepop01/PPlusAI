#include <Definition_AIMain.h>
id 0x8101
unk 0x0

//= XReciever

if CalledFrom MainHub
  var5 = -2
  Goto _checkTech
  if Equal var5 -2 
    Return
  endif
  Seek HSHandler
  Jump
endif
var21 = 12

// label inThrow
// #let techDirection = var5
// if Equal CurrAction hex(0x42) && Equal OCurrSubaction ThrowLw 
//   if FramesSinceShield > 40 && Rnd <= 0.1
//     Goto checkTech
//   endif
//   Return
// endif

label hitlag

XGoto PerFrameChecks
//= XReciever
Seek hitlag
EnableDebugOverlay
SetDebugOverlayColor 255 255 255 221

if FramesHitlag > 0 && Equal PrevAction 18
  AbsStick 0 -1
  Return
endif

if FramesHitlag > 2
  // SDI input frequency:
  // level 9: once per 20 frames
  // level 1: once per 50 frames
  var0 = PT_SDICHANCE * 0.4
  
  var22 = (1 - (LevelValue / 100)) * 70 + 15
  if PT_REACTION_TIME > 0.5
    var22 *= PT_REACTION_TIME
  else
    var22 *= 0.5
  endif
  // LOGSTR_NL str("thingy")
  // LOGVAL_NL immediateTempVar
  MOD var22 GameTimer var22
  // LOGVAL_NL immediateTempVar
  
  if Equal var22 1 && Rnd <= var0
    var17 = OPos * -1
    if XDistBackEdge > -15
      var17 = OPos
    endif
    var22 = Rnd * 2 - 1
    if YDistBackEdge > -0.5 && LevelValue >= 75
      var22 = -1
    endif
    AbsStick var17 var22
  endif

  // if FramesSinceShield > 10 && Equal AirGroundState 2 && !(Equal CurrAction hex(0x42))
  //   if FramesSinceShield > 100
  //     Button R
  //   elif YDistFloor < 10 && Rnd < 0.7 && KBAngle < 40
  //     Button R
  //   endif
  // endif
  Return
elif FramesHitlag > 1
  var22 = 0
  var17 = LevelValue * 0.01
  if LevelValue >= 48 && Rnd < var17 && Equal YDistFloor -1
    var22 = TopNX * -1
  elif LevelValue >= 48 && CHANCE_MUL_LE PT_SDICHANCE 0.35
    var22 = OPos * -1
  endif

  PredictOMov var17 14
  var17 *= 3
  var17 *= LevelValue * 0.01

  if Rnd < 0.75 && Rnd < var17
    AbsStick var22 (-1)
  elif Rnd < var17 && KBXSpeed < 1
    AbsStick OPos (-1)
  else
    AbsStick var22
  endif
  if Damage > 40 && Damage < 110 && Rnd < 0.5
    // clears Y direction
    ClearStick 1
  endif
  Return
endif

label hitstun

// XGoto PerFrameChecks
// //= XReciever
// Seek hitstun
SetDebugOverlayColor 255 255 255 102

if FramesHitstun > 0 || GettingThrown || Equal CurrAction 73
  if LevelValue >= 48
    var0 = Rnd * 10 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      var0 *= -1
    endif
    if Rnd < 0.3
      var0 *= -1
    endif
  else
    var0 = (Rnd * 4) - 2
  endif
  if LevelValue >= 48
    var1 = (Rnd * 4) - 1
    if Rnd < 0.5
      var1 -= 0.5
    endif
    if {Equal IsOnStage 0 || KBSpeed > 3 || DistBackEdge > -20 || DistFrontEdge < 20} && Rnd < 0.8
      // if offstage with high damage, switch to survival DI
      var0 = TopNX * -1
      var1 = 1
      if KBAngle > 90 && KBAngle < 170
        var0 *= -1 * Rnd
      elif KBAngle > 180
        var1 = 0
      endif
    endif
  else
    var1 = (Rnd * 2) - 1
  endif
  if Rnd < 0.1
    var1 *= -1
  endif
  var2 = 40 - FramesSinceShield
  var3 = Rnd * 10 + 26
  var4 = 0
  var5 = -2
  label HSHandler
  // LOGVAL_NL 10000
  if FramesHitlag > 1
    Seek hitlag
    Jump
  endif
  XGoto PerFrameChecks
  Seek HSHandler
    
  // LOGSTR str("tDir")
  // LOGVAL techDirection
  // LOGVAL techWindow
  PRINTLN
  // LOGVAL_NL 10001
  if LevelValue >= 21 && Equal var5 -2
    if {Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1} || GettingThrown
      Goto _checkTech
    elif Equal PrevAction 66 && AnimFrame < 5
    elif Equal IsOnStage 1 && YDistFloor < 25 && TotalYSpeed < 0.3
      Goto _checkTech
    endif
  endif
  Seek HSHandler
  // LOGSTR str("Y stats")
  // LOGVAL_NL YDistFloor
  // LOGVAL_NL TotalYSpeed
  // PRINTLN
  if !(Equal var5 -2) && TotalYSpeed <= 0 && YDistFloor > 0 && YDistFloor < 20
    // LOGVAL_NL 10002
    if CurrAction <= 32
      Seek _done
      Jump
    endif
    if var5 < -0.5
      AbsStick -0.7
    elif 0.5 < var5
      AbsStick 0.7
    else
      ClearStick
    endif
    Return
  elif CurrAction < 11 || 16 < CurrAction
    // until hitstun is 0
    if LevelValue >= 48
      Goto _checkMeteorCancel
      Seek HSHandler
    endif
    if FramesHitstun > 1 || GettingThrown
      Goto exec_DI
      Seek HSHandler
      Return
    endif
    if !(True)
      label exec_DI
      ClearStick
      if KBAngle >= 65 && KBAngle <= 115 && KBSpeed > 1
        var0 = TotalXSpeed * 2
        if var0 > -1 && var0 < 1
          var0 -= OPos
          if Rnd < 0.2
            var0 *= 0.9
          elif Rnd < 0.2
            var0 *= 0.8
          elif Rnd < 0.1
            var0 *= -1
          endif
        endif
        // if Rnd < 0.15
        //   stickX *= -1
        // endif
        ClearStick
        if Damage >= 90
          var1 = -1
          AbsStick var0 var1
        else
          var1 = 0
          AbsStick var0 var1
        endif
        Return
      else
        AbsStick var0 var1
      endif
      // techskill
      var22 = LevelValue * 0.01
      if var22 < 0.05
        var22 = 0.05
      elif var22 > 0.8
        var22 = 0.8
      endif
      if YDistBackEdge > -10 && Equal IsOnStage 1 && !(GettingThrown) && Rnd < var22
        ClearStick
        AbsStick var0 (-1)
      endif
      Return
    endif
  endif
endif
// LOGVAL_NL 10003
if {FramesHitstun > 0 && CurrAction <= 16} || {FramesHitstun > 0 && var4 > 3 && LevelValue >= 42}
  label _done
  Seek _done
  // techskill
  var22 = LevelValue * 0.004
  var22 -= 0.1
  if var22 < 0.05
    var22 = 0.05
  endif

  if Rnd > var22
    Return
  endif
  Goto _hitstunEnd

  Seek _done2
  Jump
elif FramesHitstun <= 1 && LevelValue >= 42
  label _done2
  Seek _done2

  // tempVar = Damage / 100
  // tempVar *= 0.4
  // if Rnd < tempVar && ODistLE 40
  //   Call FakeOutHub
  // endif

  // techskill
  var22 = 100 - LevelValue
  var22 *= 0.005
  if var22 > 0.9
    var22 = 0.9
  elif var22 < 0.05
    var22 = 0.05
  endif

  if Rnd < var22
    Return
  endif
  Goto _hitstunEnd

  CallI MainHub
  Return
endif

if CurrAction >= 17 && CurrAction <= 23
  var4 += 1
endif

if FramesHitstun > 0 || GettingThrown || {CurrAction >= 78 && CurrAction <= 100}
  Return
endif
CallI MainHub
Return

label _hitstunEnd
  // predictionConfidence globTempVar man_ODefendOption
  // globTempVar *= 3
  if Equal IsOnStage 0 && YDistBackEdge > -20
    Call RecoveryHub
  elif YDistFloor < 5 && Equal IsOnStage 1
    XGoto CalcAttackGoal
    XGoto SetAttackGoal

    var15 = -10
    CallI MainHub
  else
    var21 = 16.41
    XGoto CalcAttackGoal
    XGoto SetAttackGoal

    CallI DefendHub
  endif
Return

label _checkTech
  if var2 <= 0
    if CurrAction >= 66 && FramesSinceShield > 40
      var17 = OThrowReleaseFrame - 10
      if GettingThrown || CurrAction >= 204
        if ShouldTechThrow && OAnimFrame > var17
          // LOGVAL_NL 10001
        else
          Return
        endif
      endif
      var17 = (100 - LevelValue) / 100 * -1
      var17 += 0.80
      if Rnd < var17 && YDistFloor < 20
        if TotalYSpeed <= 0.3 || GettingThrown
          var5 = Rnd * 5 - 2
        endif
        if var5 < 2
          // LOGVAL_NL 10002
          Button R
        endif
      endif
      
      // LOGVAL_NL 10003
      var2 = 2
    endif
  endif
  var2 -= 1
Return

label _checkMeteorCancel
  if KBAngle >= 230 && KBAngle <= 310 && var3 <= 0 && Equal IsOnStage 0
    var17 = (100 - LevelValue) / 100
    var17 = 0.9 - var17
    if Rnd < 0.9
      if {CanJump && Rnd < 0.5} || {CanJump && YDistFrontEdge > 15}
        Button X
      else
        Stick 0 0.7
        Button B
        Call RecoveryHub
      endif
    endif
    var3 = 41
  endif
  var3 -= 1
Return
Return
