#include <Definition_AIMain.h>
//TrueID=0x2012
id 0x2012

//Set Unknown
unk 0x00000

//Strings
str "#hi_base"

if FrameGE 6 && !(FrameGE 9)
    Stick 1 1
endif
if FrameGE 9 && !(FrameGE 10)
    ClearStick
    Stick 0 (-1)
    Button A
    Finish
endif
Return

