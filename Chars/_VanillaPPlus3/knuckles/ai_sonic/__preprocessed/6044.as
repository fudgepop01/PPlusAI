#include <Definition_AIMain.h>
//TrueID=0x6044
id 0x6044

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

if !(ODistLE 25)
    Finish
endif
//____________________
label
if FrameGE 1 && !(FrameGE 2)
    Button A
    Stick 0 1
endif
if FrameGE 5
    Finish
endif
Return

