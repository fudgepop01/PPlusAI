#include <Definition_AIMain.h>
//TrueID=0x6048
id 0x6048

//Set Unknown
unk 0x00000

//Strings

SetVec var0 Zero
var2=2
//____________________
label _0
Stick 0 1
Button B
Seek
Return
//____________________
label
if FrameGE 2
    if Falling || !(InAir)
        Finish
    endif
    if FrameGE 35
        var2-=1
        if var2 < 0.5
            Finish
        endif
        SetFrame 0
    endif
endif
if OutOfStage
    if var2 < 1.5
        GetNearestCliff var0
    else
        GetReturnGoal var0
    endif
    if YCoord > var1
        GetRndPointOnStage var0
    endif
    SubVector var0 ExactXCoord
    Norm var3 var0 var1
    if var3 > 1
        var0/=var3
        var1/=var3
        AbsStick var0 var1
    else
        AbsStick var0 1
    endif
else
    EstOPosVecR var0 var1 0.3
    Norm var3 var0 var1
    if var3 > 1
        if var2 < 1.5
            var5=var0*Direction
            if var5 > 0
                if DistFrontEdge < 80
                    var5=Rnd*(-0.25)
                    Stick var5 (-1)
                    Return
                endif
            elif DistBackEdge < 80
                var5=Rnd*0.25
                Stick var5 (-1)
                Return
            endif
        endif
        var0/=var3
        var1/=var3
        AbsStick var0 var1
    elif var1 > 0
        AbsStick 0 1
    else
        AbsStick 0 (-1)
    endif
endif
Return
Return

