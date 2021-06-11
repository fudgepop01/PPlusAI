#include <Definition_AIMain.h>
//TrueID=0x80
id 0x80

//Set Unknown
unk 0x00000

//Strings

LOGSTR 1027423488 1027423488 1027423488 1027423488 0
LOGSTR 1027423488 543121152 942678016 1027423488 0
LOGSTR 1027423488 1027423488 1027423488 1027423488 0
if OAttacking && Equal AirGroundState 1 && Rnd < 0.5
    Call Reflect
elif Equal var21 32769
    Call ApproachHub
endif
Call AIHub
Finish
Return
Return

