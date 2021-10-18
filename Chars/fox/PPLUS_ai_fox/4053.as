#include <Definition_AIMain.h>
//TrueID=0x4053
id 0x4053

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
    Button B
endif
if HitboxConnected > 0
    Seek _2
endif
if FrameGE 5 && !(FrameGE 6)
    Stick 0 1
endif
if FrameGE 6 && !(FrameGE 9) && !(DistBackEdge <= 40)
    Stick 1
endif
if FrameGE 9 && !(FrameGE 10)
    Button A
endif
if FrameGE 10 && !(FrameGE 15) && !(DistBackEdge <= 40)
    Stick 1 (-1)
endif
if FrameGE 15
    Seek
endif
Return
var1=0
//____________________
label _1
if var1 < 1
    var2=LevelValue/100
    if Rnd <= var2
        Button R
    endif
    AbsStick OPos (-0.5)
    var1=1
else
    var1=0
endif
if !(InAir)
    Finish
endif
Return
//____________________
label _2
if DistFrontEdge <= 35
    Finish
endif
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
    Stick 1 (-1)
    var2=LevelValue/100
    if Rnd <= var2
        Button R
    endif
endif
if FrameGE 18
    Seek _0
endif
Return
