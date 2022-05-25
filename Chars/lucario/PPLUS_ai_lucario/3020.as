#include <Definition_AIMain.h>
//TrueID=0x3020
id 0x3020

//Set Unknown
unk 0x40000

//Strings

if DistFrontEdge < 3
    Finish
elif DistBackEdge < 3
    Finish
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if FrameGE 4 && !(FrameGE 5)
    Button R
    Stick OPos (-1)
endif
if FrameGE 10
    Finish
endif
Return
