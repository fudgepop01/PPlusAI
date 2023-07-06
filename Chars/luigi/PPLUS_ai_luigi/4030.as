#include <Definition_AIMain.h>
//TrueID=0x4030
id 0x4030

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
if FrameGE 16 && !(FrameGE 17)
    Seek
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
