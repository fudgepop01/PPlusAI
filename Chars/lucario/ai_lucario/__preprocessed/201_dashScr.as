#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup

var0 = 10 - 3
var0 = Rnd * var0 + 3
var1 = 1
label execution
XGoto PerFrameChecks
XReciever
Seek execution

if Equal var16 1
  AbsStick OPos
elif Equal var16 2
  var22 = OPos * -1
  AbsStick var22
elif Equal var16 3
  var22 = TopNX * -1
  AbsStick var22
elif Equal var16 4
  AbsStick OPos
  if !(Equal var1 OPos)
    Call MainHub
  endif
  Return
endif
var0 -= 1
if var0 <= 0
  Call MainHub
endif
Return
Return
