#include <Definition_AIMain.h>
//TrueID=0x6049
id 0x6049

//Set Unknown
unk 0x00000

//Strings

var0=0
SetVec var1 Zero
var3=0
var4=10*Rnd+3
if Rnd < 0.5
    var4+=70
endif
//____________________
label
if !(InAir)
    Finish
endif
if var0 < 1
    Button B
    var0=Func13
    var3*=0.6
else
    var0-=1
    GetRndPointOnStage var1
    if XCoord < var1
        var3+=0.2
        if var3 > 1
            var3=1
        endif
    else
        var3+=-0.2
        if var3 < -1
            var3=-1
        endif
    endif
endif
AbsStick var3 (-1)
if FrameGE var4
    Call Unk1080
    Finish
endif
Return
Return
