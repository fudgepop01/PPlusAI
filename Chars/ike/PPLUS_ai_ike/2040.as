#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x80000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=0
if LevelValue > 55
    var3=-1
else
    var3=9999
endif
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
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
    if var3 < 0
        var5=YSpeed*20+YCoord
        var4=var1
        if NoOneHanging && !(CharDistLE 60)
            var4+=-5
        else
            var4+=10
        endif
        if var5 > var4
            var4=var1+50
            if var5 < var4
                var4=XSpeed*(-10)*Direction
                var5-=var1
                if NoOneHanging || var5 > 10
                    var4+=-45
                else
                    var4+=-25
                endif
                if DistFrontEdge > var4
                    if Rnd < 0.6
                        Seek _2
                        Jump
                    endif
                    var3=5
                endif
            endif
        endif
    else
        var3+=-1
    endif
    if var2 > 0
        var2+=-1
    elif !(InAirOnSaved)
        var6=(var0-XCoord)*Direction
        var4=var1+(-10)
        if YCoord < var4 && DistFrontEdge > -19
            var4=var1+(-25)
            if DistFrontEdge > -18 && DistFrontEdge < 5 && YCoord > var4 && Rnd < 0.7
                var2=8
                Return
            endif
            Goto _1
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
label
if !(InAir) || Falling
    Finish
endif
GetRndPointOnStage var0
if !(FrameGE 4)
    var4=var1+(-10)
    if YCoord < var4
        GetNearestCliff var0
    endif
endif
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
if FrameGE 24
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
var6=Direction
if var7 < 0
    var6*=-1
endif
Abs var7
if var7 > 5
    var7-=5
    var7/=5
    if var7 > 1
        var7=1
    endif
    var7*=var6
    Stick var7
endif
Return
//____________________
label _1
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 0.8
else
    AbsStick (-0.8)
endif
if !(DiceRollResult SSpecialAir)
    AbsStick 0 1
endif
Button B
Return
//____________________
label _2
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
Button B
if FrameGE 2
    Finish
endif
Return
Return
