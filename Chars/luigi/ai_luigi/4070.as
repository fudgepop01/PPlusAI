#include <Definition_AIMain.h>
//TrueID=0x4070
id 0x4070

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick (-1) 1
endif
if FrameGE 5
    Finish
endif
Return
