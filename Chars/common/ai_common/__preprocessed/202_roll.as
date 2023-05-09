#include <Definition_AIMain.h>
id 0x8202
unk 0x0

//= XReciever
if !(Equal AirGroundState 1)
  CallI MainHub
endif
XGoto PerFrameChecks
//= XReciever
Button R
if Equal var16 1
  AbsStick OPos
elif Equal var16 2
  var22 = OPos * -1
  AbsStick var22
elif Equal var16 3
  var22 = TopNX * -1
  AbsStick var22
endif
Call Shield
Return
Return
