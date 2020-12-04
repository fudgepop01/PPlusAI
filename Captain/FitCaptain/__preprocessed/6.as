// NEUTRAL HUB
// controls pathing when in "neutral"
#include <Definition_AIMain.h>
id 0x8006

unk 0x0

var0 = Rnd * 60 + 20

label
if InAir && Equal IsOnStage 1
  Stick 0 (-1)
  Button R
  Call AIHub
endif

if !(XDistLE 40) || Equal IsOnStage 0
  if Equal var21 2
    Button R
  endif
  Call AIHub
endif

if Equal CurrAction 1
  ClearStick
elif !(Equal Direction OPos) && XDistFrontEdge > 20
  Stick 1
elif XDistBackEdge < -20
  Stick -1
elif CurrAction <= 9
  Button X
endif

Return
Return
