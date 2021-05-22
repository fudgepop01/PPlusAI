#include <Definition_AIMain.h>
//TrueID=0x1150
id 0x1150

//Set Unknown
unk 0x00000

  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal var21 32769
    Call ApproachHub
  endif
Call AIHub
Return
Return

