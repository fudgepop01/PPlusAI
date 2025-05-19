#include <Definition_AIMain.h>
//TrueID=0x7003
id 0x7003

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

if FrameGE 0 && !(FrameGE 1)
    Stick OPos 1
endif
if FrameGE 5 && !(FrameGE 6)
    Stick OPos 1
endif
if FrameGE 11
    Call AerialBase
endif
Return
