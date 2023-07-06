#include <Definition_AIMain.h>
id 0x8202
unk 0x0

XReciever
if !(Equal AirGroundState 1)
  CallI MainHub
endif
XGoto PerFrameChecks
XReciever
Button R
if Equal scriptVariant sv_roll_through
  AbsStick OPos
elif Equal scriptVariant sv_roll_away
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
elif Equal scriptVariant sv_roll_toCenter
  immediateTempVar = TopNX * -1
  AbsStick immediateTempVar
endif
Call Shield
Return
Return