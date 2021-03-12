#include <Definition_AIMain.h>
//TrueID=0x7004
id 0x7004

//Set Unknown
unk 0x70000

//Strings
str "#wait_f"

if FrameGE 0 && !(FrameGE 11)
    AbsStick OPos
endif
if FrameGE 4 && !(FrameGE 5)
    Button X
endif
if FrameGE 10 && !(FrameGE 15)
    Stick 0 (-1)
    Button B
endif
if FrameGE 16
    Call 0x7003
endif
Return
