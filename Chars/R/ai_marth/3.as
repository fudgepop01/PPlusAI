#include <Definition_AIMain.h>
//TrueID=0x3
id 0x8003

//Set Unknown
unk 0x70000

//Strings

if FrameGE 5
    Seek
endif
Return
//____________________
label
if XDistLE 40
    Seek _0
elif !(XDistLE 40) && XDistLE 60
    Seek _1
elif !(XDistLE 60)
    Finish
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 1)
    Stick OPos
    Button A
endif
if FrameGE 5
    Finish
endif
Return
//____________________
label _1
Call ATKMid8
Return
