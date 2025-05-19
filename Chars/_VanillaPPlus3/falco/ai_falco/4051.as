#include <Definition_AIMain.h>
//TrueID=0x4051
id 0x4051

//Set Unknown
unk 0x00000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call routine0x8001
endif
if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || DistFrontEdge <= 50
    Finish
endif
AbsStick OPos
if FrameGE 14
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
var10=OPos*(-1)
if !(FrameGE 4)
    AbsStick var10
else
    AbsStick OPos
endif
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 10
    ClearStick
    Stick (-1)
    Button A
    if CurrAction >= 51 && CurrAction < 52
        Seek _0
    endif
endif
if FrameGE 16
    Finish
endif
Return
//____________________
label _0
var1=0
//____________________
label
if OIsOnStage < 1 || IsOnStage < 1
    Finish
endif
if var1 < 1
    Button R
    var1=1
else
    var1=0
endif
if !(InAir) || IsOnStage < 1
    Finish
endif
Return
