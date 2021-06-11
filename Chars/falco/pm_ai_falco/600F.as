#include <Definition_AIMain.h>
//TrueID=0x600F
id 0x600F

//Set Unknown
unk 0x90000

//Strings

if InAir
    Seek
else
    Finish
endif
Return
//____________________
label
if CurrSubaction >= 32 && CurrSubaction <= 37
    Seek
endif
Return
//____________________
label
if YCoord < 0.5
    Button R
    Stick 1
    Seek
endif
Return
//____________________
label
if FrameGE 10
    Finish
endif
Return
