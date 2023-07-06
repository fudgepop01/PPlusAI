#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x0

if Equal var18 0
  var20 = 24633
  var9 = 0
  var10 = 0
  var11 = 20
  var12 = 10
  var13 = 20
  var14 = 20
  Call ApproachHub
else
  var15 = 26
  Stick 1 0
  Button B
  SetFrame 0
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
if CurrAction <= 9 || !(Equal AirGroundState 1)
  Call AIHub
endif
Return
Return
