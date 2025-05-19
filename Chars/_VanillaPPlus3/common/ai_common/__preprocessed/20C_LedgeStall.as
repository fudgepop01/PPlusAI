#include <Definition_AIMain.h>
id 0x820C
unk 0x0

//= XReciever
label prep
XGoto PerFrameChecks
//= XReciever
Stick 0 (-1)
Seek start
Return
label start
XGoto PerFrameChecks
//= XReciever

  var22 = 15
  XGoto GetChrSpecific
  //= XReciever
Seek start
if YDistBackEdge >= var22
  Button X
endif

if Equal CurrAction 116 
  Call OnLedge
endif
Return
Return
