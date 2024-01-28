#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x90000

//Strings

SetVec var0 Zero
var2=0
var3=15*Rnd
var4=LevelValue*0.006+0.3
if Rnd < var4
    var3+=-30
else
    var3+=10
endif
var4=BBoundary+10
if var3 < var4
    var3=var4
endif
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif NumJumps > 0 && Falling
    Goto _1
    Seek _2
else
    var4=0
    if LevelValue < 40
        var4=(40-LevelValue)*(-0.015)
    endif
    if YSpeed < var4
        Seek
    endif
endif
Return
//____________________
label
Goto _0
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
if FrameGE 2
    var4=var1+var3
    if !(InAirOnSaved) && YCoord < var4
        var4=var1+(-30)
        if CharDistLE 40 && YCoord > var4
            Return
        endif
        var4=var1+(-25)
        if DistFrontEdge > -20 && DistFrontEdge < 10 && YCoord > var4
            Return
        else
            Goto _1
            Seek
        endif
        Return
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label _2
if !(InAir)
    Finish
endif
GetReturnGoal var5
GetRndPointOnStage var0
if YCoord < var6
    if var5 > var0
        SetVec var0 var5
        var0+=20
    else
        SetVec var0 var5
        var0+=-20
    endif
endif
if XCoord < var0
    var2+=0.09
    if var2 > 1
        var2=1
    endif
else
    var2+=-0.09
    if var2 < -1
        var2=-1
    endif
endif
var1+=10
if YCoord < var1
    AbsStick var2 1
else
    AbsStick var2
endif
if FrameGE 180
    Finish
endif
Return
//____________________
label _0
if !(InAir)
    Finish
endif
GetReturnGoal var0
var7=var0-XCoord
var8=Direction
if var7 < 0
    var8*=-1
endif
Abs var7
if var7 > 5
    var7-=5
    var7/=5
    if var7 > 1
        var7=1
    endif
    var7*=var8
    Stick var7
endif
Return
//____________________
label _1
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 1 1
else
    AbsStick (-1) 1
endif
Button B
var2=0
Return
Return
