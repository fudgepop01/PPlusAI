#include <Definition_AIMain.h>
id 0x8101
unk 0x0

//= XReciever

#let techDirection = var5
if CalledFrom MainHub
  techDirection = -2
  Goto _checkTech
  if Equal techDirection -2 
    Return
  endif
  Seek HSHandler
  Jump
endif
currGoal = cg_inHitstun

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
SetDebugOverlayColor color(0xFFFFFFDD)

if FramesHitlag > 0 && Equal PrevAction hex(0x12)
  AbsStick 0 -1
  Return
endif

if FramesHitlag > 2
  // SDI input frequency:
  // level 9: once per 20 frames
  // level 1: once per 50 frames
  #let sdiChance = var0
  sdiChance = PT_SDICHANCE * 0.4
  
  immediateTempVar = (1 - (LevelValue / 100)) * 70 + 15
  if PT_REACTION_TIME > 0.5
    immediateTempVar *= PT_REACTION_TIME
  else
    immediateTempVar *= 0.5
  endif
  // LOGSTR_NL str("thingy")
  // LOGVAL_NL immediateTempVar
  MOD immediateTempVar GameTimer immediateTempVar
  // LOGVAL_NL immediateTempVar
  
  if Equal immediateTempVar 1 && Rnd <= sdiChance
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

  // if FramesSinceShield > 10 && Equal AirGroundState 2 && !(Equal CurrAction hex(0x42))
  //   if FramesSinceShield > 100
  //     Button R
  //   elif YDistFloor < 10 && Rnd < 0.7 && KBAngle < 40
  //     Button R
  //   endif
  // endif
  Return
elif FramesHitlag > 1
  immediateTempVar = 0
  globTempVar = LevelValue * 0.01
  if LevelValue >= LV6 && Rnd < globTempVar && Equal YDistFloor -1
    immediateTempVar = TopNX * -1
  elif LevelValue >= LV6 && CHANCE_MUL_LE PT_SDICHANCE 0.35
    immediateTempVar = OPos * -1
  endif

  PredictOMov globTempVar mov_attack
  globTempVar *= 3
  globTempVar *= LevelValue * 0.01

  if Rnd < 0.75 && Rnd < globTempVar
    AbsStick immediateTempVar (-1)
  elif Rnd < globTempVar && KBXSpeed < 1
    AbsStick OPos (-1)
  else
    AbsStick immediateTempVar
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
SetDebugOverlayColor color(0xFFFFFF66)

#let stickX = var0
#let stickY = var1
#let techWindow = var2
#let MCWindow = var3
#let framesOnGround = var4
if FramesHitstun > 0 || GettingThrown || Equal CurrAction hex(0x49)
  if LevelValue >= LV6
    stickX = Rnd * 10 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      stickX *= -1
    endif
    if Rnd < 0.3
      stickX *= -1
    endif
  else
    stickX = (Rnd * 4) - 2
  endif
  if LevelValue >= LV6
    stickY = (Rnd * 4) - 1
    if Rnd < 0.5
      stickY -= 0.5
    endif
    if Equal IsOnStage 0 || KBSpeed > 3 || DistBackEdge > -20 || DistFrontEdge < 20
      if Rnd < 0.8
        // if offstage with high damage, switch to survival DI
        stickX = TopNX * -1
        stickY = 1
        if KBAngle > 90 && KBAngle < 170
          stickX *= -1 * Rnd
        elif KBAngle > 180
          stickY = 0
        endif
      endif
    endif
  else
    stickY = (Rnd * 2) - 1
  endif
  if Rnd < 0.1
    stickY *= -1
  endif
  techWindow = 40 - FramesSinceShield
  MCWindow = Rnd * 10 + 26
  framesOnGround = 0
  techDirection = -2
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
  if LevelValue >= LV3 && Equal techDirection -2
    if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
      Goto _checkTech
    elif GettingThrown
      Goto _checkTech
    elif Equal PrevAction hex(0x42) && AnimFrame < 5
    elif Equal IsOnStage 1 && YDistFloor < 25 && TotalYSpeed < 0.3
      Goto _checkTech
    endif
  endif
  Seek HSHandler
  // LOGSTR str("Y stats")
  // LOGVAL_NL YDistFloor
  // LOGVAL_NL TotalYSpeed
  // PRINTLN
  if !(Equal techDirection -2) && TotalYSpeed <= 0 && YDistFloor > 0 && YDistFloor < 20
    // LOGVAL_NL 10002
    if CurrAction <= hex(0x20)
      Seek _done
      Jump
    endif
    if techDirection < -0.5
      AbsStick -0.7
    elif 0.5 < techDirection
      AbsStick 0.7
    else
      ClearStick
    endif
    Return
  elif CurrAction < hex(0xB) || hex(0x10) < CurrAction
    // until hitstun is 0
    if LevelValue >= LV6
      Goto _checkMeteorCancel
      Seek HSHandler
    endif
    if FramesHitstun > 1
      Goto exec_DI
      Seek HSHandler
      Return
    elif GettingThrown
      Goto exec_DI
      Seek HSHandler
      Return
    endif
    if !(True)
      label exec_DI
      ClearStick
      if KBAngle >= 65 && KBAngle <= 115 && KBSpeed > 1
        stickX = TotalXSpeed * 2
        if stickX > -1 && stickX < 1
          stickX -= OPos
          if Rnd < 0.2
            stickX *= 0.9
          elif Rnd < 0.2
            stickX *= 0.8
          elif Rnd < 0.1
            stickX *= -1
          endif
        endif
        // if Rnd < 0.15
        //   stickX *= -1
        // endif
        ClearStick
        if Damage >= 90
          stickY = -1
          AbsStick stickX stickY
        else
          stickY = 0
          AbsStick stickX stickY
        endif
        Return
      else
        AbsStick stickX stickY
      endif
      // techskill
      immediateTempVar = LevelValue * 0.01
      if immediateTempVar < 0.05
        immediateTempVar = 0.05
      elif immediateTempVar > 0.8
        immediateTempVar = 0.8
      endif
      if YDistBackEdge > -10 && Equal IsOnStage 1 && !(GettingThrown) && Rnd < immediateTempVar
        ClearStick
        AbsStick stickX (-1)
      endif
      Return
    endif
  endif
