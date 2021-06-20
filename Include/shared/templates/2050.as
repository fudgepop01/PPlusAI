// forced-switch when hit by an attack
#include <Definition_AIMain.h>
//TrueID=0x2050
id 0x2050

//Set Unknown
unk 0x0

//Strings

Cmd30

if Equal movePart hex(0xFF)
  Seek drifting
  Jump
endif

if Equal AirGroundState 1 && CurrAction <= hex(0x10)
  lastScript = hex(0x8002)
  Call ApproachHub
endif

//______________________________________
// Rand DI / tech "smart" implementation
// randomly DIs unless conditions are met for survival DI
#let StickX = var7
#let StickY = var8
#let TechWindow = var2
#let MeteorCancelWindow = var3
#let framesOnGround = var4
#let tempVar = var5

if !(Equal lastScript hex(0x2050)) && Equal OHitboxConnected 1
  immediateTempVar = -1
  if Equal lastScript hex(0x8001)
    immediateTempVar = man_approach
  elif Equal lastScript hex(0x8005)
    immediateTempVar = man_defend
  elif Equal lastScript hex(0x8007)
    immediateTempVar = man_shield
  endif

  lastScript = hex(0x2050)

  if Equal OCurrAction hex(0x3C)
    trackOAction immediateTempVar op_grab
  else 
    trackOAction immediateTempVar op_attack
  endif

  if ODistLE 100
    // if YDistBackEdge > -3 && YDistBackEdge <= 3
      immediateTempVar = TopNX - OTopNX
      Abs immediateTempVar
      immediateTempVar += 5
      if immediateTempVar > 126
        immediateTempVar = 126
      endif
      trackOAction man_oXHitDist immediateTempVar
      trackOAction man_oXAttackDist immediateTempVar
      LOGSTR str("PREDICT")
      LOGVAL globTempVar

      immediateTempVar = TopNY - OTopNY
      Abs immediateTempVar
      immediateTempVar += 5
      if immediateTempVar > 126
        immediateTempVar = 126
      endif
      trackOAction man_oYAttackDist immediateTempVar
    // endif
  endif
endif

// if in hitstun...
if FramesHitstun > 0 || FramesHitlag > 0
  label hitstunHandler
  lastScript = hex(0x8000)
  if LevelValue >= LV7
    StickX = Rnd * 4 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      StickX *= -1
    endif  
    if Rnd < 0.2
      StickX *= -1
    endif
  else
    StickX = (Rnd * 2) - 1
  endif
  if LevelValue >= LV6
    StickY = Rnd - 1.5
  else
    StickY = (Rnd * 2) - 1
  endif
  if Rnd < 0.2
    StickY *= -1
  endif
  TechWindow = 1
  MeteorCancelWindow = Rnd * 5 + 15
  framesOnGround = 0
  // makes it loop from here each frame
  label _hitstunExecutor
  Cmd30

  if FramesHitlag > 1 && Equal LevelValue LV9 
    if Rnd < 0.75
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
  elif Equal FramesHitlag 1 && LevelValue >= LV7 && YDistBackEdge > -1
    immediateTempVar = 0
    globTempVar = LevelValue * 0.01
    if LevelValue >= LV8 && Rnd < globTempVar
      immediateTempVar = TopNX * -1
      if FramesSinceShield > 100
        Button R
      endif
    endif
    AbsStick immediateTempVar (-1)
    Return
  endif
endif

if FramesHitlag > 1
  Seek hitstunHandler
  Return
endif

if Equal IsOnStage 0
  if CurrAction < hex(0x42) || CurrAction > hex(0x49)
    Call RecoveryHub
  endif
endif

if LevelValue >= LV3
  if Equal IsOnStage 0 && Equal CurrAction 69 && FramesHitlag <= 1
    Goto _checkTech
  elif Equal IsOnStage 1 && YDistBackEdge > -12 && YSpeed < 0
    Goto _checkTech
  endif
endif

if CurrAction < hex(0xB) || CurrAction > hex(0x10)
  if FramesHitstun > 1 && Equal AirGroundState 2 || CurrAction >= hex(0x42) && CurrAction <= hex(0x44) && Equal AirGroundState 2 
    ClearStick
    if Equal StickX 1 || Equal StickX -1.2 || Equal StickX -3
      if Equal StickX 0
        AbsStick 0.3 0
        Return
      endif
      AbsStick StickX 0
      Return
    elif True
      if KBAngle >= 80 && KBAngle <= 100
        globTempVar = Direction * -1
        AbsStick globTempVar (-1)
      elif Equal IsOnStage 0 || KBSpeed > 3.7
        // if offstage with high damage, switch to survival DI
        StickX = TopNX * -1
        AbsStick StickX 1
      else
        AbsStick StickX StickY
      endif
      if Equal LevelValue LV8 && YDistBackEdge > -5 && Equal IsOnStage 1
        ClearStick
        AbsStick StickX (-1)
      endif
    endif
    // until hitstun is 0
    if LevelValue >= LV7
      Goto _checkMeteorCancel
    endif
    Return
  endif
elif FramesHitstun > 0 && Equal DistFrontEdge DistBackEdge
  Call RecoveryHub
endif

