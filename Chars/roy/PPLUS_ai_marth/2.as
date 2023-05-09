#include <Definition_AIMain.h>
//TrueID=0x2
id 0x8002

//Set Unknown
unk 0x20000

//Strings

if !(Lying)
    Finish
endif
if IsOnStage < 1 || OIsOnStage < 1
    Finish
endif
if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
//____________________
label
if !(XDistLE 15)
    AbsStick OPos
else
    Seek
endif
Return
//____________________
label
if FrameGE 5 && !(FrameGE 6)
    Stick 0 (-0.3)
    Button A
endif
if FrameGE 36
    Stick 0 1
    Button B
endif
if FrameGE 40
    Finish
endif
Return
