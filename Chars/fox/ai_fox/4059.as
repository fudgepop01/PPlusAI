#include <Definition_AIMain.h>
//TrueID=0x4059
id 0x4059

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
if DistFrontEdge <= 10
    Finish
endif
Return
//____________________
label
AbsStick OPos
if XDistLE 20
    Seek
endif
Return
//____________________
label
if IsOnStage < 1
    Finish
endif
if FrameGE 0 && !(FrameGE 1)
    if Rnd >= 8 && !(Back)
        Stick 0 1
        Button A
    else
        AbsStick OPos
        Button A
    endif
endif
if FrameGE 5
    Finish
endif
Return
