#include <Definition_AIMain.h>
//TrueID=0x1090
id 0x1090

//Set Unknown
unk 0x00000

//Strings

var21 = 4240
LOGSTR 1027423488 1027423488 1027423488 1027423488 0
LOGSTR 1027423488 540094464 959455232 1027423488 0
LOGSTR 1027423488 1027423488 1027423488 1027423488 0
  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal var21 32769
    Call ApproachHub
  endif
Call AIHub
Finish
Return
