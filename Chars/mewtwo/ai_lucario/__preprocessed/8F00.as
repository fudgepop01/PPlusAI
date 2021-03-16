// TOMHAWK JUMP
// handles tomhawk jump
#include <Definition_AIMain.h>
id 0x8F00

unk 0x0

var21 = 36608

  GetNearestCliff var0
  var17 = 4
  var1 = XSpeed * var17
  var1 += TopNX
  if var0 < 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 >= 0
        var0 = 1
      endif
    endif
  elif var0 > 0
    if Equal IsOnStage 1 && !(Equal DistBackEdge DistFrontEdge)
      var0 -= var1
      if var0 <= 0
        var0 = -1
      endif
    endif
  endif
  if !(Equal var0 1) && !(Equal var0 -1)
    if Equal DistBackEdge DistFrontEdge || Equal IsOnStage 0
      var0 = 2
    else
      var0 = 0
    endif
  endif

if !(Equal var0 0)
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
  AbsStick -0.5
elif OXSpeed > 0.5
  AbsStick 0.5
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
  Seek executed
  Jump
endif
Return

label executed

// if Equal var21 32769
  Call ApproachHub
// endif
Return
Return
