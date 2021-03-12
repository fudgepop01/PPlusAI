#include <Definition_AIMain.h>
//TrueID=0x6032
id 0x6032

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
    var0=OPos*0.5
    AbsStick var0
    Button A
endif
if FrameGE 7
    Finish
endif
Return
