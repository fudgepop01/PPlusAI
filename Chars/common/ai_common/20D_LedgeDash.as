#include <Definition_AIMain.h>
id 0x820D
unk 0x0

//= XReciever
label prep
XGoto PerFrameChecks
//= XReciever
Stick -1
Seek start
Return
label start
XGoto PerFrameChecks
//= XReciever
Seek start

#let HSize = var0
GET_CHAR_TRAIT(immediateTempVar, chr_cs_djumpHeight)
immediateTempVar -= 10
if YDistBackEdge >= immediateTempVar
  Button X
  Stick 1
  Seek dashCheck
endif
Return
label dashCheck
XGoto PerFrameChecks
//= XReciever
Seek dashCheck
if YDistFloor >= 0
  Button R
  Stick 1 (-1)
  Call MainHub
endif
Return
Return