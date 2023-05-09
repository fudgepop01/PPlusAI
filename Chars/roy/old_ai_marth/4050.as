#include <Definition_AIMain.h>
//TrueID=0x4050
id 0x4050

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call ApproachHub
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call EdgeguardHub
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
if FrameGE 15
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0.3
    Button A
endif
if FrameGE 19
    Finish
endif
Return
