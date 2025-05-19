#include <Definition_AIMain.h>
//TrueID=0x40
id 0x40

//Set Unknown
unk 0x00000

//Strings

//____________________
label
var0=Direction*OPos*0.7
AbsStick OPos
if var0 > 0 || FrameGE 5
    var1=6*Rnd
    Seek
endif
Return
//____________________
label
AbsStick OPos
if FrameGE var1 || ODistLE 10
    Finish
endif
Return
Return
