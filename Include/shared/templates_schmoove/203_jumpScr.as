#include <Definition_AIMain.h>
id 0x8203
unk 0x0

XReciever
label setup
#let savedOPos = var0
savedOPos = OPos
#let shouldFullHop = var1
OR globTempVar scriptVariant scriptVariant
shouldFullHop = scriptVariant - globTempVar
if Equal shouldFullHop svp_jump_fullhop
  shouldFullHop = 1
else
  shouldFullHop = 0
endif
label jumpCommand
Button X
label locomotion
XGoto PerFrameChecks
XReciever
if Equal shouldFullHop 1 && Equal AirGroundState 1
  Seek jumpCommand
else
  Seek locomotion
endif

if Equal CurrSubaction JumpSquat
  Button X
endif
if Equal scriptVariant sv_jump_over
  AbsStick OPos
  if !(Equal savedOPos OPos) || YSpeed < 0
    CallI MainHub
  endif
elif Equal scriptVariant sv_jump_neutral
  if Equal AirGroundState 2
    CallI MainHub
  endif
elif Equal scriptVariant sv_jump_away
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
  if YSpeed < 0.6
    CallI MainHub
  endif
else
  CallI MainHub
endif
Return
Return