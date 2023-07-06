#include <Definition_AIMain.h>
//TrueID=0x4061
id 0x4061

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
if DistFrontEdge <= 40
    Finish
endif
Return
//____________________
label
if !(FrameGE 3)
    AbsStick OPos
elif FrameGE 2
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if FrameGE 12 && !(FrameGE 13)
    Button A
endif
if FrameGE 13
    Seek
endif
Return
var1=0
//____________________
label _0
if var1 < 1 && YDistFloor <= 25 && YDistFloor > 0 && YSpeed < 0
    var2=LevelValue/100
    if Rnd <= var2
        Button R
    endif
    var1=1
endif
if !(InAir)
    Finish
endif
Return
