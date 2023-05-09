#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x60000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=25*Rnd
var3=LevelValue*0.006+0.25
if Rnd < var3
    var2+=-25
else
    var2+=20
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
//____________________
label
Goto _1
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif NumJumps > 0 && Falling && !(SnakeUpB)
    Goto _2
    Seek _0
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
if !(Falling) || SnakeUpB
    if FrameGE 4
        Finish
    endif
    Return
endif
GetReturnGoal var0
if YCoord < var1 && DistFrontEdge < -30 && DistFrontEdge > 20
    if XSpeed > 1
        AbsStick (-1)
    elif XSpeed < -1
        AbsStick 1
    else
        var3=XSpeed*(-1)
        AbsStick var3
    endif
    var3=BBoundary+30
    if YCoord < var3
        var3=0
    else
        var3=XSpeed
        Abs var3
    endif
else
    Goto _1
    var3=0
endif
if FrameGE 2 && var3 < 0.5
    if DistFrontEdge < -40
        var3=var1+60
        if YCoord > var3
            Goto _2
            Seek
            Return
        endif
    endif
    var3=var1+var2
    if !(InAirOnSaved) && YCoord < var3
        var3=var1+(-30)
        if DistFrontEdge > -25 && DistFrontEdge < 5 && YCoord > var3
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
    if !(SnakeUpB)
        Finish
    endif
endif
GetRndPointOnStage var0
var3=var1
if YCoord < var3
    var3+=-25
    if YCoord < var3
        GetReturnGoal var0
    else
        GetNearestCliff var0
    endif
elif !(FrameGE 30) && YCoord > var3 && DistFrontEdge < -5
    var3+=30
    if YCoord < var3
        GetReturnGoal var0
        if XCoord < var0
            var0+=-30
        else
            var0+=30
        endif
    endif
endif
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
var3=DistFrontEdge
if var3 < 0 && var3 > 5
    var3=var1-YCoord-18
    Abs var3
    if var3 < 3
        AbsStick 0 1
    endif
endif
Return
//____________________
label _1
if !(InAir)
    Finish
endif
GetReturnGoal var0
var4=var0-XCoord
var5=Direction
if var4 < 0
    var5*=-1
endif
Abs var4
if var4 > 5
    var4-=5
    var4/=5
    if var4 > 1
        var4=1
    endif
    var4*=var5
    Stick var4
endif
Return
//____________________
label _2
ClearStick
AbsStick 0 1
Button B
Return
Return
