#include <Definition_AIMain.h>
id 0x8203
unk 0x0

XReciever
label setup
var0 = OPos
label
Button X
Seek
if Equal AirGroundState 2
  Jump
endif
Return
label
XGoto PerFrameChecks
XReciever

if Equal CurrSubaction JumpSquat
  Button X
endif
if Equal var16 1
  AbsStick OPos
  if !(Equal var0 OPos) || YSpeed < 0
    CallI MainHub
  endif
elif Equal var16 2
  if Equal AirGroundState 2
    CallI MainHub
  endif
elif Equal var16 3
  var22 = OPos * -1
  AbsStick var22
  if YSpeed < 0.6
    CallI MainHub
  endif
else
  CallI MainHub
endif
Return
Return
