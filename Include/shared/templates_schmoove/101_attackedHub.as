#include <Definition_AIMain.h>
id 0x8101
unk 0x0

XReciever
currGoal = cg_inHitstun
if Equal OHitboxConnected 1
  immediateTempVar = TopNX - OTopNX
  Abs immediateTempVar
  immediateTempVar += 6
  trackOAction man_OXHitDist immediateTempVar
endif

label hitlag
XGoto PerFrameChecks
XReciever
Seek hitlag

if FramesHitlag > 1
  // SDI input frequency:
  // level 9: once per 20 frames
  // level 1: once per 50 frames
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 20
  MOD immediateTempVar FramesHitlag immediateTempVar
  if Equal immediateTempVar 6 && Rnd <= pt_SDIChance
    globTempVar = OPos * -1
    if XDistBackEdge > -shortEdgeRange
      globTempVar = OPos
    endif
    immediateTempVar = Rnd * 2 - 1
    if YDistBackEdge > -0.5 && LevelValue >= LV8
      immediateTempVar = -1
    endif
    AbsStick globTempVar immediateTempVar
  endif
  Return
elif FramesHitlag > 0 && YDistBackEdge > -1
  immediateTempVar = 0
  globTempVar = LevelValue * 0.01
  if LevelValue >= LV7 && Rnd < globTempVar
    immediateTempVar = TopNX * -1
    if FramesSinceShield > 100
      Button R
    endif
  endif
  if Rnd < 0.6
    AbsStick immediateTempVar (-1)
  else
    AbsStick immediateTempVar
  endif
  Return
elif FramesHitlag > 0
  Return
endif

label hitstun
XGoto PerFrameChecks
XReciever
Seek hitstun

#let stickX = var0
#let stickY = var1
#let techWindow = var2
#let MCWindow = var3
#let framesOnGround = var4
#let techDirection = var5
if FramesHitstun > 0
  if LevelValue >= LV6
    stickX = Rnd * 4 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      stickX *= -1
    endif  
    if Rnd < 0.2
      stickX *= -1
    endif
  else
    stickX = (Rnd * 2) - 1
  endif
  if LevelValue >= LV6
    stickY = Rnd - 1.5
  else
    stickY = (Rnd * 2) - 1
  endif
  if Rnd < 0.2
    stickY *= -1
  endif
  techWindow = 1
  MCWindow = Rnd * 5 + 15
  framesOnGround = 0
  techDirection = -2
  label hitstun_handler
  XGoto PerFrameChecks
  XReciever
  Seek hitstun_handler
  
  if FramesHitlag > 1
    Seek hitlag
    Jump
  endif

  if LevelValue >= LV3
    if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
      Goto _checkTech
    elif Equal IsOnStage 1 && YDistBackEdge > -12 && YSpeed < 0
      Goto _checkTech
    endif
  endif

  if !(Equal techDirection -2)
    if techDirection < -0.5
      AbsStick -1
    elif 0.5 < techDirection
      AbsStick 1
    else
      ClearStick
    endif
  elif CurrAction < hex(0xB) || hex(0x10) < CurrAction
    if !(Equal AirGroundState 1)
      if FramesHitstun > 1
        Goto exec_DI
        Return
      elif CurrAction >= hex(0x42) && CurrAction <= hex(0x45)
        Goto exec_DI
        Return
      endif
    endif
    if !(True)
      label exec_DI
      LOGVAL stickX
      ClearStick
      if Equal stickX 1 || Equal stickX -1.2 || Equal stickX -3
        if Equal stickX 0
          AbsStick 0.3 0
          Return
        endif
        AbsStick stickX 0
        Return
      elif True
        if KBAngle >= 80 && KBAngle <= 100
          globTempVar = Direction * -1
          if KBAngle > 90
            globTempVar *= -1
          endif
          if Rnd < 0.15
            globTempVar *= -1
          endif
          AbsStick globTempVar (-1)
        elif Equal IsOnStage 0 || KBSpeed > 3.7
          // if offstage with high damage, switch to survival DI
          stickX = TopNX * -1
          AbsStick stickX 1
        else
          AbsStick stickX stickY
        endif
        if Equal LevelValue LV8 && YDistBackEdge > -5 && Equal IsOnStage 1
          ClearStick
          AbsStick stickX (-1)
        endif
      endif
      // until hitstun is 0
      if LevelValue >= LV6
        Goto _checkMeteorCancel
      endif
      Return
    endif
  endif

  if FramesHitstun > 0 && CurrAction <= hex(0x10)
    Seek
    Jump
  elif FramesHitstun > 0 && framesOnGround > 3 && LevelValue >= LV5
    label
    // tempVar = Damage / 100
    // tempVar *= 0.75
    // if Rnd < tempVar
    //   movePart = 1
    //   Call FakeOutHub
    // endif
    
    {HITSTUN_ENDS}
    Seek
    Jump
  elif Equal FramesHitstun 1 && LevelValue >= LV5
    label
    #let isGoingOffstage = var5
    GOING_OFFSTAGE(isGoingOffstage, var6, 15)
    if !(Equal isGoingOffstage 0)
      CallI MainHub
      Return
    endif

    // tempVar = Damage / 100
    // tempVar *= 0.4
    // if Rnd < tempVar && ODistLE 40
    //   Call FakeOutHub
    // endif

    {HITSTUN_ENDS}
    CallI MainHub
    Return
  endif

  if CurrAction >= hex(0x11) && CurrAction <= hex(0x17)
    framesOnGround += 1
  endif

  if FramesHitstun > 0
    Return
  endif
endif

label end
CallI MainHub
Return

label _checkTech
  if techWindow <= 0
    if CurrAction >= hex(0x42) && CurrAction <= hex(0x4D) && FramesSinceShield > 40
      globTempVar = OEndFrame - 15
      if Equal CurrAction hex(0x42) && OAnimFrame < globTempVar
        Return
      endif
      globTempVar = (100 - LevelValue) / 100 * -1
      globTempVar += 0.85
      if Rnd < globTempVar
        if YSpeed <= 0.05
          techDirection = Rnd * 4 - 2
        endif
        Button R
      endif
      techWindow = 41
    endif
  endif
  techWindow -= 1
Return

label _checkMeteorCancel
  if KBAngle >= 260 && KBAngle <= 280 && MCWindow <= 0 && Equal IsOnStage 0
    globTempVar = (100 - LevelValue) / 100
    globTempVar = 0.9 - globTempVar
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
    MCWindow = 41
  endif
  MCWindow -= 1
Return
Return