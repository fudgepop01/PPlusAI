#include <Definition_AIMain.h>
//TrueID=0x4
id 0x8004

//Set Unknown
unk 0x90000

//Strings

if !(InAir) && Idling && XDistLE 30
    Seek
else
    Finish
endif
Return
//____________________
label
var0=OPos*(-1)
AbsStick var0
if FrameGE 4
    Seek
endif
Return
//____________________
label
var0=OPos*(-1)
AbsStick var0
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 7 && !(FrameGE 10)
    ClearStick
    Stick (-1)
endif
if FrameGE 10 && !(FrameGE 13)
    ClearStick
    Button B
endif
if FrameGE 13 && !(FrameGE 15)
    ClearStick
endif
if FrameGE 18
    Stick 0 (-1)
endif
if FrameGE 20 && !(InAir)
    Finish
endif
Return
