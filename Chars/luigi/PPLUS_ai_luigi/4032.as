#include <Definition_AIMain.h>
//TrueID=0x4032
id 0x4032

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
if FrameGE 0 && !(FrameGE 1)
    Button A
endif
if FrameGE 18 && !(FrameGE 19)
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button A
endif
if FrameGE 22 && !(FrameGE 23)
    Finish
endif
Return
