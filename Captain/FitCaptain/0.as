// var21 is the previous routine (set manually)
// var20 is the previous attack routine (set manually)

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000

//Set Unknown
unk 0x00000

label begin

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
  MeteorCancelWindow = Rnd * 5 + 10
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
    if Equal AirGroundState 1
      Stick -1
    endif
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
GOING_OFFSTAGE(var0, var1, 15)

// where RecoveryHub (4.as) is called
if Equal isGoingOffstage 2 && Equal AirGroundState 2
  movePart = 0
  Call RecoveryHub
endif

if Equal isGoingOffstage 0 && YDistBackEdge > -15 && Equal CurrAction hex(0x33) && LevelValue >= LV7
  Call Landing
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

moveVariant = 0
movePart = 0
move_knockback = -1

IS_EARLY_ROLL(var0, var1)

#let moveSelection = var0
if Equal isEarlyRoll 0
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

    #let injected = var2
    SAFE_INJECT_1 injected

    if LevelValue >= LV7 && Equal waitTeamFlag 0
      if oDangerEnd < OAnimFrame || Equal OCurrAction hex(0x25)
        if OAttacking && Rnd < 0.8 && !(Equal lastScript hex(0x8008)) && !(Equal ODirection OPos)
          movePart = 1
          Call FakeOutHub
        endif
      elif OAttacking && oDangerEnd > OAnimFrame && !(Equal oDangerStart -1) && Rnd < 0.5 && Equal AirGroundState 1 && LevelValue >= LV8 && !(Equal OCurrAction hex(0x1B))
        Call SSpecial
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

    if LevelValue >= LV5 && Equal waitTeamFlag 0
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

    if Equal waitTeamFlag 0
      #let defenseChance = var2
      defenseChance = defenseMul * 0.1
      if Rnd < defenseMul || Rnd < 0.05 || Equal injected 3
        approachType = at_defend
        if OYDistBackEdge < -20
          Call UAir
        endif
        if Rnd < 0.8 && !(Equal Direction OPos)
          Call BAir
        else
          moveVariant = mv_nairHit2
          Call NAir
        endif
      endif
    endif
    approachType = at_attack

    // if the opponent is lying there doing nothing
    if LevelValue >= LV6 && Equal waitTeamFlag 0
      if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D)
        if Equal AirGroundState 1 && Rnd < 0.5
          Call DTilt
        else
          Call DAir
        endif
      endif
    endif

    if LevelValue >= LV5 && Equal OAirGroundState 3
      Call EdgeguardHub
    endif

    // these parts are effectively falcon's whole entire neutral game.
    if !(XDistLE 20) && LevelValue >= LV7 && Rnd < 0.7
      // LOGSTR str("throwOut")
      moveVariant = mv_throwOut
      Call NAir
    endif

    if Equal OCurrAction hex(0x25) && !(Equal ODirection Direction)
      Seek callers
      Jump
    endif

    if LevelValue >= LV3
      if OYDistBackEdge > -15
        moveSelection = Rnd * 160
        // LOGSTR str("moveSel")
        // LOGVAL moveSelection
        // these moves are pretty much always relevant
        if moveSelection >= 100
          if moveSelection < 105
            Call FAir
          elif moveSelection < 115
            Call DAir
          elif moveSelection < 135
            if Rnd < 0.5
              moveVariant = mv_approachingNair
            endif
            Call NAir
          elif moveSelection < 150
            Call Grab
          else
            moveSelection = Rnd * 11 + 2
            Seek callers
            Jump
          endif
        else
          #let ODmgXWeight = var2

          GET_WEIGHT_TABLE(ODmgXWeight, var1)

          ODmgXWeight /= 100
          ODmgXWeight *= ODamage

          if ODmgXWeight >= 90
            // LOGSTR str(">= 90")
            if moveSelection < 20
              Call Grab
            elif moveSelection < 60
              Call FAir
            elif moveSelection < 65
              Call Jab123
            elif moveSelection < 80
              Call FSmash
            elif moveSelection < 95
              Call USmash
            else
              Call DAir
            endif
          elif ODmgXWeight >= 50
            // LOGSTR str(">= 50")
            if moveSelection < 30
              Call Grab
            elif moveSelection < 60
              Call NAir
            elif moveSelection < 80
              Call DAir
            else
              Call FTilt
            endif
          elif True
            if moveSelection < 30
              Call Grab
            elif moveSelection < 80
              moveVariant = mv_nairHit2
              if Rnd < 0.5
                moveVariant = mv_approachingNair
              endif
              Call NAir
            else
              Call DAir
            endif
          endif
          // LOGSTR str("none")
        endif
      endif
      if OYDistBackEdge < -20
        if Rnd < 0.5 && ODamage > 50
          Call FAir
        else
          Call UAir
        endif
      endif
      // if we're here, then the opponent is in the air at which point
      // we just perform a random aerial for the sake of having some variety lol
      // LOGSTR str("randAerial")
      moveSelection = Rnd * 5 + 12
      Seek callers
      Jump
    else
      moveSelection = Rnd * 17
      Seek callers
    endif
  elif True
    if Rnd < 0.4
      Call DAir
    elif Rnd < 0.2
      Call UAir
    elif Rnd < 0.3
      Call FAir
    else
      Call NAir
    endif
  endif
endif
Return
Return