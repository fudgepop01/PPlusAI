#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x60000

//Strings

SetVec var0 Zero
var2=20*Rnd
var3=LevelValue*0.004+0.25
if Rnd < var3
    var2+=-30
else
    var2+=10
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
//____________________
label
Goto _0
var1+=20
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif YCoord > var1 && YSpeed < 0.1 && YSpeed > -0.1
    var4=(var0-XCoord)*Direction
    if OutOfStage && var4 > 50 && LevelValue >= 50
        Seek _2
        Return
    endif
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
    if !(InAirOnSaved)
        var3=var1+var2
        if !(InAirOnSaved) && YCoord < var3
            var3=var1+(-25)
            if DistFrontEdge > -18 && DistFrontEdge < 5 && YCoord > var3
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
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
endif
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
    AbsStick 1 1
else
    AbsStick (-1) 1
endif
if FrameGE 24 && YSpeed < 0
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
var4=Direction
if var5 < 0
    var4*=-1
endif
Abs var5
if var5 > 5
    var5-=5
    var5/=5
    if var5 > 1
        var5=1
    endif
    var5*=var4
    Stick var5
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
Return
//____________________
label _2
Goto _0
if FrameGE 2
    Stick 2
    Button B
    Finish
endif
Return
Return