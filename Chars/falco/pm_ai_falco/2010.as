#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x130000

//Strings
str "#hi_base"

var19=XDistFrontEdge
var20=YDistFrontEdge
Norm var21 var19 var20
if var19 > 115 && YDistFrontEdge < 50
    Stick (-1) 0
    Button B
endif
if PrevAction >= 117 && PrevAction <= 118
    Call JumpOnStage3
endif
SetVec var0 Zero
var2=OGetAirHigh*(-1)
if NoOneHanging && LevelValue > 55
    var2+=-15
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
var3=40*Rnd
var2+=var3
var4=70
if Rnd < 0.3
    var5=10
else
    var5=(var4-10-var2)*LevelValue*0.01+var2
endif
var6=-1
var7=LevelValue*0.01*Rnd-0.35
var3=LevelValue*0.01
if Rnd < var3
    var8=1
else
    var8=-1
endif
//____________________
label
Goto _0
if NumJumps < 0.5 && FrameGE 4
    Finish
endif
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
var9=var1
var10=var1
var11=var1
var9+=var2
var10+=var4
var11+=var5
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    Goto _1
    if YSpeed < 0
        if YCoord < var9
            Seek
        elif YCoord < var10
            if YCoord < var1 && DistFrontEdge > -50 && !(XDistLE 100)
                Seek
            elif YCoord > var11
                if DistFrontEdge < -50
                    Seek
                endif
            elif !(NoOneHanging) && DistFrontEdge > -15
                Seek
            endif
        endif
    endif
endif
Return
//____________________
label
Goto _0
Goto _1
if var6 < 0
    if YCoord > var1 && DistFrontEdge < -5 && DistFrontEdge > -20
        if Rnd < 0.15
            Call EdgeRecover
            Finish
        else
            var6=1
        endif
    endif
endif
if FrameGE 3
    if !(InAirOnSaved)
        Stick 0 1
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label _0
if !(InAir)
    Finish
endif
GetReturnGoal var0
var12=var0-XCoord
var13=Direction
if var12 < 0
    var13*=-1
endif
Abs var12
if var12 > 5
    var14=1
    if NumJumps > 0 && XDistLE 100 && !(MeteoChance)
        var14=YCoord-var1
        if var14 <= var2
            var14=1
        elif YSpeed > -0.5 && var14 < 10
            var14=1
        elif var7 >= 0
            if DistFrontEdge > -52 && DistFrontEdge < -1
                if DistFrontEdge < -48
                    var14=0
                else
                    var14=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var14=1
            endif
        elif LevelValue > 45 && DistFrontEdge > -52 && DistFrontEdge < -15
            if var14 < var5
                if DistFrontEdge < -48
                    var14=0
                else
                    var14=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var14=1
            endif
        else
            var14=1
        endif
    endif
    var12-=5
    var12/=5
    if var12 > 1
        var12=1
    endif
    var12*=var13*var14
    Stick var12
endif
Return
//____________________
label _1
if Falling && var8 > 0 && !(InAirOnSaved) && DistFrontEdge > -40 && DistFrontEdge <= 0
    GetNearestCliff var15
    var3=(var15-XCoord)*XSpeed
    if var3 <= 0
        Return
    endif
    if DistFrontEdge > -20
        var3=var16+(-15)
        if YCoord < var3
            Return
        endif
    endif
    SetVec var17 XSpeed
    var3=5+var16
    if YCoord > var3
        var17*=10
        var18*=10
        var3+=-4
    else
        var17*=18
        var18*=12
    endif
    AddVector var17 XCoord
    if var18 > var3
        if XSpeed > 0
            if var17 > var15
                Finish
            endif
        elif var17 < var15
            Finish
        endif
    endif
endif
Return
Return
