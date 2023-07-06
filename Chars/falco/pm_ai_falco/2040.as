#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xF0000

//Strings
str "#sp_wait"

if PrevAction >= 117 && PrevAction <= 118
    Stick 1 1
    Finish
endif
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
if NoOneHanging || NumJumps > 0.5
    var10=120
    var11=80
elif !(NoOneHanging) || !(NumJumps > 0.5)
    var10=60
    var11=40
endif
if XCoord > 0
    var15=-1
elif XCoord < 0
    var15=1
endif
if YDistFrontEdge > 11 && !(YDistFrontEdge > 16) && XDistFrontEdge <= 80 || YDistBackEdge > 11 && !(YDistBackEdge > 16) && XDistBackEdge <= 80
    AbsStick var15
    Button B
elif YDistFrontEdge > 60 && XDistFrontEdge <= 65 || YDistBackEdge > 60 && XDistBackEdge <= 65
    Stick 0 1
    Button B
    Seek _2
elif YDistFrontEdge > 35 && XDistFrontEdge > 65 && !(XDistFrontEdge >= 100) || YDistBackEdge > 35 && XDistBackEdge > 65 && !(XDistBackEdge >= 100)
    Stick 0 1
    Button B
    Seek _2
elif YDistFrontEdge > 15 && XDistFrontEdge > 100 || YDistBackEdge > 15 && XDistBackEdge > 100
    Stick 0 1
    Button B
    Seek _2
endif
Return
//____________________
label
if !(InAir) || Falling
    Finish
endif
var0=OYCoord
var1=YCoord
var2=var1+20
var3=var1-20
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
var0=OYCoord
var1=YCoord
var2=var1+20
var3=var1-20
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
Return
//____________________
label _2
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
Return
