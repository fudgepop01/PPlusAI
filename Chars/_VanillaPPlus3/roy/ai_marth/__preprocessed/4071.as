#include <Definition_AIMain.h>
//TrueID=0x4071
id 0x4071

//Set Unknown
unk 0x00000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call routine0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call routine0x8003
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
    Call routine0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call routine0x8003
endif
var0=OPos*(-1)
AbsStick var0
if FrameGE 4
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call routine0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call routine0x8003
endif
if FrameGE 0 && !(FrameGE 1)
    AbsStick OPos
    Button B
endif
if FrameGE 29
    Finish
endif
Return

