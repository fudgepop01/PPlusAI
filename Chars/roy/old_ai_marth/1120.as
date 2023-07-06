#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x20000

//Strings

if ODamage <= 45
    Seek _0
else
    Seek _1
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 5
    Finish
endif
Return
//____________________
label _1
if FrameGE 0 && !(FrameGE 1)
    Stick 1
endif
if FrameGE 5
    Finish
endif
Return
