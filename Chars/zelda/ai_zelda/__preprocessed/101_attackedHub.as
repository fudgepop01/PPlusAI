#include <Definition_AIMain.h>
id 0x8101
unk 0x0

XReciever
var21 = 12

// label inThrow
// #let techDirection = var5
// if Equal CurrAction 66 && Equal OCurrSubaction ThrowLw 
//   if FramesSinceShield > 40 && Rnd <= 0.1
//     Goto checkTech
//   endif
//   Return
// endif

label hitlag
XGoto PerFrameChecks
XReciever
Seek hitlag
EnableDebugOverlay
SetDebugOverlayColor 255 255 255 221

if FramesHitlag > 2
  // SDI input frequency:
  // level 9: once per 20 frames
  // level 1: once per 50 frames
  var0 = PT_SDICHANCE
  
  var22 = (1 - (LevelValue / 100)) * 30 + 8
  if PT_REACTION_TIME > 0.5
    var22 *= PT_REACTION_TIME
  else
    var22 *= 0.5
  endif
  LOGSTR_NL 1952999680 1852274944 0 0 0
  LOGVAL_NL var22
  MOD var22 FramesHitlag var22
  LOGVAL_NL var22

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

  // if FramesSinceShield > 10 && Equal AirGroundState 2 && !(Equal CurrAction 66)
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

  predictionConfidence var17 7 LevelValue
  var17 *= 2
  predictOOption var23 7 LevelValue 

  if Rnd < 0.25 && Rnd < var17
    AbsStick var22 (-1)
  elif Rnd < var17 && Equal var23 1 && Rnd < 0.25
    AbsStick OPos (-1)
  else
    AbsStick var22
  endif
  Return
endif

label hitstun
// XGoto PerFrameChecks
// XReciever
// Seek hitstun
SetDebugOverlayColor 255 255 255 102

if FramesHitstun > 0 || Equal CurrAction 66 
  if LevelValue >= 48
    var0 = Rnd * 8 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      var0 *= -1
    endif  
    if Rnd < 0.2 || KBSpeed > 2.3
      var0 *= -1
    endif
  else
    var0 = (Rnd * 2) - 1
  endif
  if LevelValue >= 48
    var1 = (Rnd * 2) - 1
    if Rnd < 0.5
      var1 -= 0.5
    endif
    if KBSpeed > 3
      var1 = 1
    endif
    if Equal IsOnStage 0 || KBSpeed > 3
      if Rnd < 0.8
        // if offstage with high damage, switch to survival DI
        var0 = OPos
        var1 = 1
      endif
    endif
  else
    var1 = (Rnd * 2) - 1
  endif
  if Rnd < 0.2
    var1 *= -1
  endif
  var2 = 1
  var3 = Rnd * 5 + 15
  var4 = 0
  var5 = -2
  label HSHandler
  XGoto PerFrameChecks
  XReciever
  Seek HSHandler

  if LevelValue >= 21
    if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
      Goto _checkTech
    elif Equal IsOnStage 1 && YDistFloor < 25 && TotalYSpeed < -0.3
      Goto _checkTech
    elif Equal CurrAction 66
      Goto _checkTech
    endif
  endif

  if !(Equal var5 -2) && TotalYSpeed < 0
    if var5 < -0.5
      AbsStick -1
    elif 0.5 < var5
      AbsStick 1
    else
      ClearStick
    endif
  elif CurrAction < 11 || 16 < CurrAction
    if !(Equal AirGroundState 1)
      if FramesHitstun > 1
        Goto exec_DI
        Return
      elif CurrAction >= 66 && CurrAction <= 69
        Goto exec_DI
        Return
      endif
    endif
    if !(True)
      label exec_DI
      ClearStick
      if Equal var0 1 || Equal var0 -1.2 || Equal var0 -3
        if Equal var0 0
          AbsStick 0.3 0
          Return
        endif
        AbsStick var0 0
        Return
      elif True
        if KBAngle >= 80 && KBAngle <= 100 && FramesHitlag >= 0
          var0 = TotalXSpeed
          if var0 > -1 && var0 < 1
            var0 = OPos * -0.8
            if Rnd < 0.4
              var0 *= 0.75
            elif Rnd < 0.2
              var0 *= 2
            elif Rnd < 0.1
              var0 *= -1
            endif
          endif
          // if Rnd < 0.15
          //   var0 *= -1
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
        if YDistBackEdge > -10 && Equal IsOnStage 1 && !(Equal CurrAction 66) && Rnd < var22
          ClearStick
          AbsStick var0 (-1)
        endif
      endif
      // until hitstun is 0
      if LevelValue >= 48
        Goto _checkMeteorCancel
      endif
      Return
    endif
  endif

  if FramesHitstun > 0 && CurrAction <= 16
    Seek
    Jump
  elif FramesHitstun > 0 && var4 > 3 && LevelValue >= 42
    label

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

    Seek
    Jump
  elif Equal FramesHitstun 1 && LevelValue >= 42
    label
  var17 = 15
  var6 = XSpeed * var17
  GetYDistFloorOffset var5 var6 5 0
  // var22 = TopNY - var5 
  // DrawDebugLine TopNX TopNY TopNX var22 255 0 0 221
  if !(Equal var5 -1) 
    var5 = 0
  elif Equal DistBackEdge DistFrontEdge
    var5 = 2
  elif Equal var5 -1
    if var6 < 0
      var5 = 1
    elif var6 > 0
      var5 = -1
    endif
  else
    var5 = 0
  endif
    if !(Equal var5 0)
      CallI MainHub
      Return
    endif

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
    elif var22 < 0.2
      var22 = 0.2
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

  if FramesHitstun > 0 || Equal CurrAction 66
    Return
  elif CurrAction >= 78 && CurrAction <= 100
    Return
  endif
endif

label end
CallI MainHub
Return

label _hitstunEnd
  predictionConfidence var17 7 LevelValue
  var17 *= 4
  predictOOption var23 7 LevelValue 
  if Equal IsOnStage 0
    CallI RecoveryHub
  elif Rnd < var17 && YDistFloor < 5
    XGoto CalcAttackGoal
    XReciever

    XGoto SetAttackGoal
    XReciever

    var15 = -1
    CallI MainHub
  elif ODistLE 70
    CallI DefendHub
  endif 
Return

label _checkTech
  if var2 <= 0
    if CurrAction >= 66 && CurrAction <= 77 && FramesSinceShield > 40
      var17 = OEndFrame - 23
      if Equal CurrAction 66
        if !(Equal CurrSubaction ThrownLw)
          Return
        elif OAnimFrame < var17
          Return
        endif
      endif
      var17 = (100 - LevelValue) / 100 * -1
      var17 += 0.80
      if Rnd < var17 && YDistFloor < 20
        if TotalYSpeed <= 0.3 || Equal CurrAction 66
          var5 = Rnd * 4 - 2
        endif
        Button R
      endif
      var2 = 15
    endif
  endif
  var2 -= 1
Return

label _checkMeteorCancel
  if KBAngle >= 260 && KBAngle <= 280 && var3 <= 0 && Equal IsOnStage 0
    var17 = (100 - LevelValue) / 100
    var17 = 0.9 - var17
    if Rnd < 0.9
      if CanJump && Rnd < 0.5
        Button X
      elif CanJump && YDistFrontEdge > 15
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
