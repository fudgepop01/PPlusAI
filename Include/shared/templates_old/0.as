#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000
unk 0x0

label begin

SetAutoDefend 0
SetDisabledMd -1

if !(Equal TrainingScript hex(0xFFFF))
  noCombo = 1
endif

{PRE_HOOKS}

// if CurrAction >= hex(0x42) && CurrAction <= hex(0x44) || Equal CurrAction hex(0x45) && YDistBackEdge < -7 && !(OutOfStage)
//   CallI OnGotDamaged
// endif

// if Equal globTempVar strv("BAD")
//   CallI OnGotDamaged
// endif

if Equal movePart mp_ATK || Equal movePart hex(0xFF)
  movePart = 0
endif

if Equal CurrAction hex(0x114) || Equal CurrAction hex(0x10)
  CallI RecoveryHub
endif

if LevelValue <= LV6
  if Rnd < 0.2
    Return
  endif
endif

if CurrAction >= hex(0x1A) && CurrAction <= hex(0x1D)
  CallI OOSHub
endif

if Equal approachType at_reroll
  Seek _reroll
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

if FramesHitstun > 1 || Equal CurrAction hex(0x42)
  // if Equal CurrSubaction ThrownLw && AnimFrame >= 15 && Rnd < 0.5
  //   Button R
  // endif 
  CallI OnGotDamaged
endif

#let inDisadvantage = var7
inDisadvantage = 0
if CurrAction >= hex(0x43) && CurrAction <= hex(0x45) && LevelValue >= LV8
  inDisadvantage = 1
endif

Seek _main
Jump
Return

// the stuff here happens when not in hitstun.
label _main
#let waitTeamFlag = var6
#let tempVar = var4
waitTeamFlag = 0

// for efficiency, we just use a label here so we don't need to CallI the
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
  CallI RecoveryHub
endif

if Equal isGoingOffstage 0 && YDistBackEdge > -15 && Equal CurrAction hex(0x33) && LevelValue >= LV7
  {L_CANCEL}
endif

if MeteoChance && !(Equal isGoingOffstage 2)
  movePart = 0
  CallI EdgeguardHub
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
if !(Equal noCombo noComboVal)
  if Equal HitboxConnected 1 && LevelValue >= LV5
    // if Equal CurrAction hex(0x18)
    //   Seek _main
    //   Return
    // endif
    CallI ComboHub
  elif OFramesHitstun > 0 && LevelValue >= LV5
    CallI ComboHub
  elif OCurrAction >= hex(0x42) && OCurrAction <= hex(0x52) && LevelValue >= LV7
    CallI ComboHub
  endif
endif

ClearStick
if Equal CurrAction hex(0x04) || Equal CurrAction hex(0x03)
  Stick 1
endif
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

if Equal TrainingScript hex(0x8201)
  CallI 0x8201
elif Equal TrainingScript hex(0x8301)
  CallI 0x8301
endif

{TRAINING_OPTIONS}

