#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup
#let timer = var0
#let startOPos = var1

timer = dashForceTurnFrame - dashDanceMinFrames
timer = Rnd * timer + dashDanceMinFrames
startOPos = 1
if Equal scriptVariant sv_dash_away
  timer += 3
  if timer >= dashForceTurnFrame
    timer = dashForceTurnFrame
  endif
endif
label execution
XGoto PerFrameChecks
XReciever
Seek execution

if Equal scriptVariant sv_dash_towards
  AbsStick OPos
elif Equal scriptVariant sv_dash_away
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
elif Equal scriptVariant sv_dash_toCenter
  immediateTempVar = TopNX * -1
  AbsStick immediateTempVar
  if XDistFrontEdge < 4
    Call MainHub
  endif
elif Equal scriptVariant sv_dash_through
  AbsStick OPos
  if !(Equal startOPos OPos)
    Call MainHub
  endif
  Return
endif
timer -= 1
if timer <= 0
  Call MainHub
endif
Return
Return