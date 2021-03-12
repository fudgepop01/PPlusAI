#include <Definition_AIMain.h>
//TrueID=0x4064
id 0x4064

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling && Back
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if FrameGE 2 && !(FrameGE 3)
    AbsStick OPos
endif
if FrameGE 4 && !(FrameGE 5)
    Button B
endif
if FrameGE 12 && !(FrameGE 13)
    Button B
endif
if FrameGE 20
    Finish
endif
Return
