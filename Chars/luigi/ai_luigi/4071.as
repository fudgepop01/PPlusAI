#include <Definition_AIMain.h>
//TrueID=0x4071
id 0x4071

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved
    Finish
endif
if !(InAir) && Idling && XDistLE 10
    Seek
else
    Finish
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    AbsStick 0 (-1)
    Button A
endif
if FrameGE 5
    Finish
endif
Return
