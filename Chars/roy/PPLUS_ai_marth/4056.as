#include <Definition_AIMain.h>
//TrueID=0x4056
id 0x4056

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
if XDistLE 20
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 10
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 18
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 48
    Finish
endif
Return
