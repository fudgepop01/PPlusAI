// "NOONE AROUND" ROUTINE
// the AI is FORCED into this routine when there is no target
#include <Definition_AIMain.h>
//TrueID=0x2080
id 0x2080

//Set Unknown
unk 0x0

if !(NoOpponent)
  Call AIHub
endif
if Equal CurrAction hex(0x00) && XDistFrontEdge <= 4
  Stick (-1)
elif XDistFrontEdge < 15 && Equal AirGroundState 1 && XDistFrontEdge > 4
  Taunt utaunt
elif XDistBackEdge >= -20 && XDistBackEdge <= -17 && Equal CurrAction hex(0x03)
  Stick (-1)
elif Equal CurrAction hex(0x7D)
  Stick (-1)
elif Equal CurrAction hex(0x01) || XDistFrontEdge <= 3
  ClearStick
else
  Stick 1
endif
Return
Return