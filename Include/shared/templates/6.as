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
  globTempVar = OPos * -1
  if Equal AirGroundState 1
    if Equal approachType at_defend
      Button R
      AbsStick globTempVar
    elif XDistFrontEdge > edgeRange
      AbsStick globTempVar
    elif Rnd < 0.2
      Button X
      AbsStick OPos
    elif Rnd < 0.6
      Call FakeOutHub
    else
      #let timer = var0
      timer = 20 + Rnd * 30
      label
      Button R
      timer -= 1
      globTempVar = OPos * 0.5
      immediateTempVar = OTopNY - TopNY
      immediateTempVar *= 0.5
      AbsStick globTempVar immediateTempVar

      if globTempVar < 0 || Equal CurrAction hex(0x1D) || !(XDistLE 40)
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

if Equal CurrAction hex(0x01)
  ClearStick
endif
Return
Return