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
XReciever
Seek hitlag

if FramesHitlag > 2
  // SDI input frequency:
  // level 9: once per 20 frames
  // level 1: once per 50 frames
  immediateTempVar = (1 - (LevelValue / 100)) * 30 + 20
  MOD immediateTempVar FramesHitlag immediateTempVar

  #let sdiChance = var0
  GET_CHAR_TRAIT_SEEK(sdiChance, chr_pt_SDIChance, hitlag)
  if Equal immediateTempVar 6 && Rnd <= sdiChance
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
elif FramesHitlag > 1 && YDistBackEdge > -4
  immediateTempVar = 0
  globTempVar = LevelValue * 0.01
  if LevelValue >= LV7 && Rnd < globTempVar
    immediateTempVar = TopNX * -1
    if FramesSinceShield > 100
      Button R
    endif
  endif

  predictionConfidence globTempVar man_ODefendOption LevelValue
  globTempVar *= 2
  predictOOption anotherTempVar man_ODefendOption LevelValue 
  if Rnd < 0.6
    AbsStick immediateTempVar (-1)
  elif Rnd < globTempVar && Equal anotherTempVar op_defend_attack 
    AbsStick OPos (-1)
  else
    AbsStick immediateTempVar
  endif
  Return
elif FramesHitlag > 1
  Return
endif

label hitstun
// XGoto PerFrameChecks
// XReciever
// Seek hitstun

#let stickX = var0
#let stickY = var1
#let techWindow = var2
#let MCWindow = var3
#let framesOnGround = var4
#let techDirection = var5
if FramesHitstun > 0 || Equal CurrAction hex(0x42) 
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
  label HSHandler
  XGoto PerFrameChecks
  XReciever
  Seek HSHandler

  if LevelValue >= LV3
    if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
      Goto _checkTech
    elif Equal IsOnStage 1 && YDistBackEdge > -12 && TotalYSpeed < 0.02
      Goto _checkTech
    elif Equal CurrAction hex(0x42)
      Goto _checkTech
    endif
  endif

  if !(Equal techDirection -2) && !(Equal CurrAction hex(0x42)) && TotalYSpeed < 0
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
        if KBAngle >= 80 && KBAngle <= 100 && FramesHitlag >= 0 && Damage > 80
          stickX = TotalXSpeed * 10
          if Equal stickX 0
            stickX = Rnd * 2 - 1
            stickX *= 100
          endif
          // if Rnd < 0.15
          //   globTempVar *= -1
          // endif
          ClearStick
          if Damage >= 90
            AbsStick stickX (-1)
          else
            AbsStick stickX
          endif
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

    
    
    Goto _hitstunEnd

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

    Goto _hitstunEnd

    CallI MainHub
    Return
  endif

  if CurrAction >= hex(0x11) && CurrAction <= hex(0x17)
    framesOnGround += 1
  endif

  if FramesHitstun > 0 || Equal CurrAction hex(0x42)
    Return
  elif CurrAction >= hex(0x4E) && CurrAction <= hex(0x64)
    Return
  endif
endif

label end
CallI MainHub
Return

label _hitstunEnd
  predictionConfidence globTempVar man_ODefendOption LevelValue
  globTempVar *= 2
  predictOOption anotherTempVar man_ODefendOption LevelValue 
  if Rnd < globTempVar && !(Equal anotherTempVar op_defend_shield)
    XGoto CalcAttackGoal
    XReciever

    XGoto SetAttackGoal
    XReciever

    skipMainInit = sm_execAttack
    CallI MainHub
  endif 
Return

label _checkTech
  if techWindow <= 0
    if CurrAction >= hex(0x42) && CurrAction <= hex(0x4D) && FramesSinceShield > 40
      globTempVar = OEndFrame - 25
      if Equal CurrAction hex(0x42)
        if OAnimFrame < globTempVar || Rnd < 0.1
          Return
        endif
      endif
      globTempVar = (100 - LevelValue) / 100 * -1
      globTempVar += 0.85
      if Rnd < globTempVar
        if TotalYSpeed <= 0.03 || Equal CurrAction hex(0x42)
          techDirection = Rnd * 4 - 2
        endif
        Button R
      endif
      techWindow = 15
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