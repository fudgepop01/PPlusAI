#include <Definition_AIMain.h>
//TrueID=0x3
id 0x8003

//Set Unknown
unk 0x70000

//Strings

if !(InAir) && Idling
    if ODamage <= 30
        Seek _1
    elif ODamage > 30 && ODamage <= 80
        Seek _1
    elif ODamage > 80
        Seek _2
    endif
else
    Finish
endif
Return
//____________________
label _0
AbsStick OPos
if XDistLE 90
    Button B
endif
if FrameGE 30
    Finish
endif
Return
//____________________
label _1
AbsStick OPos
if XDistLE 90
    Seek
endif
Return
//____________________
label
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 1 1
endif
if FrameGE 5 && !(FrameGE 6)
    ClearStick
    Stick 0 (-1)
    Button A
endif
if FrameGE 10
    Finish
endif
Return
//____________________
label _2
AbsStick OPos
if XDistLE 90
    Seek
endif
Return
//____________________
label
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 1 1
endif
if FrameGE 5 && !(FrameGE 6)
    Button A
endif
if FrameGE 10
    Finish
endif
Return
