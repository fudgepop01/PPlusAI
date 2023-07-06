#include <Definition_AIMain.h>
//TrueID=0x6034
id 0x6034

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
    AbsStick 0 (-1)
endif
if FrameGE 3 && !(FrameGE 4)
    Button A
endif
if FrameGE 7
    Finish
endif
Return
