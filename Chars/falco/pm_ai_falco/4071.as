#include <Definition_AIMain.h>
//TrueID=0x4071
id 0x4071

//Set Unknown
unk 0x90000

//Strings

if OBlown
    Call GroundCombo
endif
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call ApproachHub
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call EdgeguardHub
elif OCurrSubaction >= 67 && OCurrSubaction <= 69
    Call EdgeguardHub
endif
if !(InAir) && Idling && XDistLE 15
    Seek
else
    Finish
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
    Button A
endif
if FrameGE 5
    Finish
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 500)
endif
Return
