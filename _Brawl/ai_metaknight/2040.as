#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x70000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=20*Rnd
var3=LevelValue*0.006+0.3
if Rnd < var3
    if NoOneHanging
        var2+=-30
    else
        var2+=-10
    endif
else
    var2+=5
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
var4=0
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
Goto _0
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
if FrameGE 2
    var3=var1+(-20)
    if CharDistLE 15 && DistFrontEdge > -20 && YCoord > var3 && LevelValue > 30
        Goto _1
        Seek
        Return
    endif
    if var4 > 0
        var4+=-1
    elif !(InAirOnSaved)
        var3=var1+var2
        if YCoord < var3
            var3=var1+(-25)
            if DistFrontEdge > -18 && DistFrontEdge < 5 && YCoord > var3 && Rnd < 0.7
                var4=8
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
label _2
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
if YCoord < var1
    AbsStick 0 1
else
    var3=var1+40
    if YCoord < var3
        AbsStick 0 (-1)
    endif
endif
if FrameGE 40
    Finish
endif
Return
//____________________
label _0
if !(InAir)
    Finish
endif
GetReturnGoal var0
var5=var0-XCoord
var6=Direction
if var5 < 0
    var6*=-1
endif
Abs var5
if var5 > 5
    var5-=5
    var5/=5
    if var5 > 1
        var5=1
    endif
    var5*=var6
    Stick var5
endif
Return
//____________________
label _1
ClearStick
GetNearestCliff var0
if DiceRollResult SSpecialAir
    if XCoord < var0
        AbsStick 1
    else
        AbsStick (-1)
    endif
elif DiceRollResult USpecialAir
    AbsStick 0 1
else
    AbsStick 0 (-1)
endif
Button B
Return
Return