// FAKE OUT HUB
// controls how the AI decides to fake out the opponent
#include <Definition_AIMain.h>
id 0x8008

unk 0x0

#let tempVar = var0

// sets up offsets to get to target position
if Equal movePart 0
  lastAttack = hex(0x8008)
  move_xOffset = 0
  move_yOffset = 0
  move_xRange = 20
  move_yRange = 50
  move_hitFrame = Rnd * 20 + 5
  Call ApproachHub
elif Equal AirGroundState 2
  LOGSTR str("xPos")
  LOGVAL TopNX
  LOGSTR str("XdistBackEdge")
  LOGVAL XDistBackEdge
  tempVar = OPos * -1
  if YDistFloor > 15
    Button X
    AbsStick tempVar
    Call AIHub
  elif XDistBackEdge > -10
    AbsStick tempVar (-1)
    Button R
    Call AIHub
  endif
  Call AIHub
else
  tempVar = Rnd
  if tempVar < 0.5 && Damage < 25 && !(Equal OCurrAction hex(0x34))
    Seek crouchCancelPunish
  elif tempVar < 0.3 && Equal CurrAction hex(0x03)
    Seek dashAway
  elif tempVar < 0.4
    Seek wavedashBack
  else
    Seek offensiveShield
  endif
endif
Return

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
Stick (-1) 0
Seek
label
if !(XDistLE 30) || XDistFrontEdge < 25
  Call AIHub
endif
Stick 1
Return

label wavedashBack
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
Return