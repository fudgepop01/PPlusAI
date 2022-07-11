#include <Definition_AIMain.h>
//TrueID=0x6037
id 0x6037

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if FrameGE 0 && !(FrameGE 1)
    Button A
    Stick 0 (-1)
endif
if FrameGE 10
    Finish
endif
Return
