#include <Definition_AIMain.h>
//TrueID=0x40
id 0x40

//Set Unknown
unk 0x20000

//Strings

//____________________
label
var0=Direction*OPos*0.7
Stick var0
if var0 > 0 || FrameGE 5
    var1=6*Rnd
    Seek
endif
Return
//____________________
label
Stick var0
if FrameGE var1 || ODistLE 10
    Finish
endif
Return
Return

