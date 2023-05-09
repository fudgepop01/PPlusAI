#include <Definition_AIMain.h>
//TrueID=0x4051
id 0x4051

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
if DistFrontEdge <= 35
    Finish
elif DistBackEdge <= 35
    Finish
endif
Return
//____________________
label _0
var0=OPos*(-1)
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
    Button B
endif
if HitboxConnected > 0
    Seek _1
endif
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
    AbsStick var0 (-1)
    Button R
endif
if FrameGE 18
    Finish
endif
Return
//____________________
label _1
var0=OPos*(-1)
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if DistFrontEdge >= 50
    var0*=-1
elif DistBackEdge >= 50
    var0*=-1
endif
if FrameGE 8 && !(FrameGE 9)
    AbsStick var0 (-1)
    Button R
endif
if FrameGE 18
    Finish
endif
Return

