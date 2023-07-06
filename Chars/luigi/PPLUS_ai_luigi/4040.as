#include <Definition_AIMain.h>
//TrueID=0x4040
id 0x4040

//Set Unknown
unk 0x90000

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
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 1 1
endif
if FrameGE 5 && !(FrameGE 6)
    Stick 1
    Button A
endif
if FrameGE 35
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button A
endif
if FrameGE 5
    Finish
endif
Return
