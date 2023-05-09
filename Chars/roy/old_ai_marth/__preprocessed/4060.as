#include <Definition_AIMain.h>
//TrueID=0x4060
id 0x4060

//Set Unknown
unk 0x90000

//Strings

if XDistBackEdge <= 30
    Finish
endif
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
if FrameGE 6
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
if FrameGE 6
    Finish
endif
Return

