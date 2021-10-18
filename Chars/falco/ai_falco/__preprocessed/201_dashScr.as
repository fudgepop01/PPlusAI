#include <Definition_AIMain.h>
id 0x8201
unk 0x0

XReciever
label setup

var0 = 10 - 2
var0 = Rnd * var0 + 2
var1 = 1
if Equal var16 2
  var0 += 3
  if var0 >= 10
    var0 = 10
  endif
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
elif Equal var16 3
  var22 = TopNX * -1
  AbsStick var22
  if XDistFrontEdge < 4
    Call MainHub
  endif
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
