#include <Definition_AIMain.h>
//TrueID=0x6
id 0x8006

//Set Unknown
unk 0x00000

//Strings

if PrevAction >= 117 && PrevAction <= 118
    Stick 1 1
    Finish
endif
if OIsOnStage < 1
    Finish
endif
if !(InAir) && NumJumps < 0.5
    Finish
endif
var0=OYCoord
var1=YCoord
var2=var1+7
var3=var1-7
if var0 <= var2 && var0 >= var3 && IsOnStage > 0 && XDistLE 3
    ClearStick
    Stick 0 (-1)
    Button B
    if HitboxConnected > 0
        Seek _0
    endif
endif
if FrameGE 60 || !(InAir)
    Finish
endif
Return
//____________________
label _0
if FrameGE 5 && !(FrameGE 6)
    Stick 0 1
endif
if FrameGE 7 && !(FrameGE 8) && Rnd >= 0.6
    Stick 0 (-1)
    Button A
elif FrameGE 7 && !(FrameGE 8) && Rnd < 0.6
    Stick (-1)
    Button A
endif
if FrameGE 13
    Finish
endif
Return

