#include <Definition_AIMain.h>
id 0x8206
unk 0x0

XReciever
label setup
#let timer = var0
timer = Rnd * 40 + 15
if OutOfStage
  timer = 20
endif
label execution

XGoto PerFrameChecks
XReciever
Seek execution

if Equal scriptVariant sv_aerialdrift_towards
  AbsStick OPos
elif Equal scriptVariant sv_aerialdrift_away
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
endif

if timer <= 0 || !(Equal AirGroundState 2)
  Call MainHub
endif
timer -= 1
Return
Return