#include <Definition_AIMain.h>
//TrueID=0x3060
id 0x3060

//Set Unknown
unk 0x00000

//Strings

if Equal lastScript hex(0x8001)
  Call ApproachHub
else
  Call AIHub
endif
Return
Return