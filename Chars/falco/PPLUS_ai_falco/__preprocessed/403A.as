#include <Definition_AIMain.h>
//TrueID=0x403A
id 0x403A

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20) || DistBackEdge <= 70
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
if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
//____________________
label
if DistBackEdge < 70 || IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
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
var0=OPos*(-1)
AbsStick var0
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 7 && !(FrameGE 10)
    ClearStick
    Stick (-1)
endif
if FrameGE 10 && !(FrameGE 13)
    ClearStick
    Button B
endif
if FrameGE 13 && !(FrameGE 15)
    ClearStick
endif
if FrameGE 18
    Stick 0 (-1)
endif
if FrameGE 20 && !(InAir)
    Finish
endif
Return

