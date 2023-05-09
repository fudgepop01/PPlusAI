#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x70000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
Random var2
var3=20*Rnd
var4=LevelValue*0.004+0.25
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
Goto _1
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif NumJumps > 0 && Falling
    Goto _2
    Seek _0
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
Goto _1
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
if FrameGE 2
    if var2 < 0.4 && ODistLE 50
        if OInHigh || !(MeteoChance)
            Seek _3
            Return
        endif
    endif
    var4=var1+var3
    if !(InAirOnSaved) && YCoord < var4
        var4=var1+(-25)
        if DistFrontEdge > -18 && DistFrontEdge < 5 && YCoord > var4
            Return
        else
            Goto _2
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
label _0
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
label _1
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
label _2
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
label _3
ClearStick
if FrameGE 2
    Button B
    Finish
endif
Return
Return

