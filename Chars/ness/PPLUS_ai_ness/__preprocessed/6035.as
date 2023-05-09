#include <Definition_AIMain.h>
//TrueID=0x6035
id 0x6035

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if FrameGE 0 && !(FrameGE 1)
    Button A
    Stick 1
else
    Button A
    Stick (-1)
endif
if FrameGE 10
    Finish
endif
Return

