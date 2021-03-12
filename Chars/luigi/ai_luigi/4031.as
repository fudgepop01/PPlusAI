#include <Definition_AIMain.h>
//TrueID=0x4031
id 0x4031

//Set Unknown
unk 0x90000

//Strings

if IsOnStage < 1 || OIsOnStage < 1 || InAirOnSaved || !(XDistLE 20)
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
    Button A
endif
if FrameGE 14 && !(FrameGE 15)
    Seek
endif
Return
//____________________
label
AbsStick OPos
if FrameGE 4 && !(FrameGE 5)
    Button A | R
endif
if FrameGE 10
    Finish
endif
Return
