#include <Definition_AIMain.h>
//TrueID=0x4069
id 0x4069

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
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
    Button A
endif
if FrameGE 5
    Finish
endif
Return

