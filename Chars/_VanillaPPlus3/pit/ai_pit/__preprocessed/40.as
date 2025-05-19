#include <Definition_AIMain.h>
//TrueID=0x40
id 0x40

//Set Unknown
unk 0x00000

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
SetTimeout 8
if DistBackEdge < 5
    Finish
endif
//____________________
label
if InAir
    Seek
else
    Button X
endif
Return
//____________________
label
if !(FrameGE 8)
    Button R
    Stick OPos (-1)
else
    Finish
endif
Return
Return

