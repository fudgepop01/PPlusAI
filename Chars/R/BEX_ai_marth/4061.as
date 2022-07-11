#include <Definition_AIMain.h>
//TrueID=0x4061
id 0x4061

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
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
if XDistLE 25
    Seek
endif
Return
//____________________
label
if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
if FrameGE 4
    Stick 0 (-0.3)
endif
if FrameGE 8
    Stick 0 (-0.3)
    Button A
endif
if FrameGE 13
    Finish
endif
Return
