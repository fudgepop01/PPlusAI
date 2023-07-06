// NEUTRAL HUB
// controls pathing when in "neutral"
#include <Definition_AIMain.h>
id 0x8006

unk 0x0

// if InAir && Equal IsOnStage 1
//   Call AIHub
// endif

if InAir
  Call AIHub
endif

if XDistLE 30
  var17 = OPos * -1
  if Equal AirGroundState 1
    if Equal var16 2
      Button R
      AbsStick var17
    elif XDistFrontEdge > 25
      AbsStick var17
    else
      Button X
      AbsStick OPos
    endif
  endif

  if Rnd < 0.05
    Call AIHub
  endif
else
  Call AIHub
endif

if Equal CurrAction 1
  ClearStick
endif
Return
Return
