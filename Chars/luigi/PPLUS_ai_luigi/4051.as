#include <Definition_AIMain.h>
//TrueID=0x4051
id 0x4051

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
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
var0=OPos*(-1)
if FrameGE 0 && !(FrameGE 15)
    AbsStick var0
endif
if FrameGE 15
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 5 && !(FrameGE 6)
    AbsStick OPos (-1)
    Button R
endif
if FrameGE 15
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1
    Finish
endif
if FrameGE 0 && !(FrameGE 1)
    ClearStick
    AbsStick OPos
    Button A
endif
if FrameGE 5
    Finish
endif
Return
