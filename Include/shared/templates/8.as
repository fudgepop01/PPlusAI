// FAKE OUT HUB
// controls how the AI decides to fake out the opponent
#include <Definition_AIMain.h>
id 0x8008

unk 0x0

#let tempVar = var0

// sets up offsets to get to target position
if Equal movePart 0
  RetrieveATKD var0 OCurrSubaction 1
  #let oDangerStart = var0
  #let oDangerEnd = var1
  #let oDangerXMin = var2
  #let oDangerXMax = var3
  #let oDangerYMin = var4
  #let oDangerYMax = var5

  lastScript = hex(0x8008)
  lastAttack = hex(0x8008)
  move_xOffset = 0
  move_xRange = 25
  if !(Equal oDangerStart -1)
    move_xOffset = oDangerXMax
    move_xRange = 10 + (oDangerXMax - oDangerXMin)
    Abs move_xRange
  endif
  move_yOffset = 0
  move_yRange = 50
  move_hitFrame = Rnd * 20 + 5
  Call ApproachHub
elif Equal AirGroundState 2
  tempVar = OPos * -1
  if YDistBackEdge < -15
    Button X
    AbsStick tempVar
    Call AIHub
  elif XDistFrontEdge > shortEdgeRange
    AbsStick tempVar (-1)
    Button R
    Call AIHub
  endif
  Call AIHub
elif True
  lastScript = hex(0x8008)
  if !(Equal Direction OPos)
    tempVar = OPos * 0.65
    AbsStick tempVar
    Return
  endif
  if Equal OCurrAction hex(0x25) || Equal OCurrAction hex(0x24)
    Seek jumpOver
  endif
  tempVar = Rnd
  if tempVar < 0.5 && Damage < 25 && !(Equal OCurrAction hex(0x34))
    Seek crouchCancelPunish
  elif tempVar < 0.3 && Equal CurrAction hex(0x03)
    Seek dashAway
  elif tempVar < 0.4
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
#let timer = var0
timer = Rnd * 20 + 10
label
Stick 0 (-1)
if FramesHitstun > 0 || timer <= 0
  lastScript = hex(0x8008)
  Call AIHub
endif
timer -= 1
Return

label dashAway
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
if CurrAction > hex(0x09)
  Return
endif
Button X
label
if InAir
  Stick (-1) (-1)
  Button R
  lastScript = hex(0x8008)
  Call AIHub
endif
Return

label offensiveShield
#let timer = var1
#let shieldRemaining = var2
timer = Rnd * 30 + 10
tempVar = OPos * 0.5
Stick OPos
label
Stick tempVar
Button R
GetShieldRemain shieldRemaining
if shieldRemaining < 10 || timer <= 0 || Equal CurrAction hex(0x1D)
  Call OOSHub
endif
timer -= 1
Return

label jumpOver
Button X
if InAir
  Call AIHub
endif
Return
Return