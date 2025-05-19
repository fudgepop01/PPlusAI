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
else
    var4=1
endif
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
    if CharDistLE 10 && DistFrontEdge > -40 && DistFrontEdge < -10 && YCoord > var1 && LevelValue > 30
        Goto _2
        Seek
        Return
    endif
    if !(InAirOnSaved)
        var6=var1+var5
        if YCoord < var6
            var6=var1+(-25)
            if DistFrontEdge > -15 && DistFrontEdge < 10 && YCoord > var6
                Return
            else
                Goto _2
                Seek
            endif
            Return
        endif
        if var4 < 0
            var6=var1+30
            if YCoord > var6
                var7=DistFrontEdge
                if var7 < -30 && var7 > -50
                    if Rnd < 0.7
                        Goto _2
                        Seek
                    endif
                    var4=1
                    Return
                endif
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
GetNearestCliff var8
if YCoord > var9
    GetRndPointOnStage var8
endif
SubVector var8 ExactXCoord
Norm var10 var8 var9
if var10 > 1
    var8/=var10
    var9/=var10
    AbsStick var8 var9
elif OutOfStage
    AbsStick var8 1
else
    AbsStick var8 (-1)
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
var11=var0-XCoord
var12=Direction
if var11 < 0
    var12*=-1
endif
Abs var11
if var11 > 5
    var11-=5
    var11/=5
    if var11 > 1
        var11=1
    endif
    var11*=var12
    Stick var11
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
Return

