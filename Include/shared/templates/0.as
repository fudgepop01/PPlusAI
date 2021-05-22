#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000
unk 0x0

label begin

{PRE_HOOKS}

if Equal movePart mp_ATK || Equal movePart hex(0xFF)
  movePart = 0
endif

if Equal CurrAction hex(0x114) || Equal CurrAction hex(0x10)
  Call RecoveryHub
endif

if LevelValue <= LV6
  if Rnd < 0.2
    Return
  endif
endif

if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
  Call OOSHub
endif

if Equal approachType at_reroll
  Seek _reroll
  Jump
endif

if Equal CurrAction hex(0x49) || Equal globTempVar strv("BAD")
  Seek Hitstun_End
  Jump
endif

if Equal LevelValue LV9
  if CurrAction >= hex(0x1E) && CurrAction <= hex(0x20)
    Stick 0 (-1)
    Return
  elif CurrAction >= hex(0x4E) && CurrAction <= hex(0x53)
    Stick 0 (-1)
    Return
  elif CurrAction >= hex(0x60) && CurrAction <= hex(0x61)
    Stick 0 (-1)
    Return
  endif
endif

//______________________________________
// Rand DI / tech "smart" implementation
// randomly DIs unless conditions are met for survival DI
#let StickX = var0
#let StickY = var1
#let TechWindow = var2
#let MeteorCancelWindow = var3
#let tempVar = var4
#let framesOnGround = var5

// if in hitstun...
if FramesHitstun > 0 || FramesHitlag > 0
  label hitstunHandler
  lastScript = hex(0x8000)
  if LevelValue >= LV7
    StickX = Rnd * 2 * OPos * -1
    if KBAngle > 90 && KBAngle < 170
      StickX *= -1
    endif  
    if Rnd < 0.2
      StickX *= -1
    endif
  else
    StickX = (Rnd * 2) - 1
  endif
  StickY = Rnd - 1
  if Rnd < 0.2
    StickY *= -1
  endif
  TechWindow = 1
  MeteorCancelWindow = Rnd * 5 + 15
  framesOnGround = 0
  // makes it loop from here each frame
  label
  Cmd30

  if FramesHitlag > 0 && Equal LevelValue LV9 
    if Rnd < 0.75
      globTempVar = OPos * -1
      if XDistBackEdge > -shortEdgeRange
        globTempVar = OPos
      endif
      immediateTempVar = Rnd * 2 - 1
      AbsStick globTempVar immediateTempVar
    endif
    Return
  endif
endif

if FramesHitstun > 1 && CurrAction >= hex(0x44) && CurrAction <= hex(0x45) && Equal AirGroundState 2 
  LOGSTR str("hitst")
  LOGVAL KBAngle
  if KBAngle >= 80 && KBAngle <= 100
    LOGSTR str("cond1")
    globTempVar = OPos * -1
    if KBAngle > 90
      globTempVar *= -1
    endif
    if Rnd < 0.2
      globTempVar *= -1
    endif
    AbsStick globTempVar (-1)
  elif Equal IsOnStage 0 || KBSpeed > 4
    LOGSTR str("cond2")
    // if offstage with high damage, switch to survival DI
    StickX = TopNX * -1
    AbsStick StickX 1
  else
    LOGSTR str("cond3")
    AbsStick StickX StickY
  endif
  if Equal LevelValue LV8 && YDistBackEdge > -5 && Equal IsOnStage 1
    ClearStick
    AbsStick StickX (-1)
  endif
  // until hitstun is 0
  if LevelValue >= LV7
    Goto _checkMeteorCancel
  endif
  if LevelValue >= LV3
    Goto _checkTech
  endif
  Return
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
  var0 = Damage / 100
  var0 *= 0.75
  if Rnd < var0
    movePart = 1
    Call FakeOutHub
  endif
  
  {HITSTUN_ENDS}
  Seek
  Jump
elif Equal FramesHitstun 1 && LevelValue >= LV5
  label
  #let isGoingOffstage = var0
  GOING_OFFSTAGE(isGoingOffstage, var1, 15)
  if !(Equal isGoingOffstage 0)
    Seek begin
    Return
  endif

  var0 = Damage / 100
  var0 *= 0.75
  if Rnd < var0
    Call FakeOutHub
  endif

  {HITSTUN_ENDS}
  Seek begin
  Return
