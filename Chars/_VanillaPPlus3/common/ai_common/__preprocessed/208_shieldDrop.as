#include <Definition_AIMain.h>
id 0x8208
unk 0x0

//= XReciever
if Equal IsOnPassableGround 0
  Call MainHub
endif
label setup
var0 = 0
ClearStick
label drop
XGoto PerFrameChecks
//= XReciever
Goto AGSCheck
Seek drop
Button R
if var0 >= 2
  MOD var22 GameTimer 8
  var22 *= -0.125
  // LOGVAL immediateTempVar
  Stick 0 var22
endif
var0 += 1
Return
label AGSCheck
if Equal AirGroundState 2
  Call MainHub
endif
Return
Return
