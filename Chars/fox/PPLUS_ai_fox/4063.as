#include <Definition_AIMain.h>
//TrueID=0x4063
id 0x4063

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling && Back
    Seek
elif !(Back)
    Call ATKFar2
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
    Stick (-1)
endif
if FrameGE 9 && !(FrameGE 10)
    Stick (-1)
    Button A
endif
if FrameGE 10 && !(FrameGE 15) && !(DistBackEdge <= 40)
    Stick (-1) (-1)
endif
if FrameGE 15
    Seek
endif
Return
var1=0
//____________________
label _1
var4=YDistFloor
var5=YSpeed
if var1 < 1 && YDistFloor <= 25 && YDistFloor > 0 && YSpeed < 0
    var2=LevelValue/100
    if Rnd <= var2
        Button R
    endif
    var1=1
endif
endif
if !(InAir)
Finish
endif
Return
//____________________
label _2
if DistBackEdge <= 35
Finish
endif
if DistFrontEdge <= 30
Finish
elif DistBackEdge <= 30
Finish
endif
if FrameGE 4 && !(FrameGE 5)
Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
Stick (-1) (-1)
Button R
endif
endif
if FrameGE 18
Seek _0
endif
Return
