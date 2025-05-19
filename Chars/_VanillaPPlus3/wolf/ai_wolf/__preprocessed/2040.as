#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x00000

//Strings
str "#sp_wait"

SetVec var0 Zero
var2=1
var3=50
if LevelValue > 55
    var4=-1
    var5=-1
else
    var4=1
    var5=1
endif
var6=15*Rnd-30
var7=BBoundary+10
if var6 < var7
    var6=var7
endif
var8=30*Rnd
if NoOneHanging
    var8+=35
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
    var7=0
    if LevelValue < 40
        var7=(40-LevelValue)*(-0.01)
    endif
    if YSpeed < var7
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
    if !(InAirOnSaved)
        var7=var1+var6
        if YCoord < var7
            var7=LevelValue*0.008
            if Rnd < var7 && NoOneHanging
                Seek _4
            else
                Goto _2
                Seek
            endif
            Return
        endif
        var7=var1+10
        if YCoord > var7
            var9=DistFrontEdge
            if var4 < 0
                var7=var1+30
                if YCoord < var7 && var9 > -40
                    if DistTop > 75 && Rnd < 0.6
                        Goto _3
                        Seek
                    endif
                    var4=1
                    Return
                endif
            endif
            if var5 < 0
                var7=var1+30
                if YCoord > var7 && var9 < -30 && var9 > -50
                    if Rnd < 0.4
                        Goto _2
                        Seek
                    endif
                    var5=1
                    Return
                endif
            endif
        else
            GetNearestCliff var10
            SubVector var10 ExactXCoord
            Norm var12 var10 var11
            if NoOneHanging && var12 > 60 && var12 < 70
                if Rnd < 0.5
                    Seek _4
                endif
                var4=1
                var5=1
                Return
            endif
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
GetNearestCliff var10
if YCoord > var11
    GetRndPointOnStage var10
else
    var7=var11+(-40)
    var9=DistFrontEdge
    if var9 < -8 && var9 > -20 && YCoord < var7
        if var10 > XCoord
            var10+=8
        else
            var10+=-8
        endif
    endif
    if NoOneHanging
        var7=var11+(-20)
        if YCoord < var11
            var11+=-5
        endif
    else
        var11+=20
    endif
endif
SubVector var10 XCoord
Norm var12 var10 var11
if var12 > 1
    var10/=var12
    var11/=var12
    if var11 < 0 && var11 > -0.4 && DistTop < 75 && DistFrontEdge > -30
        if OutOfStage
            var11=1
        else
            var10*=0.5
            var11=-1
        endif
    endif
    AbsStick var10 var11
elif OutOfStage
    AbsStick var10 1
else
    AbsStick var10 (-1)
endif
if FrameGE var3
    var2-=1
    if var2 < 0.5
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
var13=var0-XCoord
var14=Direction
if var13 < 0
    var14*=-1
endif
Abs var13
if var13 > 5
    var13-=5
    var13/=5
    if var13 > 1
        var13=1
    endif
    var13*=var14
    Stick var13
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
if var0 > XCoord
    AbsStick 1
else
    AbsStick (-1)
endif
Button B
Return
//____________________
label _4
Goto _1
var7=BBoundary+10
GetNearestCliff var10
SubVector var10 ExactXCoord
Norm var12 var10 var11
if var12 > var8 || Rnd < 0.01 || YCoord < var7 || !(NoOneHanging)
    Goto _2
    Seek _0
endif
Return
Return

