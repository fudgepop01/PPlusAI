#include <Definition_AIMain.h>
//TrueID=0x7001
id 0x7001

//Set Unknown
unk 0x00000

//Strings

if DistFrontEdge < 25 || !(ODistLE 60) || InAir
    Finish
elif DistBackEdge < 25 || !(ODistLE 60) || InAir
    Finish
elif CanThrow
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if OPos > 0
    var1=-1
elif OPos < 0
    var1=1
endif
if FrameGE 8 && !(FrameGE 9)
    Button R
    Stick var1 (-1)
endif
if FrameGE 18
    Finish
endif
Return
