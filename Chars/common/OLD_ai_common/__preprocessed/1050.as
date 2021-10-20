#include <Definition_AIMain.h>
//TrueID=0x1050
id 0x1050

//Set Unknown
unk 0x10000

//Strings

SetTimeout 10
WaitForGroundCanAct
SetTimeout 120
//____________________
label
var0=Direction*OPos
if var0 < 0
    Stick (-0.5)
else
    Call slot2
    Finish
endif
Return
Return