if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction hex(0x49) || OCurrAction >= hex(0x4D) && OCurrAction <= hex(0x5F)
  TECHCHASE_SITUATION(var0, var1, var2, var3, var4, var5, Rnd * 100 + 15, _afterTCS, _afterTCS)
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
      CallI Jab123
    elif moveSelection < 3
      CallI DashAttack
    elif moveSelection < 4
      CallI FTilt
    elif moveSelection < 5
      CallI UTilt
    elif moveSelection < 6
      CallI DTilt
    elif moveSelection < 7
      CallI FSmash
    elif moveSelection < 8
      CallI USmash
    elif moveSelection < 9
      CallI DSmash
    elif moveSelection < 10
      CallI NSpecial
    elif moveSelection < 11
      CallI USpecial
    elif moveSelection < 12
      CallI SSpecial
    elif moveSelection < 13
      CallI DSpecial
    elif moveSelection < 14
      CallI Grab
    elif moveSelection < 15
      CallI NAir
    elif moveSelection < 16
      CallI FAir
    elif moveSelection < 17
      CallI BAir
    elif moveSelection < 18
      CallI UAir
    elif moveSelection < 19
      CallI DAir
    elif moveSelection < 20
      CallI NSpecialAir
    elif moveSelection < 21
      CallI SSpecialAir
    elif moveSelection < 22
      CallI USpecialAir
    elif moveSelection < 23
      CallI DSpecialAir
    endif
  elif YDistBackEdge > -40
    if !(XDistLE 70)
      Seek attack_approaches
      Jump
    endif

    #let nearCliffX = var0
    #let nearCliffY = var1
    NEAREST_CLIFF(nearCliffX, nearCliffY)
    Abs nearCliffX

    #let absPos = var1
    #let absOPos = var2
    absPos = TopNX
    Abs absPos
    absOPos = OTopNX
    Abs absOPos
    if nearCliffX < edgeRange && XDistLE 40 && absOPos < absPos && Equal OFramesHitstun 0 && !(Equal lastScript hex(0x8009)) && LevelValue >= LV6 && SamePlane && !(XDistLE 20)
      CallI EdgeEscapeHub
    endif

    if OCurrAction >= hex(0x1A) && OCurrAction <= hex(0x1C) && Rnd < 0.7 && XDistLE 25
      CallI Grab
    endif

    if OCurrAction >= hex(0x55) && OCurrAction <= hex(0x5D)
      {PUNISH_BROKEN_SHIELD}
    endif

    // if the opponent is lying there doing nothing
    if LevelValue >= LV6 && Equal waitTeamFlag 0
      if Equal OCurrAction hex(0x4A) || Equal OCurrAction hex(0x4D)
        {PUNISH_KNOCKDOWN_OPTIONS}
      endif
    endif

    if LevelValue >= LV5 && Equal OAirGroundState 3
      CallI EdgeguardHub
    endif

    #let oIASA = var0
    #let oDangerStart = var1
    #let oDangerEnd = var2
    #let oDangerXMin = var23
    #let oDangerXMax = var23
    #let oDangerYMin = var23
    #let oDangerYMax = var23
    RetrieveFullATKD oIASA oDangerStart oDangerEnd oDangerXMin oDangerXMax oDangerYMin oDangerYMax OCurrSubaction 1
    if Equal oIASA 0
      oIASA = OEndFrame
    endif

    #let injected = var7
    injected = 0
    SAFE_INJECT_1 injected
    if LevelValue >= LV6 && Equal waitTeamFlag 0 && Equal injected 0 && !(SamePlane) && TopNY < OTopNY && Equal OAirGroundState 1
      {O_ON_PLAT_ABOVE}
    endif 

    #let OCurrEndlag = var4
    OCurrEndlag = oIASA - OAnimFrame 
    if Equal OCurrAction hex(0x33)
      globTempVar = OTopNY + OYDistBackEdge
      EstOPassTimeY globTempVar globTempVar
      globTempVar += 3
      if globTempVar < OCurrEndlag
        OCurrEndlag = globTempVar
      endif
    endif
    OCurrEndlag -= 5

    OCurrEndlag += oDangerStart
    if LevelValue >= LV7 && Equal waitTeamFlag 0 && injected <= 1
      if Equal injected 1
        CallI FakeOutHub
      elif OAttacking && oDangerStart < OAnimFrame && OCurrEndlag >= 12 && !(Equal oDangerStart -1) && LevelValue >= LV8 && !(Equal OCurrAction hex(0x1B)) && XDistLE 40 && OCurrActionFreq >= 3
        {WHIFF_PUNISH_OPTIONS}
      elif oDangerEnd < OAnimFrame || Equal OCurrAction hex(0x25) || OCurrEndlag < 12
        if OAttacking && Rnd < 0.8 && !(Equal lastScript hex(0x8008)) && XDistLE oDangerXMax && !(Equal lastScript hex(0x8007))
          movePart = 1
          CallI FakeOutHub
        endif
      elif OAttacking && OCurrActionFreq >= 3 && !(Equal lastScript hex(0x8007))
        CallI FakeOutHub
      elif Rnd < 0.1 && !(Equal lastScript hex(0x8008)) && !(Equal lastScript hex(0x8007))
        CallI FakeOutHub
      endif
    endif

    #let defenseMul = var3
    defenseMul = 200 - (ODamage - Damage) * 4
    defenseMul *= 0.01

    predictOOption globTempVar man_dashdance LevelValue
    predictionConfidence immediateTempVar man_dashdance LevelValue
    if Equal globTempVar op_attack
      globTempVar = 0.5 + immediateTempVar * 1.1
      defenseMul *= globTempVar
    endif 

    predictOOption globTempVar man_approach LevelValue
    predictionConfidence immediateTempVar man_approach LevelValue
    if Equal globTempVar op_attack
      globTempVar = 0.5 + immediateTempVar * 1.1
      defenseMul *= globTempVar
    endif 

    Norm immediateTempVar TopNX TopNY
    Norm globTempVar OTopNX OTopNY
    immediateTempVar -= 10

    if LevelValue >= LV7 && Equal waitTeamFlag 0 && injected <= 2
      #let fakeChance = var2
      if immediateTempVar < globTempVar
        fakeChance = defenseMul * 0.23
      else
        fakeChance = defenseMul * 0.10
      endif
      Abs fakeChance
      if fakeChance > 0.7
        fakeChance = 0.7
      endif
      if Rnd < fakeChance
        CallI FakeOutHub
      endif
    endif

  lastScript = hex(0x8000)

    if LevelValue >= LV5 && Equal waitTeamFlag 0 && injected <= 2
      #let tempVar = var0
      #let tempVar2 = var1
      #let defenseChance = var2

      defenseChance = defenseMul * 0.20
      predictAverage immediateTempVar man_oXHitDist LevelValue

      if XDistLE immediateTempVar && Rnd < 0.4 && Equal AirGroundState 1
        if Rnd < defenseChance || Rnd < 0.04
          approachType = at_defend
        endif
        CallI NeutralHub
      elif Equal injected 2
        CallI NeutralHub
      endif
    endif

    if Equal waitTeamFlag 0 && immediateTempVar < globTempVar && injected <= 3
      #let defenseChance = var2
      defenseChance = defenseMul * 0.28
      if defenseChance > 0.8
        defenseChance = 0.8
      endif
      if Rnd < defenseMul || Rnd <= 0.2 || Equal injected 3
        approachType = at_defend
        {DEFENSE_OPTIONS}
      endif
    endif
    label attack_approaches
    approachType = at_attack

    {ADDITIONAL_PREMAIN_OPTIONS}

    if Equal OCurrAction hex(0x25) && !(Equal ODirection Direction)
      Seek callers
      Jump
    endif

    #let ODmgXWeight = var2
    ODmgXWeight = OWeight

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
Goto approachTypes
{COMBO_STARTERS}
Goto approachType_filter
Return

