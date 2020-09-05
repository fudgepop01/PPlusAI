id 0x59

unk 0x0

if Equal YDistFloor -1
  Call AIHub
endif


if Equal YDistFloor -1
  Call AIHub
endif

if Equal var18 1 && YSpeed <= 0 && Equal IsFastfalling 0 && !(Equal YDistFloor -1)
  Stick 0 (-1)
elif Equal var19 1
  var0 = OPos
elif Equal var19 2
  var0 = (ExactOXCoord - ExactXCoord) / 10
else
  var0 = 0
endif
AbsStick var0

if YSpeed < 0 && YDistFloor < 25 && Equal CurrAction 51 && Equal FramesHitlag 0 && AnimFrame < var14 && FramesSinceShield > 40
  Button R
endif
if Equal AirGroundState 1
  Call AIHub
endif
Return
Return
