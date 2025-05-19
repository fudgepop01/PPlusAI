#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x00000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=20*Rnd
var3=LevelValue*0.007+0.25
if Rnd < var3
    if NoOneHanging
        var2+=-30
    else
        var2+=-15
    endif
else
    var2+=5
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
var4=0
if LevelValue > 30 && NoOneHanging
    var5=0.009*LevelValue
else
    var5=-1
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
    Goto _3
    var3=0
    if LevelValue < 40
        var3=(40-LevelValue)*(-0.015)
    endif
    if YSpeed < var3
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
    Goto _3
    var3=var1+(-20)
    if CharDistLE 15 && DistFrontEdge > -20 && YCoord > var3 && LevelValue > 30
        Goto _2
        Seek
        Return
    endif
    if var4 > 0
        var4+=-1
    elif !(InAirOnSaved)
        var3=var1+var2
        if YCoord < var3
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
if !(InAir) || Falling
    Finish
endif
GetRndPointOnStage var0
if !(FrameGE 4)
    var3=var1+(-10)
    if YCoord < var3
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
label _1
if !(InAir)
    Finish
endif
GetReturnGoal var0
var6=var0-XCoord
var7=Direction
if var6 < 0
    var7*=-1
endif
Abs var6
if var6 > 5
    var6-=5
    var6/=5
    if var6 > 1
        var6=1
    endif
    var6*=var7
    Stick var6
endif
Return
//____________________
label _2
ClearStick
GetNearestCliff var0
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
label _3
if var5 > 0 && NoOneHanging && DistFrontEdge > -32 && DistFrontEdge <= 0
    GetNearestCliff var8
    var3=var9+(-20)
    if YCoord > var3
        var3=var9+15
        if YCoord < var3
            var3=(var8-XCoord)*Direction
            if var3 > 0
                if Rnd < var5
                    Button R
                    Button A
                    Finish
                else
                    var5=-1
                endif
            endif
        endif
    endif
endif
Return
Return
