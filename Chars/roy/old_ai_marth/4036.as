#include <Definition_AIMain.h>
//TrueID=0x4036
id 0x4036

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20)
    Finish
endif
if OBlown
    Call 0x8010
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
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20)
    Finish
endif
if DistBackEdge <= 30
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
    Stick (-1) (-0.5)
    Button R
endif
if FrameGE 15
    Finish
endif
Return
