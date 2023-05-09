#include <Definition_AIMain.h>
//TrueID=0x406B
id 0x406B

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || DistFrontEdge <= 70
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
AbsStick OPos
if FrameGE 4
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 10 && !(FrameGE 11)
    ClearStick
    Button B
endif
if FrameGE 18
    Stick 0 (-1)
endif
if FrameGE 20 && !(InAir)
    Finish
endif
Return

