#include <Definition_AIMain.h>
//TrueID=0x4050
id 0x4050

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

ToggleSwitch
if !(InAir) && Idling && Back
    Seek
endif
if DistFrontEdge <= 35
    Finish
elif DistBackEdge <= 35
    Finish
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
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
var0=OPos
if FrameGE 8 && !(FrameGE 9)
    AbsStick var0 (-1)
    var11=LevelValue
    var2=LevelValue/100
    var10=Rnd
    if var10 <= var2
        Button R
    endif
endif
if FrameGE 19 && !(FrameGE 20)
    Stick 0 1
endif
if FrameGE 25 && !(FrameGE 26)
    Stick (-1)
    Button A
endif
if FrameGE 30
    Seek
endif
Return
var1=0
//____________________
label _1
if var1 < 1 && YDistFloor <= 25 && YDistFloor > 0 && YSpeed < 0
    var2=LevelValue/100
    if Rnd <= var2
        Button R
        Stick OPos (-0.5)
    endif
    var1=1
endif
if !(InAir)
    Finish
endif
Return
//____________________
label _2
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
    AbsStick (-1) (-1)
    Button R
endif
if FrameGE 18
    Seek _0
endif
Return
