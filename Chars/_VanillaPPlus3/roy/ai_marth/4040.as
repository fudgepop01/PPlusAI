#include <Definition_AIMain.h>
//TrueID=0x4040
id 0x4040

//Set Unknown
unk 0x00000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || fXFar || fXMiddle || fVeryClose
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call routine0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call routine0x8003
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
    Call routine0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call routine0x8003
endif
if FrameGE 0 && !(FrameGE 1)
    Stick 1 1
endif
if FrameGE 5 && !(FrameGE 6)
    Stick 1
    Button A
endif
if FrameGE 6 && !(FrameGE 10)
    Stick 1
endif
if FrameGE 10
    Finish
endif
Return