if FramesHitstun > 1 && CurrAction >= hex(0x43) && CurrAction <= hex(0x45) && LevelValue >= LV8
  globTempVar = OPos * -1
  if XDistBackEdge > -shortEdgeRange
    globTempVar = OPos
  endif
  Stick globTempVar (-1)
  Return
endif

if FramesHitstun > 0 && CurrAction <= hex(0x10)
  Seek
  Jump
elif FramesHitstun > 0 && framesOnGround > 3 && LevelValue >= LV5
  label
  tempVar = Damage / 100
  tempVar *= 0.75
  if Rnd < tempVar
    movePart = 1
    Call FakeOutHub
  endif
  
  {HITSTUN_ENDS}
  Seek
  Jump
elif Equal FramesHitstun 1 && LevelValue >= LV5
  label
  #let isGoingOffstage = var5
  GOING_OFFSTAGE(isGoingOffstage, var6, 15)
  if !(Equal isGoingOffstage 0)
    Call AIHub
    Return
  endif

  tempVar = Damage / 100
  tempVar *= 0.4
  if Rnd < tempVar && ODistLE 40
    Call FakeOutHub
  endif

  {HITSTUN_ENDS}
  Call AIHub
  Return
endif

if CurrAction >= hex(0x11) && CurrAction <= hex(0x17)
  framesOnGround += 1
endif

if FramesHitstun > 0 || FramesHitlag > 0
  Return
endif

Call AIHub
Return

// Goto statements will return back to where they came
// from if there isn't a label, making this possible
//
// makes the AI input R every 41 frames 80% (base) of the time
label _checkTech
if TechWindow <= 0
  if CurrAction >= 69 && CurrAction <= 77 && FramesSinceShield > 40
    tempVar = (100 - LevelValue) / 100 * -1
    tempVar += 0.95
    if Rnd < tempVar
      Button R
    endif
    TechWindow = 41
  endif
endif
TechWindow -= 1
Return

// THIS DOESN'T WORK
// YOU SPENT 4 HOURS TRYING TO MAKE IT WORK
// MAKING IT WORK BREAKS ALL OTHER RECOVERIES
// IT'S NOT WORTH IT BRO
// label _processTechInputs
// if LevelValue >= LV6
//   immediateTempVar = 60
// else 
//   immediateTempVar = 100
// endif
// predictOOption globTempVar man_own_techchase immediateTempVar 
// predictionConfidence immediateTempVar man_own_techchase immediateTempVar

// if immediateTempVar >= 0.4 && Rnd < immediateTempVar
//   label _mixups
//   if !(Equal globTempVar op_towards) && Rnd < 0.5
//     Seek towards
//     Jump
//   elif !(Equal globTempVar op_away) && Rnd < 0.5
//     Seek away
//     Jump
//   endif
//   Seek _mixups
//   Jump
// elif True
//   label _habits
//   if Equal globTempVar op_towards || immediateTempVar <= 0.2 && Rnd < 0.5
//     Seek towards 
//     Jump
//   elif Equal globTempVar op_away || immediateTempVar <= 0.2 && Rnd < 0.85
//     Seek away 
//     Jump
//   endif
//   Seek _habits
//   Jump
// endif


// if !(True)
//   label towards
//     if OPos < 0
//       StickX = -3
//     else
//       StickX = 1
//     endif
//     trackOAction man_own_techchase op_towards
//     Seek _executedRoll
//     Return
//   label away
//     if OPos < 0
//       StickX = 1
//     else
//       StickX = -3
//     endif
//     trackOAction man_own_techchase op_away
//     Seek _executedRoll
//     Return
//   label _executedRoll
//     Seek _hitstunExecutor
//     Return
// endif
// Return

// meteor cancels when applicable 90% (base) of the time with
// a jump 50% of the time (if possible), otherwise with upB
label _checkMeteorCancel
if KBAngle >= 260 && KBAngle <= 280 && MeteorCancelWindow <= 0 && Equal IsOnStage 0 && YDistFrontEdge > 0
  tempVar = (100 - LevelValue) / 100
  tempVar = 0.9 - tempVar
  if Rnd < 0.9
    if CanJump && Rnd < 0.5
      Button X
    elif CanJump && YDistFrontEdge > 40
      Button X
    else
      Stick 0 0.7
      Button B
      Call RecoveryHub
    endif
  endif
  MeteorCancelWindow = 41
endif
MeteorCancelWindow -= 1
Return

label Hitstun_End
  if YDistBackEdge > -20 || LevelValue <= LV5
    Call AIHub
    Return
  endif
  #let rndX = var2
  #let rndY = var3
  GetRndPointOnStage rndX
  label drifting
  if FramesHitlag > 0 || FramesHitstun > 0
    Call OnGotDamaged
  endif
  if !(Equal AirGroundState 1) && !(Equal XDistFrontEdge XDistBackEdge) && YDistBackEdge < -20
    if Rnd <= 0.02 && CanJump
      Button X
    endif
    if XDistLE 70
      immediateTempVar = OPos * -1
      AbsStick immediateTempVar
    else
      rndX = TopNX - rndX
      AbsStick rndX // the stick X var
    endif
    if YDistBackEdge > -12 && Rnd < 0.4 && Equal CurrAction hex(0x49)
      Button R
    endif
    Return
  endif
  Call AIHub
Return
Return