endif

if CurrAction >= hex(0x11) && CurrAction <= hex(0x17)
  framesOnGround += 1
endif

if FramesHitstun > 0 || FramesHitlag > 0
  Return
endif
Seek _main
Jump
Return

// Goto statements will return back to where they came
// from if there isn't a label, making this possible
//
// makes the AI input R every 41 frames 80% (base) of the time
label _checkTech
if TechWindow <= 0
  if CurrAction >= hex(0x45) && CurrAction <= hex(0x4D) && FramesSinceShield > 40
    tempVar = (100 - LevelValue) / 100 * -1
    tempVar += 0.8
    if Equal IsOnStage 0 && Equal CurrAction hex(0x45) && FramesHitlag <= 1
      if Rnd < tempVar
        Button R
      endif
      TechWindow = 41
    elif Equal IsOnStage 1 && YDistBackEdge > -7 && YSpeed < 0
      if Rnd < tempVar
        Button R
      endif
      TechWindow = 41
    endif
  endif
endif
TechWindow -= 1
Return

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

// the stuff here happens when not in hitstun.
label _main
#let waitTeamFlag = var6
waitTeamFlag = 0

// for efficiency, we just use a label here so we don't need to call the
// stuff above every frame we're in here
label
Cmd30
#let isGoingOffstage = var0
GOING_OFFSTAGE(isGoingOffstage, var1, 15)

if Equal CurrAction hex(0x18) && !(Equal HitboxConnected 1)
  Seek _main
  Return
endif

// where RecoveryHub (4.as) is called
if Equal isGoingOffstage 2 && !(Equal AirGroundState 1)
  movePart = 0
  Call RecoveryHub
endif

if !(True)
  label Hitstun_End
  if YDistBackEdge > -25 || LevelValue <= LV5
    Seek _main
    Return
  endif
  label
  if !(Equal AirGroundState 1) && Rnd <= 0.95 && !(Equal XDistFrontEdge XDistBackEdge) && YDistBackEdge < -50
    #let rndX = var2
    #let rndY = var3
    GetRndPointOnStage rndX
    if Rnd < 0.03 && CanJump
      Button X
    endif
    rndX = TopNX - rndX
    AbsStick rndX // the stick X var
    if YDistBackEdge > -3 && Rnd < 0.4 && Equal CurrAction hex(0x49)
      Button R
    endif
    Return
  endif
  Seek _main
  Return
endif

if Equal isGoingOffstage 0 && YDistBackEdge > -15 && Equal CurrAction hex(0x33) && LevelValue >= LV7
  {L_CANCEL}
endif

if MeteoChance && !(Equal isGoingOffstage 2)
  movePart = 0
  Call EdgeguardHub
endif

// if we're going to go over an edge of a stage while performing a move,
// we hold the control stick in the opposite direction

label
if FramesHitstun > 1
  Seek hitstunHandler
  Jump
  Return
endif
if !(Equal isGoingOffstage 0)
  if InAir || Equal CurrAction hex(0x03)
    var0 = XSpeed * -10
    AbsStick var0 0
    Return
  endif
elif InAir && YDistBackEdge > -5 && Equal IsOnStage 1
  if !(Idling) && !(Lying)
    Return
  endif
  tempVar = OPos * -1
  AbsStick tempVar
  if Equal CurrAction hex(0x01)
    ClearStick
  endif
  if Dashing || XDistFrontEdge < 20
    Seek _main
  endif
  Return
endif

// if we reach here then it's time to choose an attack to perform
// if the opponent is in hitstun and we want to combo, we'll go to the
// ComboHub (2.as)
if !(Equal noCombo noComboVal)
  if Equal HitboxConnected 1 && LevelValue >= LV5
    // if Equal CurrAction hex(0x18)
    //   Seek _main
    //   Return
    // endif
    Call ComboHub
  elif OFramesHitstun > 0 && LevelValue >= LV5
    Call ComboHub
  endif
