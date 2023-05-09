#include <Definition_AIMain.h>
//TrueID=0x4030
id 0x4030

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
var20=YCoord+30
if OYCoord > var20
    Call ApproachHub
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call EdgeguardHub
endif
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 9
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20)
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call ApproachHub
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call EdgeguardHub
endif
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 17
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20)
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call ApproachHub
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call EdgeguardHub
endif
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 48
    Finish
endif
Return

