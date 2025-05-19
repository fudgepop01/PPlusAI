#include <Definition_AIMain.h>
//TrueID=0x2014
id 0x2014

//Set Unknown
unk 0x00000

//Strings
str "#sp_wait"

if FrameGE 6 && !(FrameGE 9)
    Stick 1 1
endif
if FrameGE 9 && !(FrameGE 10)
    ClearStick
    Button A
    Finish
endif
Return
