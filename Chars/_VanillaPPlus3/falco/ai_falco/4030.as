#include <Definition_AIMain.h>
//TrueID=0x4030
id 0x4030

//Set Unknown
unk 0x00000

//Strings

if OBlown
    Call GroundCombo
endif
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20)
    Finish
endif
var20=YCoord+30
if OYCoord > var20
    Call routine0x8001
elif OCurrSubaction >= 190 && OCurrSubaction <= 192
    Call routine0x8003
elif OCurrSubaction >= 67 && OCurrSubaction <= 69
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
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 6
    ClearStick
    if Damage <= 85
        Stick 0 (-1)
    endif
    Button A
    if CurrAction >= 51 && CurrAction < 52
        Seek _0
    endif
endif
if FrameGE 12
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
//____________________
label _1
if FrameGE 0 && !(FrameGE 500)
endif
Return
