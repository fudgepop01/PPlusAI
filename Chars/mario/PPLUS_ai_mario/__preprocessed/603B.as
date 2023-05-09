#include <Definition_AIMain.h>
//TrueID=0x603B
id 0x603B

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
    Button B
    Stick 0 (-1)
endif
if FrameGE 5
    Finish
endif
Return

