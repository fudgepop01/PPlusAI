#include <Definition_AIMain.h>
id 0x820C
unk 0x0

//= XReciever
label prep
XGoto PerFrameChecks
//= XReciever
Stick 0 (-1)
Seek
Return
label start
XGoto PerFrameChecks
//= XReciever

GET_CHAR_TRAIT(immediateTempVar, chr_cs_djumpHeight)
if YDistBackEdge >= immediateTempVar
  Button X
endif

if Equal CurrAction hex(0x74) 
  Call OnLedge
endif
Return
Return