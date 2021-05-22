#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x0

if Equal AirGroundState 2
  Call AIHub
endif
Cmd30

if Equal var18 0
  var20 = 24633
  var9 = 3
  var10 = 0
  var11 = 8
  var12 = 5
  var13 = 26
  var14 = 26 // just a dummy
  Call ApproachHub
else
  var15 = 26
  AbsStick OPos 0
  Button B
  SetFrame 0
  Seek ExecuteAttack
endif
Return

label ExecuteAttack
Cmd30
if CurrAction <= 9 || !(Equal AirGroundState 1) || FramesHitstun > 0
  Call AIHub
endif
Return
Return
