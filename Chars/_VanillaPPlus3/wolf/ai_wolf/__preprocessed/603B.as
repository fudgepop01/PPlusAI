#include <Definition_AIMain.h>
//TrueID=0x603B
id 0x603B

//Set Unknown
unk 0x00000

//Strings

//____________________
label
if FrameGE 0
    Button B
    Stick 0 (-1)
endif
if FrameGE 5
    Call RollBase
else
    Button X
endif
if FrameGE 22
    Finish
endif
Return

