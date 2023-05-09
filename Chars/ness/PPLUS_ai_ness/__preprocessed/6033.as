#include <Definition_AIMain.h>
//TrueID=0x6033
id 0x6033

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if FrameGE 0 && !(FrameGE 1)
    AbsStick 0 0.5
endif
if FrameGE 2 && !(FrameGE 3)
    Button A
endif
if FrameGE 10
    Finish
endif
Return

