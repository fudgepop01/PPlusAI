#include <Definition_AIMain.h>
//TrueID=0x4037
id 0x4037

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
if FrameGE 3
    Seek
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
if FrameGE 8 && XDistLE 3
    ClearStick
    Stick 0 (-1)
    Button B
    if HitboxConnected > 0
        Seek _0
    endif
endif
if FrameGE 13
    Finish
endif
Return
//____________________
label _0
if FrameGE 5 && !(FrameGE 6)
    Stick 0 1
endif
if FrameGE 7 && !(FrameGE 8) && Rnd >= 0.6
    Stick 0 (-1)
    Button A
elif FrameGE 7 && !(FrameGE 8) && Rnd < 0.6
    Stick (-1)
    Button A
endif
if FrameGE 13
    Finish
endif
Return
//____________________
label _1
if FrameGE 0 && !(FrameGE 500)
endif
Return

