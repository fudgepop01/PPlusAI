#include <Definition_AIMain.h>
//TrueID=0x3030
id 0x3030

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

if !(ODistLE 23)
    Finish
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Finish
endif
Return

