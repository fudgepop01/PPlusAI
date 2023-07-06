#include <Definition_AIMain.h>
//TrueID=0x3060
id 0x3060

//Set Unknown
unk 0x90000

//Strings

if FramesHitstun < 1
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button A
endif
if FrameGE 5
    Finish
endif
Return
