// NEUTRAL HUB
// controls pathing when in "neutral"
#include <Definition_AIMain.h>
id 0x8006

unk 0x0

Cmd30
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
    elif Rnd < 0.2
      Button X
      AbsStick OPos
    elif Rnd < 0.6
      Call FakeOutHub
    else
      var0 = 20 + Rnd * 30
      label
      Button R
      var0 -= 1
      var17 = OPos * 0.5
      var22 = OTopNY - TopNY
      var22 *= 0.5
      AbsStick var17 var22

      if var17 < 0 || Equal CurrAction 29 || !(XDistLE 40)
        Call OOSHub
      endif
      Return
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
