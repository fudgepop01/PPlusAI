#include <Definition_AIMain.h>
//TrueID=0x5001
id 0x5001

//Set Unknown
unk 0x0

//Strings

var0=YCoord+20
if FrameGE 0 && !(FrameGE 1) && Rnd <= 0.2 && OYCoord < var0
    Stick 0 0.5
    Button A
    Finish
elif FrameGE 0 && !(FrameGE 1) && Idling && Rnd > 0.2
    Seek _0
else
    Finish
endif
Return
//____________________
label _0
var0=YCoord+20
var1=YCoord+50
var2=YCoord+90
if FrameGE 0 && !(FrameGE 1) && OYCoord < var0
    Seek _1
elif FrameGE 0 && !(FrameGE 6) && OYCoord > var0 && !(OYCoord >= var1)
    Seek _2
elif FrameGE 0 && !(FrameGE 6) && OYCoord > var1 && !(OYCoord >= var2)
    Seek _3
endif
Return
//____________________
label _1
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 6
    ClearStick
    Stick (-1)
    Button A
    Finish
endif
Return
//____________________
label _2
AbsStick OPos
if FrameGE 0 && !(FrameGE 6)
    Stick 0 1
endif
if FrameGE 6
    ClearStick
    Stick (-1)
    Button A
    Finish
endif
Return
//____________________
label _3
AbsStick OPos
if FrameGE 0 && !(FrameGE 6)
    Stick 0 1
endif
if FrameGE 23 && !(FrameGE 26)
    Stick 0 1
endif
if FrameGE 25
    ClearStick
    Stick (-1)
    Button A
    Finish
endif
Return
