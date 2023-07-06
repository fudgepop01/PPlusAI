#include <Definition_AIMain.h>
//TrueID=0x6041
id 0x6041

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(ODistLE 25)
    Finish
endif
//____________________
label
if FrameGE 1 && !(FrameGE 2)
    Button A
endif
if FrameGE 5
    Finish
endif
Return
