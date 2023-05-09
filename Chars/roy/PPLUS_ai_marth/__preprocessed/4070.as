#include <Definition_AIMain.h>
//TrueID=0x4070
id 0x4070

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
if !(InAir) && Idling && XDistLE 30
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
var20=YCoord+30
if OYCoord > var20
    Call 0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call 0x8003
endif
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
endif
if FrameGE 3 && !(FrameGE 4)
    Stick 0 (-0.3)
    Button A
endif
if FrameGE 22
    Finish
endif
Return

