// FAKE OUT HUB
// controls how the AI decides to fake out the opponent
#include <Definition_AIMain.h>
id 0x8008

unk 0x0

Cmd30

#let tempVar = var0

if Equal XDistFrontEdge XDistBackEdge && !(Equal AirGroundState 1)
  Call RecoveryHub
endif

if YDistBackEdge < -25 && YDistBackEdge > 1
  Call AIHub
endif

LOGSTR str("lscript")
LOGVAL lastScript
if Equal lastScript hex(0x2050) && Rnd < 0.50 && ODistLE 45 && Equal OAirGroundState 1 && SamePlane 
  LOGSTR str("EXEC SPOTDODGE??")
  Button R
  Stick 0 (-1)
  Call AIHub
endif

// sets up offsets to get to target position
if Equal movePart 0 && !(XDistLE 15) && !(Equal lastScript hex(0x2050))
  #let oDanger = var0
  predictAverage oDanger man_oXHitDist LevelValue

  lastScript = hex(0x8008)
  lastAttack = -1
  move_xOffset = 0
  move_xRange = 15 + oDanger
  Abs move_xRange
  move_yOffset = 0
  move_yRange = 50
  move_hitFrame = Rnd * 3

  predictAverage immediateTempVar man_oXHitDist LevelValue
  immediateTempVar += 15
  predictOOption globTempVar man_approach LevelValue
  predictionConfidence anotherTempVar man_approach LevelValue
  anotherTempVar *= 3.5

  approachType = at_fakeout
  if Rnd <= 0.3 && Equal globTempVar op_attack
    Seek
    Jump
  elif Rnd < 0.05
    Seek
    Jump
  elif OCurrActionFreq >= 3 && !(Equal CurrAction hex(0x0))
    Seek
    Jump
  endif
  if OCurrAction <= hex(0x17) && Rnd < anotherTempVar && Equal globTempVar op_attack
    label
    move_xRange = immediateTempVar * 2
    move_xOffset = 0
    move_hitFrame = Rnd * 3
    if Rnd < 0.7
      lastAttack = valJumpOver
      move_xOffset += 35
    else
      lastAttack = valOffensiveShield
    endif
    Call ApproachHub
  endif

  Call ApproachHub
elif Equal AirGroundState 2
  tempVar = OPos * -1
  globTempVar = TopNY - OTopNY
  if YDistBackEdge < -3 && globTempVar < 25 && YSpeed < -0.3
    Button X
    AbsStick tempVar
    Call AIHub
  // elif XDistFrontEdge > shortEdgeRange && XDistBackEdge < -shortEdgeRange && Equal IsOnStage 1
  //   AbsStick tempVar (-1)
  //   Button R
  //   Call AIHub
  endif
  Call AIHub
elif True
  label
  Cmd30
  if Equal lastScript hex(0x2070) && Rnd < 0.70 && ODistLE 45 && Equal OAirGroundState 1 && SamePlane
    Button R
    Stick 0 (-1)
    Call AIHub
  elif Equal lastScript hex(0x2050) && Rnd < 0.50 && ODistLE 45 && Equal OAirGroundState 1 && SamePlane 
    Button R
    Stick 0 (-1)
    Call AIHub
  elif Equal lastAttack valOffensiveShield 
    Seek offensiveShield
    Jump
  elif Equal lastAttack valJumpOver
    Seek jumpOver
    Jump
  endif
  lastAttack = -1

  if FramesHitstun > 0 && Equal AirGroundState 1 && NumFrames < 4
    Return
  endif

  lastScript = hex(0x8008)
  if !(Equal Direction OPos) && !(Equal CurrAction hex(0x06))
    tempVar = OPos
    AbsStick tempVar
    Return
  endif
  if Equal OCurrAction hex(0x25)
    Seek jumpOver
  endif
  predictAverage immediateTempVar man_oXHitDist LevelValue
  predictAverage globTempVar man_oXAttackDist LevelValue
  if XDistLE globTempVar immediateTempVar && OAttacking
    Seek offensiveShield
  endif

  tempVar = Rnd
  if tempVar <= 0.1
    Seek jumpOver
  elif tempVar <= 0.25 && Damage < 60 && !(Equal OCurrAction hex(0x34))
    Seek crouchCancelPunish
  elif tempVar <= 0.60 && Equal CurrAction hex(0x03)
    Seek dashAway
  elif tempVar <= 0.70
    Seek wavedashBack
  {ADDITIONAL_FAKEOUTS}
  else
    Seek offensiveShield
  endif
  Jump
endif
Return

{ADDITIONAL_FAKEOUTS_ROUTINES}

label crouchCancelPunish
  Cmd30
Goto checkHitstun
#let timer = var0
timer = Rnd * 20
label
Stick 0 (-1)
if FramesHitstun > 0 || timer <= 0
  lastScript = hex(0x8008)
  Call AIHub
endif
timer -= 1
Return

label dashAway
  Cmd30
Goto checkHitstun
#let timer = var0
if Equal Direction OPos
  Stick (-1) 0
endif
Seek
Return
label
if !(XDistLE 20) || XDistFrontEdge < 35
  Call AIHub
endif
Stick 1
Return

label wavedashBack
  Cmd30
Goto checkHitstun
if CurrAction > hex(0x09)
  Return
endif
Button X
label
if InAir
  globTempVar = OPos * -1
  Stick globTempVar (-1)
  Button R
  lastScript = hex(0x8008)
  Call AIHub
endif
Return

label offensiveShield
lastAttack = -1
Cmd30
Goto checkHitstun
#let timer = var1
#let shieldRemaining = var2
timer = Rnd * 50 + 10
globTempVar = move_xOffset + move_xRange
if XDistLE globTempVar || XDistLE 15
  Seek
  Jump
else
  AbsStick OPos
  if Equal CurrAction hex(0x1)
    ClearStick 
  endif
endif
Return
label
Cmd30
Goto checkHitstun
tempVar = OPos * 0.5
AbsStick tempVar
Button R
GetShieldRemain shieldRemaining
if shieldRemaining < 10 || timer <= 0 || Equal CurrAction hex(0x1D)
  Call OOSHub
endif
timer -= 1
Return

label jumpOver
Cmd30
Goto checkHitstun
if CurrAction >= hex(0x9)
  Return
endif
label
Cmd30
Goto checkHitstun
AbsStick OPos
Button X
if InAir
  Call AIHub
endif
Return
label checkHitstun
HITSTUN_CHECK

Return
Return