endif
// LOGVAL_NL 10003
if FramesHitstun > 0 && CurrAction <= hex(0x10)
  Seek _done
  Jump
elif FramesHitstun > 0 && framesOnGround > 3 && LevelValue >= LV5
  label _done
  Seek _done
  // techskill
  immediateTempVar = LevelValue * 0.004
  immediateTempVar -= 0.1
  if immediateTempVar < 0.05
    immediateTempVar = 0.05
  endif

  if Rnd > immediateTempVar
    Return
  endif
  Goto _hitstunEnd

  Seek _done2
  Jump
elif FramesHitstun <= 1 && LevelValue >= LV5
  label _done2
  Seek _done2

  // tempVar = Damage / 100
  // tempVar *= 0.4
  // if Rnd < tempVar && ODistLE 40
  //   Call FakeOutHub
  // endif

  // techskill
  immediateTempVar = 100 - LevelValue
  immediateTempVar *= 0.005
  if immediateTempVar > 0.9
    immediateTempVar = 0.9
  elif immediateTempVar < 0.05
    immediateTempVar = 0.05
  endif

  if Rnd < immediateTempVar
    Return
  endif
  Goto _hitstunEnd

  CallI MainHub
  Return
endif

if CurrAction >= hex(0x11) && CurrAction <= hex(0x17)
  framesOnGround += 1
endif

if FramesHitstun > 0 || GettingThrown
  Return
elif CurrAction >= hex(0x4E) && CurrAction <= hex(0x64)
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

    skipMainInit = mainInitSkip
    CallI MainHub
  else
    currGoal = cg_attack_inCombo
    XGoto CalcAttackGoal
    XGoto SetAttackGoal

    CallI DefendHub
  endif
Return

label _checkTech
  if techWindow <= 0
    if CurrAction >= hex(0x42) && FramesSinceShield > 40
      globTempVar = OThrowReleaseFrame - 10
      if GettingThrown || CurrAction >= hex(0xCC)
        if ShouldTechThrow && OAnimFrame > globTempVar
          // LOGVAL_NL 10001
        else
          Return
        endif
      endif
      globTempVar = (100 - LevelValue) / 100 * -1
      globTempVar += 0.80
      if Rnd < globTempVar && YDistFloor < 20
        if TotalYSpeed <= 0.3 || GettingThrown
          techDirection = Rnd * 5 - 2
        endif
        if techDirection < 2
          // LOGVAL_NL 10002
          Button R
        endif
      endif
      
      // LOGVAL_NL 10003
      techWindow = 2
    endif
  endif
  techWindow -= 1
Return

label _checkMeteorCancel
  if KBAngle >= 230 && KBAngle <= 310 && MCWindow <= 0 && Equal IsOnStage 0
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