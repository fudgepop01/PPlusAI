#include <Definition_AIMain.h>
//TrueID=0x4060
id 0x4060

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
if FrameGE 5
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
if FrameGE 7 && !(InAir) || FrameGE 7 && XDistLE 35
    Finish
endif
Return
