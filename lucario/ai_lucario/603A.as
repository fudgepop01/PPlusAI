#include <Definition_AIMain.h>
//TrueID=0x603A
id 0x603A

//Set Unknown
unk 0x90000

//Strings

var0=1
var1=0.7
SetVec var2 Zero
if Rnd < 0.5
    var0+=0.5
endif
var4=var0+Func12+3
//____________________
label _0
var5=var1
if !(FrameGE var0)
    var5*=NumFrames
    var5/=var0
endif
Stick 0 var5
if FrameGE var0
    Button B
    Seek
endif
Return
//____________________
label
if FrameGE 2
    if Falling || Idling
        Finish
    endif
    if FrameGE 60
        Finish
    endif
endif
EstOPosVecR var2 var3 0.3
Norm var7 var2 var3
if var7 > 1
    var8=var2*Direction
    if var8 > 0
        if DistFrontEdge < 80
            var8=Rnd*(-0.25)
            Stick var8 1
            Return
        endif
    elif DistBackEdge < 80
        var8=Rnd*0.25
        Stick var8 1
        Return
    endif
    var2/=var7
    var3/=var7
    AbsStick var2 var3
else
    AbsStick 0 1
endif
Return
Return
