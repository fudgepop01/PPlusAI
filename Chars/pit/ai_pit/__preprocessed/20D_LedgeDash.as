#include <Definition_AIMain.h>
id 0x820D
unk 0x0

//= XReciever
label prep
XGoto PerFrameChecks
//= XReciever
Stick -1
Seek
Return
label start
XGoto PerFrameChecks
//= XReciever
Seek start

var0 = HurtboxSize * -1
  var22 = 15
  XGoto GetChrSpecific
  //= XReciever
var22 += var0
if YDistBackEdge >= var22
  Button X
  Stick 1
  Seek dashCheck
endif
Return
label dashCheck
XGoto PerFrameChecks
//= XReciever
Seek dashCheck
if YDistBackEdge < -10
  Button R
  Stick 1 (-1)
  Call MainHub
endif
Return
Return
