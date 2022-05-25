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
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
    Button B
endif
if FrameGE 1
    AbsStick OPos
    if XDistLE 20
        Seek
    endif
endif
if FrameGE 46
    Finish
endif
Return
//____________________
label
var1=0
//____________________
label _0
if var1 < 1
    Button B
    var1=1
else
    var1=0
endif
if FrameGE 46
    Finish
endif
Return
