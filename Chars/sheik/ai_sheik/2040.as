#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xC0000

//Strings
str "#sp_wait"

SetVec var0 Zero
var2=99
var3=1
var4=50
var5=20*Rnd-35
var6=BBoundary+10
if var5 < var6
    var5=var6
endif
//____________________
label
Goto _1
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif NumJumps > 0 && Falling
    Goto _2
    Seek _0
else
    var6=0
    if LevelValue < 40
        var6=(40-LevelValue)*(-0.015)
    endif
    if YSpeed < var6
        Seek
    endif
endif
Return
//____________________
label
Goto _1
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
if FrameGE 2
    if CharDistLE 10 && DistFrontEdge > -40 && LevelValue > 30
        Goto _2
        Seek
        Return
    endif
    if NoOneHanging
        var6=var1+(-20)
        if YCoord > var6
            var6=var1+10
            if YCoord < var6 && DistFrontEdge > -40 && DistFrontEdge < 1
                SetTimeout 6
                Seek _3
                Jump
            endif
        endif
    endif
    if !(InAirOnSaved)
        var1+=var5
        if YCoord < var1
            Goto _2
            Seek
            Return
        endif
        var1-=var5
        var1+=50
        if YCoord > var1 && DistFrontEdge > -20
            Goto _2
            Seek
            Return
        endif
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label _0
if Idling || Falling
    Finish
endif
GetNearestCliff var7
if YCoord > var8
    GetRndPointOnStage var7
endif
SubVector var7 ExactXCoord
Norm var9 var7 var8
if var9 > 1
    var7/=var9
    var8/=var9
    AbsStick var7 var8
elif OutOfStage
    AbsStick var7 1
else
    AbsStick var7 (-1)
endif
if FrameGE var4
    var3-=1
    if var3 < 0.5
        Finish
    else
        Goto _2
        SetFrame 0
    endif
endif
Return
//____________________
label _1
if !(InAir)
    Finish
endif
GetReturnGoal var0
var10=var0-XCoord
var11=Direction
if var10 < 0
    var11*=-1
endif
Abs var10
if var10 > 5
    var10-=5
    var10/=5
    if var10 > 1
        var10=1
    endif
    var10*=var11
    Stick var10
endif
Return
//____________________
label _2
ClearStick
AbsStick 0 1
Button B
Return
//____________________
label _3
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
Return
Return
