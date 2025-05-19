#include <Definition_AIMain.h>
//TrueID=0x6000
id 0x6000

//Set Unknown
unk 0x00000

//Strings

if XCoord > 10
    AbsStick (-0.5)
elif XCoord < -10
    AbsStick 0.5
else
    Finish
endif
Return
