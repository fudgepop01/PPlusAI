#include <Definition_AIMain.h>
//TrueID=0x4055
id 0x4055

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call 0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call 0x8003
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
if XDistLE 10
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 29
    Finish
endif
Return
