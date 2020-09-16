id 0x59

unk 0x0

if Equal YDistFloor -1
  Call AIHub
endif

#let moveMode = var19
#let shouldFastFall = var18

if Equal YDistFloor -1
  Call AIHub
endif

if Equal shouldFastFall 1 && YSpeed <= 0 && Equal IsFastfalling 0 && !(Equal YDistFloor -1)
  Stick 0 (-1)
elif Equal moveMode 1
  var0 = OPos
elif Equal moveMode 2
  var0 = (ExactOXCoord - ExactXCoord) / 10
else
  var0 = 0
endif
AbsStick var0

if YSpeed < 0 && YDistFloor < 5 && Equal CurrAction hex(0x33) && AnimFrame < move_IASA && FramesSinceShield > 7 && LevelValue >= LV7
  Button R
endif
if Equal AirGroundState 1
  Call AIHub
endif
Return
Return