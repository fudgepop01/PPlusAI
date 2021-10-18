#include <Definition_AIMain.h>
//TrueID=0x4052
id 0x4052

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling && !(Back)
    Seek
elif Back
    Call ATKMid9
endif
if DistFrontEdge <= 35
    Finish
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
    Button B
endif
if HitboxConnected > 0
    Seek _1
endif
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
    Stick 1 (-1)
    Button R
endif
if FrameGE 18
    Finish
endif
Return
//____________________
label _1
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
    Stick 1 (-1)
    Button R
endif
if FrameGE 18 && !(FrameGE 19)
    Stick 0 1
    Button A
endif
if FrameGE 23
    Finish
endif
Return
