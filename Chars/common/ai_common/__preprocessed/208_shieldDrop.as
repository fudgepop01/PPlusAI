#include <Definition_AIMain.h>
id 0x8208
unk 0x0

//= XReciever
if Equal IsOnPassableGround 0
  Call MainHub
endif
label setup
var0 = 0
label drop
XGoto PerFrameChecks
//= XReciever
Goto AGSCheck
Seek drop
Button R
if var0 >= 2
  var22 = var0 - 1
  MOD var22 var22 8
  var22 *= -0.125
  // LOGVAL var22
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
