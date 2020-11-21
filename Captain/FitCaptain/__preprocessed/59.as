id 0x59

unk 0x0

if Equal IsOnStage 0
  Call AIHub
endif


if Equal IsOnStage 0
  Call AIHub
endif

if Equal var18 1 && YSpeed <= 0 && Equal IsFastfalling 0 && Equal IsOnStage 1
  Stick 0 (-1)
elif Equal var19 1
  var0 = OPos
elif Equal var19 2
  var0 = (ExactOXCoord - ExactXCoord) / 10
else
  var0 = 0
endif
AbsStick var0

if YSpeed < 0 && YDistBackEdge > -5 && Equal CurrAction 51 && AnimFrame < var14 && FramesSinceShield > 7 && LevelValue >= 60
  Button R
endif
if Equal AirGroundState 1
  var18 = 0
  Call AIHub
endif
Return
Return
