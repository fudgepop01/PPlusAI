#include <Definition_AIMain.h>
//TrueID=0x80
id 0x80

//Set Unknown
unk 0x00000

//Strings

LOGSTR str("============")
LOGSTR str("=== __80 ===")
LOGSTR str("============")
if OAttacking && Equal AirGroundState 1 && Rnd < 0.5
    Call Reflect
elif Equal lastScript hex(0x8001)
    Call ApproachHub
endif
Call AIHub
Finish
Return
Return
