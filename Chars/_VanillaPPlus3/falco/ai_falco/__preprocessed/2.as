#include <Definition_AIMain.h>
//TrueID=0x2
id 0x8002

//Set Unknown
unk 0x00000

//Strings

if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
//____________________
label
if !(XDistLE 20)
    AbsStick OPos
else
    Stick 0 (-1)
    Button A
endif
Return

