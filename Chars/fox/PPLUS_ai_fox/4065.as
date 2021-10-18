#include <Definition_AIMain.h>
//TrueID=0x4065
id 0x4065

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
Return
//____________________
label
var0=OPos*(-1)
if DistFrontEdge <= 20
    Finish
endif
if !(FrameGE 6)
    AbsStick var0
elif FrameGE 5
    Seek
endif
Return
//____________________
label
if DistBackEdge <= 20
    AtkDiceRoll 0x2004
endif
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if FrameGE 2 && !(FrameGE 3)
    AbsStick OPos
endif
if FrameGE 4 && !(FrameGE 5)
    Button B
endif
if FrameGE 12 && !(FrameGE 13)
    Button B
endif
if FrameGE 20
    Finish
endif
Return
