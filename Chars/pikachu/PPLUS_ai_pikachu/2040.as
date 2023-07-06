#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xC0000

//Strings
str "#sp_wait"

SetVec var0 Zero
var2=99
var3=2
var4=20
var5=0
var6=30*Rnd-35
var7=BBoundary+10
if var6 < var7
    var6=var7
endif
//____________________
label
Goto _1
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    var8=YCoord-var1
    var9=Rnd*20+40
    if LevelValue >= 50 && var8 > var9 && OutOfStage && DistFrontEdge < -40
        if YSpeed < -0.1
            Seek _3
        endif
    elif NumJumps > 0 && Falling
        Goto _2
        Seek _0
    else
        var7=0
        if LevelValue < 40
            var7=(40-LevelValue)*(-0.015)
        endif
        if YSpeed < var7
            Seek
        endif
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
    if !(InAirOnSaved)
        var1+=var6
        if YCoord < var1
            Goto _2
            Seek
            Return
        endif
        var1-=var6
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
if var5 > 1.5
    AbsStick var2 (-1)
elif var5 > 0.5
    AbsStick var2
else
    AbsStick var2 1
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
if var2 > 1.5
    GetReturnGoal var0
    if YCoord > var1
        GetRndPointOnStage var0
    endif
    Random var10
    if var10 < 0.4
        var10=0
    else
        var10=var0-XCoord
    endif
else
    GetRndPointOnStage var0
    var10=var0-XCoord
    if !(OutOfStage)
        if var10 > 20
            var2=0.4
        elif var10 < -20
            var2=-0.4
        else
            var2=0
        endif
        var5=2
        Return
    elif var2 > 0.5
        if var10 > 0
            var10=0
        endif
    elif var2 > 0.3
        if var10 > -30
            var10=-30
        endif
    elif var2 < -0.5
        if var10 < 0
            var10=0
        endif
    elif var2 < -0.3
        if var10 < 30
            var10=30
        endif
    elif var10 > 0
        var10=100
    else
        var10=-100
    endif
endif
var1+=20
if YCoord > var1
    var5=1
    var10=var0-XCoord
    if var10 > 0.1
        var2=0.8
    elif var10 < -0.1
        var2=-0.8
    else
        var2=0
    endif
    var1+=30
    if YCoord > var1 && DistFrontEdge > -20
        var5=2
    endif
else
    var1-=20
    if var10 > 35
        var2=0.8
    elif var10 > 12
        var2=0.4
    elif var10 >= -12
        var2=0
    elif var10 >= -35
        var2=-0.4
    else
        var2=-0.8
    endif
endif
Return
//____________________
label _3
GetReturnGoal var0
if YCoord > var1
    GetRndPointOnStage var0
endif
if var0 > XCoord
    AbsStick 1
else
    AbsStick (-1)
endif
if FrameGE 2
    Button B
    Finish
endif
Return
Return
