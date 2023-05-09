#include <Definition_AIMain.h>
//TrueID=0x6036
id 0x6036

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(ODistLE 23)
    Finish
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button A
    Stick 0 1
endif
if FrameGE 5
    Finish
endif
Return

