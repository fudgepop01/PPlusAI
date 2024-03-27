#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x0

//Strings

if DistFrontEdge < 25 || !(ODistLE 60) || InAir
    Finish
elif DistBackEdge < 25 || !(ODistLE 60) || InAir
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


