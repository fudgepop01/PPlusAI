#include <Definition_AIMain.h>
id 0x8208
unk 0x0

XReciever
if Equal IsOnPassableGround 0
  Call MainHub
endif
label setup
var0 = 0
label
if CurrAction >= 1 && CurrAction <= 3
  Goto AGSCheck
  Stick 1
  if var0 < 3
    var0 += 1
    Return
  endif
  var0 = 13
  Seek drop
  Return
endif
label begin
XGoto PerFrameChecks
XReciever
Seek begin
Goto AGSCheck
if var0 > 3
  Button R
endif
var22 = var0 * 0.125
Stick var22
if var0 >= 10
  Seek drop
  Return
endif
var0 += 1
Return
label drop
XGoto PerFrameChecks
XReciever
Seek drop
Goto AGSCheck
Button R
Stick 1
if var0 >= 15
  var22 = var0 - 15
  var22 *= -0.125
  LOGSTR 1685221120 1886415104 1852243968 0 0
  LOGVAL var22
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
