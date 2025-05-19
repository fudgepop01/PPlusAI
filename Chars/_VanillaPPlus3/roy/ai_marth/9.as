#include <Definition_AIMain.h>
//TrueID=0x9
id 0x8009

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
if XDistLE 20
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
    Stick (-1) (-0.5)
    Button R
endif
if FrameGE 15
    Finish
endif
Return
