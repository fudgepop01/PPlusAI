#include <Definition_AIMain.h>
//TrueID=0x6100
id 0x6100

//Set Unknown
unk 0x0

//Strings

Stick 0 0
if FrameGE 0.5
    Seek
endif
Return
//____________________
label _0
var0=DistFrontEdge
var1=DistBackEdge
ClearStick
if var0 < 30
    Stick 1
elif var1 < 30
    Stick (-1)
else
    Stick 0 1
endif
if FrameGE 5
    Finish
endif
Return
