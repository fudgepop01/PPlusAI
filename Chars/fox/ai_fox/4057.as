#include <Definition_AIMain.h>
//TrueID=0x4057
id 0x4057

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
if DistFrontEdge <= 30
    Finish
elif DistBackEdge <= 30
    Finish
endif
Return
//____________________
label
var0=OPos*(-1)
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 4 && !(FrameGE 5)
    Button R
    AbsStick var0 (-1)
endif
if FrameGE 14
    Finish
endif
Return