endif

ClearStick
if Equal AirGroundState 1
  if XDistBackEdge > -15 && XDistFrontEdge > 20
    Stick 1
    Return
  elif XDistFrontEdge < 15 && XDistBackEdge < -20
    Stick -1
    Return
  endif
endif

GetIsTeammateCloser waitTeamFlag
if Equal waitTeamFlag 1
  if XDistLE 60 && XDistFrontEdge > shortEdgeRange && XDistBackEdge < -shortEdgeRange
    globTempVar = OPos * -1
    if Equal Direction globTempVar && XDistFrontEdge > shortEdgeRange
      Stick 1
    elif !(Equal Direction globTempVar) && XDistBackEdge < -shortEdgeRange
      Stick -1
    endif
  endif
  if !(XDistLE 100)
    if Equal Direction OPos && XDistFrontEdge > shortEdgeRange
      Stick 1
    elif !(Equal Direction OPos) && XDistBackEdge < -shortEdgeRange
      Stick -1
    endif
  endif
  Seek _main
  Return
endif

approachType = 0
moveVariant = 0
movePart = 0
hit_knockback = -1

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction hex(0x49)
  TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 50 + 25, _afterTCS, _afterTCS)
endif

IS_EARLY_ROLL(var0, var1)

#let moveSelection = var0
if Equal isEarlyRoll 0
  label _afterTCS
  {TECH_CHASE_OPTIONS}  

  moveSelection = 0
  SAFE_INJECT_0 moveSelection
  SAFE_INJECT_1 moveVariant
  // because we don't want to set the moveSelection again if we revisit
  // this, we place a label here to jump to
  label callers
  if moveSelection >= 1
    lastScript = hex(0x8000)
    if moveSelection < 2
      Call Jab123
    elif moveSelection < 3
      Call DashAttack
    elif moveSelection < 4
      Call FTilt
    elif moveSelection < 5
      Call UTilt
    elif moveSelection < 6
      Call DTilt
    elif moveSelection < 7
      Call FSmash
    elif moveSelection < 8
      Call USmash
    elif moveSelection < 9
      Call DSmash
    elif moveSelection < 10
      Call NSpecial
    elif moveSelection < 11
      Call SSpecial
    elif moveSelection < 12
      Call DSpecial
    elif moveSelection < 13
      Call Grab
    elif moveSelection < 14
      Call NAir
    elif moveSelection < 15
      Call FAir
    elif moveSelection < 16
      Call BAir
    elif moveSelection < 17
      Call UAir
    elif moveSelection < 18
      Call DAir
    elif moveSelection < 19
      Call NSpecialAir
    elif moveSelection < 20
      Call SSpecialAir
    elif moveSelection < 21
      Call USpecialAir
    elif moveSelection < 22
      Call DSpecialAir
    endif
  elif YDistBackEdge > -40

    if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1C) && Rnd < 0.7 && XDistLE 25
      Call Grab
    endif

    if OCurrAction >= hex(0x55) && OCurrAction <= hex(0x5D)
      {PUNISH_BROKEN_SHIELD}
    endif

    RetrieveATKD var0 OCurrSubaction 1
    #let oDangerStart = var0
    #let oDangerEnd = var1
    #let oDangerXMin = var2
    #let oDangerXMax = var3
    #let oDangerYMin = var4
    #let oDangerYMax = var5

    #let injected = var7
    injected = 0
    SAFE_INJECT_1 injected
    if LevelValue >= LV6 && Equal waitTeamFlag 0 && Equal injected 0 && !(SamePlane) && TopNY < OTopNY && Equal OAirGroundState 1
      {O_ON_PLAT_ABOVE}
    endif 

    if LevelValue >= LV7 && Equal waitTeamFlag 0 && injected <= 1
      if Equal injected 1
        Call FakeOutHub
      elif oDangerEnd < OAnimFrame || Equal OCurrAction hex(0x25)
        if OAttacking && Rnd < 0.8 && !(Equal lastScript hex(0x8008)) && XDistLE oDangerXMax
          movePart = 1
          Call FakeOutHub
        endif
      elif OAttacking && oDangerEnd > OAnimFrame && !(Equal oDangerStart -1) && Rnd < 0.5 && Equal AirGroundState 1 && LevelValue >= LV8 && !(Equal OCurrAction hex(0x1B))
        {WHIFF_PUNISH_OPTIONS}
      elif Rnd < 0.1 && !(Equal lastScript hex(0x8008)) 
        Call FakeOutHub
      endif
    endif

    lastScript = hex(0x8000)

    #let defenseMul = var3
    defenseMul = Damage - ODamage
    defenseMul /= 200

    if LevelValue >= LV5 && Equal waitTeamFlag 0 && injected <= 2
      #let tempVar = var0
      #let tempVar2 = var1
      #let defenseChance = var2

      defenseChance = defenseMul * 0.1

      if XDistLE 30 && Rnd < 0.4 && Equal AirGroundState 1
        if Rnd < defenseChance || Rnd < 0.04
          approachType = at_defend
        endif
        Call NeutralHub
      elif Equal injected 2
        Call NeutralHub
      endif
    endif

    if LevelValue >= LV7 && Equal waitTeamFlag 0 && injected <= 2
      #let fakeChance = var2
      fakeChance = defenseMul * 0.10
      Abs fakeChance
      if Rnd < fakeChance
        Call FakeOutHub
      endif
    endif

    if Equal waitTeamFlag 0 && injected <= 3
      #let defenseChance = var2
      defenseChance = defenseMul * 0.1
      if Rnd < defenseMul || Rnd < 0.05 || Equal injected 3
        approachType = at_defend
        {DEFENSE_OPTIONS}
      endif
    endif
    approachType = at_attack

    // if the opponent is lying there doing nothing
    if LevelValue >= LV6 && Equal waitTeamFlag 0
      if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D)
        {PUNISH_KNOCKDOWN_OPTIONS}
      endif
    endif

    if LevelValue >= LV5 && Equal OAirGroundState 3
      Call EdgeguardHub
    endif

    {ADDITIONAL_PREMAIN_OPTIONS}

    if Equal OCurrAction hex(0x25) && !(Equal ODirection Direction)
      Seek callers
      Jump
    endif

    #let ODmgXWeight = var2
    GET_WEIGHT_TABLE(ODmgXWeight, var1)

    ODmgXWeight = ODmgXWeight - 200
    ODmgXWeight *= -1
    ODmgXWeight /= 100
    ODmgXWeight *= ODamage

    if LevelValue >= LV3
      {MAIN_OPTIONS}
      moveSelection = Rnd * 5 + 12
      Seek callers
      Jump
    else
      moveSelection = Rnd * 18
      Seek callers
    endif
  elif True
    {HIGHUP_OPTIONS}
  endif
