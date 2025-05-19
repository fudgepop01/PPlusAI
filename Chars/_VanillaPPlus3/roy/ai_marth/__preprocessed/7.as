#include <Definition_AIMain.h>
//TrueID=0x7
id 0x8007

//Set Unknown
unk 0x00000

//Strings

if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
if Back
    if FrameGE 0 && !(FrameGE 2)
        Stick 0.3
    endif
else
    Seek
endif
Return
//____________________
label
if XDistLE 10
    Seek
else
    AbsStick OPos
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 5 && !(FrameGE 6)
    Stick (-0.5) (-1)
    Button R
endif
if FrameGE 15
    Seek
endif
Return
//____________________
label
if !(DistFrontEdge <= 25)
    Stick 0.5
else
    Seek
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-0.3)
    Button A
endif
if FrameGE 10
    Finish
endif
Return

