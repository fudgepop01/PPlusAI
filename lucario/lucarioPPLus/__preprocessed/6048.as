#include <Definition_AIMain.h>
//TrueID=0x6048
id 0x6048

//Set Unknown
unk 0x50000

//Strings

SetVec var0 Zero
//____________________
label _0
Stick 0 1
Button B
Seek
Return
//____________________
label
if FrameGE 2
    if FrameGE 60 || Falling || !(InAir)
        Finish
    endif
endif
if OutOfStage
    GetNearestCliff var0
    if YCoord > var1
        GetRndPointOnStage var0
    endif
    SubVector var0 ExactXCoord
    Norm var2 var0 var1
    if var2 > 1
        var0/=var2
        var1/=var2
        AbsStick var0 var1
    else
        AbsStick var0 1
    endif
else
    EstOPosVecR var0 var1 0.3
    Norm var2 var0 var1
    if var2 > 1
        var4=var0*Direction
        if var4 > 0
            if DistFrontEdge < 80
                var4=Rnd*(-0.25)
                Stick var4 (-1)
                Return
            endif
        elif DistBackEdge < 80
            var4=Rnd*0.25
            Stick var4 (-1)
            Return
        endif
        var0/=var2
        var1/=var2
        AbsStick var0 var1
    elif var1 > 0
        AbsStick 0 1
    else
        AbsStick 0 (-1)
    endif
endif
Return
Return

