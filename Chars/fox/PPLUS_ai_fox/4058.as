#include <Definition_AIMain.h>
//TrueID=0x4058
id 0x4058

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
if DistFrontEdge <= 35
    Finish
elif DistBackEdge <= 35
    Finish
endif
Return
//____________________
label
var0=OPos
var1=OPos
var0*=-1
if FrameGE 0 && !(FrameGE 12)
    AbsStick var0
endif
if FrameGE 12 && !(FrameGE 25)
    AbsStick var1
    if XDistLE 10
        Button A | R
    endif
endif
if FrameGE 25
    Finish
endif
Return
