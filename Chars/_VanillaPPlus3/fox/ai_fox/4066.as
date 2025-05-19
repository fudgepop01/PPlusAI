#include <Definition_AIMain.h>
//TrueID=0x4066
id 0x4066

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
    if Rnd >= 8
        Stick 0 1
        Button A
    else
        Stick 0 0.5
        Button A
    endif
endif
if FrameGE 5
    Finish
endif
Return
