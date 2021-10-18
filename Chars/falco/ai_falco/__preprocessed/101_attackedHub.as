#include <Definition_AIMain.h>
id 0x8101
unk 0x0

XReciever
var21 = 12
if Equal OHitboxConnected 1
  var22 = TopNX - OTopNX
  Abs var22
  var22 += 6
  trackOAction 10 var22
endif

label hitlag
XGoto PerFrameChecks
XReciever
Seek hitlag

if FramesHitlag > 1
  // SDI input frequency:
  // level 9: once per 20 frames
  // level 1: once per 50 frames
  var22 = (1 - (LevelValue / 100)) * 30 + 20
  MOD var22 FramesHitlag var22
  if Equal var22 6 && Rnd <= 0.4
    var17 = OPos * -1
    if XDistBackEdge > -10
      var17 = OPos
    endif
    var22 = Rnd * 2 - 1
    if YDistBackEdge > -0.5 && LevelValue >= 75
      var22 = -1
    endif
    AbsStick var17 var22
  endif
  Return
elif FramesHitlag > 0 && YDistBackEdge > -1
  var22 = 0
  var17 = LevelValue * 0.01
  if LevelValue >= 60 && Rnd < var17
    var22 = TopNX * -1
    if FramesSinceShield > 100
      Button R
    endif
  endif
  if Rnd < 0.6
    AbsStick var22 (-1)
  else
    AbsStick var22
  endif
  Return
elif FramesHitlag > 0
  Return
endif

label hitstun
XGoto PerFrameChecks
XReciever
Seek hitstun

if FramesHitstun > 0
  if LevelValue >= 48
    var0 = Rnd * 4 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      var0 *= -1
    endif  
    if Rnd < 0.2
      var0 *= -1
    endif
  else
    var0 = (Rnd * 2) - 1
  endif
  if LevelValue >= 48
    var1 = Rnd - 1.5
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
  label hitstun_handler
  XGoto PerFrameChecks
  XReciever
  Seek hitstun_handler
  
  if FramesHitlag > 1
    Seek hitlag
    Jump
  endif

  if LevelValue >= 21
    if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
      Goto _checkTech
    elif Equal IsOnStage 1 && YDistBackEdge > -12 && YSpeed < 0
      Goto _checkTech
    endif
  endif

  if !(Equal var5 -2)
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
      LOGVAL var0
      ClearStick
      if Equal var0 1 || Equal var0 -1.2 || Equal var0 -3
        if Equal var0 0
          AbsStick 0.3 0
          Return
        endif
        AbsStick var0 0
        Return
      elif True
        if KBAngle >= 80 && KBAngle <= 100
          var17 = Direction * -1
          if KBAngle > 90
            var17 *= -1
          endif
          if Rnd < 0.15
            var17 *= -1
          endif
          AbsStick var17 (-1)
        elif Equal IsOnStage 0 || KBSpeed > 3.7
          // if offstage with high damage, switch to survival DI
          var0 = TopNX * -1
          AbsStick var0 1
        else
          AbsStick var0 var1
        endif
        if Equal LevelValue 75 && YDistBackEdge > -5 && Equal IsOnStage 1
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
    // tempVar = Damage / 100
    // tempVar *= 0.75
    // if Rnd < tempVar
    //   var18 = 1
    //   Call FakeOutHub
    // endif
    
//     {HITSTUN_ENDS}
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

//     {HITSTUN_ENDS}
    CallI MainHub
    Return
  endif

  if CurrAction >= 17 && CurrAction <= 23
    var4 += 1
  endif

  if FramesHitstun > 0
    Return
  endif
endif

label end
CallI MainHub
Return

label _checkTech
  if var2 <= 0
    if CurrAction >= 66 && CurrAction <= 77 && FramesSinceShield > 40
      var17 = OEndFrame - 15
      if Equal CurrAction 66 && OAnimFrame < var17
        Return
      endif
      var17 = (100 - LevelValue) / 100 * -1
      var17 += 0.85
      if Rnd < var17
        if YSpeed <= 0.05
          var5 = Rnd * 4 - 2
        endif
        Button R
      endif
      var2 = 41
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
