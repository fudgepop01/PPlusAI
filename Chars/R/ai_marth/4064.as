#include <Definition_AIMain.h>
//TrueID=0x4064
id 0x4064

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
AbsStick OPos
if XDistLE 40
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
if DistFrontEdge <= 30
    Finish
endif
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 5 && !(FrameGE 6)
    Stick 1 (-0.5)
    Button R
endif
if FrameGE 6 && !(FrameGE 11)
    Stick 0 (-0.3)
endif
if FrameGE 11 && !(FrameGE 12)
    Stick 1
    Button A
endif
if FrameGE 16
    Finish
endif
Return
