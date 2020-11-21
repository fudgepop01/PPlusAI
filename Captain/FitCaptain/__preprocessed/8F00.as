// TOMHAWK JUMP
// handles tomhawk jump
#include <Definition_AIMain.h>
id 0x8F00

unk 0x0

var21 = 36608

  GetNearestCliffR var0
  var1 = XSpeed * 4
  var1 += TopNX
  if Equal IsOnStage 1 && var0 < 0
    var0 += var1
    if var0 >= 0
      var0 = 1
    endif
  elif Equal IsOnStage 1 && var0 > 0
    var0 += var1
    if var0 <= 0
      var0 = -1
    endif
  endif
  if !(Equal var0 1) || !(Equal var0 -1)
    if Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

if !(Equal var0 0)
  Goto executed
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
  var0 = OTopNX - TopNX
  var0 /= 20
  AbsStick var0
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
  Goto executed
endif
Return

label executed
label

// if Equal var21 32769
  Call ApproachHub
// endif
Return
Return
