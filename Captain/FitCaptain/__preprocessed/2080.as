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
if Equal CurrAction 0 && XDistFrontEdge <= 4
  Stick (-1)
elif XDistFrontEdge < 15 && Equal AirGroundState 1 && XDistFrontEdge > 4
  Taunt 1
elif XDistBackEdge >= -20 && XDistBackEdge <= -17 && Equal CurrAction 3
  Stick (-1)
elif Equal CurrAction 125
  Stick (-1)
elif Equal CurrAction 1 || XDistFrontEdge <= 3
  ClearStick
else
  Stick 1
endif
Return
Return
