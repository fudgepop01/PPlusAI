#include <Definition_AIMain.h>
//TrueID=0x4042
id 0x4042

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
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
else
    Finish
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call 0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call 0x8003
endif
AbsStick OPos
if FrameGE 4
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call 0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call 0x8003
endif
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 5 && !(FrameGE 6)
    ClearStick
    Button A
endif
if FrameGE 10
    Finish
endif
Return