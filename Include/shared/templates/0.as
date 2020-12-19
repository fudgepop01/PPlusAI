#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000

//Set Unknown
unk 0x00000

label begin

{PRE_HOOKS}

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

// if in hitstun...
if FramesHitstun > 0 && CurrAction >= hex(0x43) && CurrAction <= hex(0x45)
  //...pick a random direction for the control stick
  StickX = Rnd - 1
  StickY = Rnd - 1
  TechWindow = 1
  MeteorCancelWindow = Rnd * 5 + 15
  // label to make this loop each frame...
  label
  if Equal IsOnStage 0 || Damage > 80
    // if offstage with high damage, switch to survival DI
    StickX = TopNX * -1
    AbsStick StickX 1
  else
    AbsStick StickX StickY
  endif
  // until hitstun is 0
  if Equal FramesHitstun 0
    {HITSTUN_ENDS}
    Seek begin
    Return
  endif
  if LevelValue >= LV7
    Goto _checkMeteorCancel
  endif
  if LevelValue >= LV3
    Goto _checkTech
  endif
  Return
endif

if FramesHitstun > 0 && Equal CurrAction hex(0x43) && LevelValue >= LV8
  Stick 0 (-1)
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
#let isGoingOffstage = var0
GOING_OFFSTAGE(isGoingOffstage, var1, 15)

if Equal CurrAction hex(0x18)
  Seek _main
  Return
endif

// where RecoveryHub (4.as) is called
if Equal isGoingOffstage 2 && Equal AirGroundState 2
  movePart = 0
  Call RecoveryHub
endif

if Equal isGoingOffstage 0 && YDistBackEdge > -15 && Equal CurrAction hex(0x33) && LevelValue >= LV7
  if CanJump && Rnd < 0.5 && LevelValue >= LV8
    Button X
    Return
  else
    {L_CANCEL}
  endif
endif

if MeteoChance && !(Equal isGoingOffstage 2)
  movePart = 0
  Call EdgeguardHub
endif

// if we're going to go over an edge of a stage while performing a move,
// we hold the control stick in the opposite direction

label
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
if Equal HitboxConnected 1 && !(Equal noCombo noComboVal) && LevelValue >= LV5
  if Equal CurrAction hex(0x18)
    Seek _main
    Return
  endif
  Call ComboHub
elif OFramesHitstun > 0 && LevelValue >= LV5
  Call ComboHub
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

// GetIsTeammateCloser waitTeamFlag
// if Equal waitTeamFlag 1
//   if XDistLE 60 && XDistFrontEdge > shortEdgeRange && XDistBackEdge < -shortEdgeRange
//     globTempVar = OPos * -1
//     if Equal Direction globTempVar && XDistFrontEdge > shortEdgeRange
//       Stick 1
//     elif !(Equal Direction globTempVar) && XDistBackEdge < -shortEdgeRange
//       Stick -1
//     endif
//   endif
//   if !(XDistLE 100)
//     if Equal Direction OPos && XDistFrontEdge > shortEdgeRange
//       Stick 1
//     elif !(Equal Direction OPos) && XDistBackEdge < -shortEdgeRange
//       Stick -1
//     endif
//   endif
//   Seek _main
//   Return
// endif

moveVariant = 0
movePart = 0
hit_knockback = -1

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction hex(0x49)
  TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 75 + 75, _afterTCS, _afterTCS)
endif

IS_EARLY_ROLL(var0, var1)

#let moveSelection = var0
if Equal isEarlyRoll 0
  label _afterTCS
  {TECH_CHASE_OPTIONS}  

  moveSelection = 0
  SAFE_INJECT_0 moveSelection
  // because we don't want to set the moveSelection again if we revisit
  // this, we place a label here to jump to
  label callers
  if moveSelection >= 1
    if moveSelection < 2
      Call Jab123
    elif moveSelection < 3
      Call FTilt
    elif moveSelection < 4
      Call UTilt
    elif moveSelection < 5
      Call DTilt
    elif moveSelection < 6
      Call FSmash
    elif moveSelection < 7
      Call USmash
    elif moveSelection < 8
      Call DSmash
    elif moveSelection < 9
      Call NSpecial
    elif moveSelection < 10
      Call SSpecial
    elif moveSelection < 11
      Call DSpecial
    elif moveSelection < 12
      Call Grab
    elif moveSelection < 13
      Call NAir
    elif moveSelection < 14
      Call FAir
    elif moveSelection < 15
      Call BAir
    elif moveSelection < 16
      Call UAir
    elif moveSelection < 17
      Call DAir
    elif moveSelection < 18
      Call NSpecialAir
    elif moveSelection < 19
      Call SSpecialAir
    elif moveSelection < 20
      Call USpecialAir
    elif moveSelection < 21
      Call DSpecialAir
    endif
  elif YDistBackEdge > -40
    if OCurrAction >= hex(0x55) && OCurrAction <= hex(0x5D)
      Call FSmash
    endif

    RetrieveATKD var0 OCurrSubaction 1
    #let oDangerStart = var0
    #let oDangerEnd = var1
    #let oDangerXMin = var2
    #let oDangerXMax = var3
    #let oDangerYMin = var4
    #let oDangerYMax = var5

    #let injected = var7
    injected = hex(0xFF)
    SAFE_INJECT_1 injected

    if LevelValue >= LV6 && Equal waitTeamFlag 0 && Equal injected 0 && !(SamePlane) && TopNY < OTopNY && Equal OAirGroundState 1
      {O_ON_PLAT_ABOVE}
    endif 

    if LevelValue >= LV7 && Equal waitTeamFlag 0 && injected <= 1
      if oDangerEnd < OAnimFrame || Equal OCurrAction hex(0x25)
        if OAttacking && Rnd < 0.8 && !(Equal lastScript hex(0x8008)) && !(Equal ODirection OPos)
          movePart = 1
          Call FakeOutHub
        endif
      elif OAttacking && oDangerEnd > OAnimFrame && !(Equal oDangerStart -1) && Rnd < 0.5 && Equal AirGroundState 1 && LevelValue >= LV8 && !(Equal OCurrAction hex(0x1B))
        {WHIFF_PUNISH_OPTIONS}
      elif Rnd < 0.05 && !(Equal lastScript hex(0x8008))
        Call FakeOutHub
      elif Equal injected 1
        Call FakeOutHub
      endif
    endif

    lastScript = -1

    #let defenseMul = var3
    defenseMul = Damage - ODamage
    defenseMul /= 200

    if LevelValue >= LV5 && Equal waitTeamFlag 0 && injected <= 2
      #let tempVar = var0
      #let tempVar2 = var1
      #let defenseChance = var2

      defenseChance = defenseMul * 0.2

      tempVar = TopNX
      tempVar2 = OTopNX
      Abs tempVar
      Abs tempVar2
      if XDistLE 40 && Rnd < 0.15 && Equal AirGroundState 1 && tempVar2 < tempVar
        if Rnd < defenseChance || Rnd < 0.1
          approachType = at_defend
        endif
        Call NeutralHub
      elif Equal injected 2
        Call NeutralHub
      endif
    endif

    if LevelValue >= LV7 && Equal waitTeamFlag 0 && injected <= 2
      #let fakeChance = var2
      fakeChance = defenseMul * 0.1
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

    if LevelValue >= LV3
      {MAIN_OPTIONS}
      moveSelection = Rnd * 5 + 12
      Seek callers
      Jump
    else
      moveSelection = Rnd * 17
      Seek callers
    endif
  elif True
    {HIGHUP_OPTIONS}
  endif
endif
Return
Return