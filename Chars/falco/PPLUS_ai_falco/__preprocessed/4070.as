#include <Definition_AIMain.h>
//TrueID=0x4070
id 0x4070

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
    Call 0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call 0x8003
elif OCurrSubaction >= 67 && OCurrSubaction <= 69
    Call 0x8003
endif
if !(InAir) && Idling && XDistLE 10
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
if FrameGE 0 && !(FrameGE 1)
    Stick 0 0.3
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

