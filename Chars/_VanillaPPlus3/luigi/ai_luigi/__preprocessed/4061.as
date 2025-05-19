#include <Definition_AIMain.h>
//TrueID=0x4061
id 0x4061

//Set Unknown
unk 0x00000

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
if IsOnStage < 1 || OIsOnStage < 1
    Finish
endif
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
    Stick 0.5
    Button A
endif
if FrameGE 5
    Finish
endif
Return

