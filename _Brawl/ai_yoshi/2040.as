#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xC0000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=25*Rnd
var3=LevelValue*0.007+0.25
if Rnd < var3 && NoOneHanging
    var2+=-15
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
var4=0
var3=LevelValue*0.01
if Rnd < var3
    var5=1
else
    var5=-1
endif
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    Goto _1
    if YSpeed < 0
        var3=var1+(-40)
        if YCoord < var3
            if FrameGE 8
                Finish
            endif
            Return
        endif
    endif
    if NumJumps > 0 && Falling
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
    Goto _1
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
if FrameGE 2 && !(FrameGE 4)
    ClearStick
    AbsStick 0 1
    Button B
elif XCoord < var0
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
label _1
if Falling && var5 > 0 && !(InAirOnSaved) && DistFrontEdge > -40 && DistFrontEdge <= 0
    GetNearestCliff var8
    var3=(var8-XCoord)*XSpeed
    if var3 <= 0
        Return
    endif
    if DistFrontEdge > -20
        var3=var9+(-15)
        if YCoord < var3
            Return
        endif
    endif
    SetVec var10 XSpeed
    var3=5+var9
    if YCoord > var3
        var10*=15
        var11*=15
        var3+=-4
    else
        var10*=18
        var11*=12
    endif
    AddVector var10 XCoord
    if var11 > var3
        if XSpeed > 0
            if var10 > var8
                Button R
                Finish
            endif
        elif var10 < var8
            Button R
            Finish
        endif
    endif
endif
Return
Return