label killMoves
#let ODmgXWeight = var2
Goto approachTypes
{KILL_MOVES}
Goto approachType_filter
Return

label neutralMoves
#let ODmgXWeight = var2
Goto approachTypes
{NEUTRAL_MOVES}
Goto approachType_filter
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
  $output(CallI)
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
  $output(CallI)
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

$generateAllMovesGotoKB()

label callMove
if Equal CurrAction hex(0x18)
  Return
endif

if Equal lastAttack valJab123
  CallI Jab123
elif Equal lastAttack valDashAttack
  CallI DashAttack
elif Equal lastAttack valFTilt
  CallI FTilt
elif Equal lastAttack valUTilt
  CallI UTilt
elif Equal lastAttack valDTilt
  CallI DTilt
elif Equal lastAttack valFSmash
  CallI FSmash
elif Equal lastAttack valUSmash
  CallI USmash
elif Equal lastAttack valDSmash
  CallI DSmash
elif Equal lastAttack valNSpecial
  CallI NSpecial
elif Equal lastAttack valSSpecial
  CallI SSpecial
elif Equal lastAttack valUSpecial
  CallI USpecial
elif Equal lastAttack valDSpecial
  CallI DSpecial
elif Equal lastAttack valGrab
  CallI Grab
elif Equal lastAttack valNAir
  CallI NAir
elif Equal lastAttack valFAir
  CallI FAir
elif Equal lastAttack valBAir
  CallI BAir
elif Equal lastAttack valUAir
  CallI UAir
elif Equal lastAttack valDAir
  CallI DAir
elif Equal lastAttack valNSpecialAir
  CallI NSpecialAir
elif Equal lastAttack valSSpecialAir
  CallI SSpecialAir
elif Equal lastAttack valUSpecialAir
  CallI USpecialAir
elif Equal lastAttack valDSpecialAir
  CallI DSpecialAir
endif

Return

label approachTypes
globTempVar = TopNY - OTopNY
Abs globTempVar
if ODistLE 8 && globTempVar < 20 && Equal AirGroundState 1
  approachType = at_combo
endif
predictOOption globTempVar man_approach LevelValue
predictionConfidence immediateTempVar man_approach LevelValue
if Equal man_approach op_attack && Rnd < immediateTempVar
  approachType = at_undershoot
elif Rnd < 0.2
  approachType = at_undershoot
endif
Norm immediateTempVar TopNX TopNY
Norm globTempVar OTopNX OTopNY
if Rnd < 0.1 && immediateTempVar < globTempVar
  approachType = at_defend
elif Rnd < 0.4 && immediateTempVar < globTempVar
  approachType = at_poke
elif Rnd < 0.1
  approachType = at_poke
endif
if immediateTempVar < globTempVar && Rnd < 0.5
  approachType = at_threaten
endif
immediateTempVar -= globTempVar
Abs immediateTempVar
if immediateTempVar < 30 && Rnd < 0.7 && LevelValue >= LV7 && !(XDistLE 35)
  approachType = at_threaten
endif
Return

label approachType_filter
if lastAttack < valJab123 || lastAttack > valDSpecialAir
  Return
endif
if Equal approachType at_threaten
  if Equal lastAttack valGrab
    approachType = 0
  // elif lastAttack < valNAir && Rnd < 0.4
  // elif lastAttack >= valNAir
  // else
  //   approachType = 0
  endif
elif Equal approachType at_poke && Equal lastAttack valGrab
  approachType = 0
endif
Seek callMove
Jump
Return
Return