#include <Definition_AIMain.h>
//TrueID=0x603A
id 0x603A

//Set Unknown
unk 0xA0000

//Strings
str "#wait_f"

var0=2
var1=0
var2=1
var3=1
SetVec var4 Zero
if Rnd < 0.5
    var2+=0.5
endif
var6=var2
if ODistLE 40
    var6+=2
    var7=OYCoord-YCoord
    if var7 > 30
        var6+=12
    endif
else
    var7=8*Rnd
    var6+=6+var7
    if !(ODistLE 70)
        var6+=30
    endif
endif
//____________________
label _0
var8=var3
if !(FrameGE var2)
    var8*=NumFrames
    var8/=var2
endif
Stick 0 var8
if FrameGE var2
    if var1 < 1
        Button B
        var1=1
    else
        EstOPosVecR var4 var5 0.7
        if var4 < 0.1 && var4 > -0.1
            var4=0.1
        endif
        var7=var5/var4
        Abs var7
        if var7 < 0.5
            AbsStick OPos
        elif var7 > 4 && FrameGE 6
            var7=Direction*(-1)
            AbsStick var7
        endif
        if !(FrameGE var6)
            Button B
        endif
    endif
    if FrameGE 10
        if Idling || Falling || InAir
            Finish
        endif
    endif
endif
Return
Return
