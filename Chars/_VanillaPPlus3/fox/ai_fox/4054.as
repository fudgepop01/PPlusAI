#include <Definition_AIMain.h>
//TrueID=0x4054
id 0x4054

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 1 && !(FrameGE 12) && !(DistFrontEdge <= 40)
    AbsStick OPos
endif
if FrameGE 12 && !(FrameGE 13)
    Button A
endif
if FrameGE 13 && !(FrameGE 17) && !(DistFrontEdge <= 40)
    AbsStick OPos
endif
if FrameGE 17
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
        AbsStick OPos (-0.5)
    endif
    var1=1
endif
endif
if !(InAir)
Finish
endif
Return
