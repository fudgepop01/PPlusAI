#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x00000

//Strings

LOGSTR 1027423488 1027423488 1027423488 1027423488 0
LOGSTR 1027423488 540160000 875569152 1027423488 0
LOGSTR 1027423488 1027423488 1027423488 1027423488 0
  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal var21 32769
    Call ApproachHub
  endif
Call AIHub
Return
Return

