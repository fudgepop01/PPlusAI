#include <Definition_AIMain.h>
//TrueID=0x30A0
id 0x30A0

//Set Unknown
unk 0x10000

//Strings

SetTimeout 20
//____________________
label
if !(Idling) && !(Dashing)
    Return
endif
SetTimeout 10
Seek
Jump
Return
var0=(100-LevelValue)*0.05*Rnd+1
//____________________
label
Button R
if FrameGE var0
    Stick 0 (-1)
    Seek
endif
Return
//____________________
label
if FrameGE 2
    Finish
else
    Button R
    Stick 0 (-1)
endif
Return
Return

