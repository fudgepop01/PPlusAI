#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x00000

if Equal lastScript hex(0x8001)
  approachType = at_edgeguard
  Call ApproachHub
else
  Call AIHub
endif
Return
Return
