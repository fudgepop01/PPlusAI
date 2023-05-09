#include <Definition_AIMain.h>
//TrueID=0x4058
id 0x4058

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
if !(InAir) && Idling
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
if FrameGE 0 && !(FrameGE 4)
    AbsStick OPos
endif
if FrameGE 4 && !(FrameGE 5)
    ClearStick
    Stick 0 (-1)
    Button A
endif
if FrameGE 6 && !(FrameGE 8)
    ClearStick
    Stick 0 1
    Button A
endif
if FrameGE 11
    Finish
endif
Return
