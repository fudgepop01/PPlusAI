#include <Definition_AIMain.h>
//TrueID=0x4043
id 0x4043

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
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
else
    Finish
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
    Finish
endif
if DistFrontEdge <= 30
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call ApproachHub
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call EdgeguardHub
endif
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 5 && !(FrameGE 6)
    Stick 1 (-0.5)
    Button R
endif
if FrameGE 15 && !(FrameGE 16)
    Stick 1
    Button A
endif
Return
