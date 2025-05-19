#include <Definition_AIMain.h>
//TrueID=0x603A
id 0x603A

//Set Unknown
unk 0x00000

//Strings

var0=6
var1=0.7
SetVec var2 Zero
var4=2
if Rnd < 0.5
    var0+=0.5
endif
var5=var0+RandXOffset+3
//____________________
label _0
var6=var1
if !(FrameGE var0)
    var6*=NumFrames
    var6/=var0
endif
Stick 0 var6
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
    if FrameGE 35
        var4-=1
        if var4 < 0.5
            Finish
        endif
        SetFrame 0
    endif
endif
if OutOfStage
    if var4 < 1.5
        GetNearestCliff var2
    else
        GetReturnGoal var2
    endif
    if YCoord > var3
        GetRndPointOnStage var2
    endif
    SubVector var2 ExactXCoord
    Norm var7 var2 var3
    if var7 > 1
        var2/=var7
        var3/=var7
        AbsStick var2 var3
    else
        AbsStick var2 1
    endif
else
    EstOPosVecR var2 var3 0.3
    Norm var7 var2 var3
    if var7 > 1
        if var4 < 1.5
            var9=var2*Direction
            if var9 > 0
                if DistFrontEdge < 80
                    var9=Rnd*(-0.25)
                    Stick var9 1
                    Return
                endif
            elif DistBackEdge < 80
                var9=Rnd*0.25
                Stick var9 1
                Return
            endif
        endif
        var2/=var7
        var3/=var7
        AbsStick var2 var3
    else
        AbsStick 0 1
    endif
endif
Return
Return

