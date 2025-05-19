#include <Definition_AIMain.h>
//TrueID=0x4042
id 0x4042

//Set Unknown
unk 0x00000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
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
    AbsStick 0 1
    Button B
endif
if FrameGE 5
    Finish
endif
Return

