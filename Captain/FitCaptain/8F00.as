// TOMHAWK JUMP
// handles tomhawk jump
#include <Definition_AIMain.h>
id 0x8F00

unk 0x0

lastScript = hex(0x8F00)
#let tempVar = var0

GOING_OFFSTAGE(var0, var1, 4)

if !(Equal tempVar 0)
  Seek executed
  Jump
else
  Button X
  Seek jsquat
endif
Return

label jsquat
if InAir
  Seek jumped
endif
if OXSpeed < -0.5
  AbsStick -0.4
elif OXSpeed > 0.5
  AbsStick 0.4
else
  tempVar = OTopNX - TopNX
  tempVar /= 20
  AbsStick tempVar
endif
Return

label jumped
if Equal IsOnStage 0
  Call AIHub
endif
if YSpeed <= 0
  Stick 0 (-1)
endif
if Equal AirGroundState 1
  Seek executed
  Jump
endif
Return

label executed

// if Equal lastScript hex(0x8001)
  Call ApproachHub
// endif
Return
Return