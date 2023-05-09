#include <Definition_AIMain.h>
//TrueID=0x6100
id 0x6100

//Set Unknown
unk 0x0

//Strings

label
var0=DistFrontEdge
var1=DistBackEdge
ClearStick
if DistFrontEdge < 30
    Stick 1
elif DistBackEdge < 30
    Stick (-1)
else
    Stick 0 1
endif
if CurrAction <= hex(0x20) || FramesHitstun > 0
    Finish
endif
Return
Return