endif
Return

label comboStarters
#let ODmgXWeight = var2

globTempVar = TopNY - OTopNY
Abs globTempVar
if ODistLE 8 && globTempVar < 20 && Equal AirGroundState 1
  approachType = at_immediate
endif
{COMBO_STARTERS}
Return

label killMoves
#let ODmgXWeight = var2
{KILL_MOVES}
Return

label neutralMoves
#let ODmgXWeight = var2
approachType = at_throwOut

globTempVar = TopNY - OTopNY
Abs globTempVar
if ODistLE 8 && globTempVar < 20 && Equal AirGroundState 1
  approachType = at_immediate
endif
{NEUTRAL_MOVES}
Return

label _reroll

if Rnd <= 0.25
  Seek _main 
  Jump
  Return
endif

#let tries = var0
tries = 5
if Equal Direction OPos
  label rrFront
  $refreshMoves()
  $filterMoveXMinMax(-1, 20)
  $output(Call)
  if tries <= 0
    Seek _main
  else
    Seek rrFront
  endif
  tries -= 1
  Jump
  Return
elif True
  label rrBack
  $refreshMoves()
  $filterMoveXMinMax(-20, 1)
  $output(Call)
  if tries <= 0
    Seek _main
  else
    Seek rrBack
  endif
  tries -= 1
  Jump
  Return
endif
Return
Return