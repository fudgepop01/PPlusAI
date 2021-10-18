#include <Definition_AIMain.h>
id 0x8206
unk 0x0

XReciever
label setup
var0 = Rnd * 40 + 15
if OutOfStage
  var0 = 20
endif
label execution

XGoto PerFrameChecks
XReciever
Seek execution

if Equal var16 1
  AbsStick OPos
elif Equal var16 2
  var22 = OPos * -1
  AbsStick var22
endif

if var0 <= 0 || !(Equal AirGroundState 2)
  Call MainHub
endif
var0 -= 1
Return
Return
