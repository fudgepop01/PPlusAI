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

#let HSize = var0
GET_CHAR_TRAIT(immediateTempVar, chr_cs_djumpHeight)
Seek start
immediateTempVar -= HurtboxSize
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
if Equal CurrAction hex(0x74) 
  Call OnLedge
endif
Return
Return