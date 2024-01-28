#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x150000

//Strings
str "#hi_base"

SetVec var0 Zero
var2=GetAirHigh*(-1)
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
if LevelValue > 55
    var8=-1
else
    var8=9999
endif
var3=LevelValue*0.01
if Rnd < var3
    var9=1
else
    var9=-1
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
var10=var1
var11=var1
var12=var1
var10+=var2
var11+=var4
var12+=var5
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    Goto _1
    if var8 < 0
        var13=YSpeed*20+YCoord
        var3=var1
        if NoOneHanging && !(CharDistLE 60)
            var3+=-5
        else
            var3+=10
        endif
        if var13 > var3
            var3=var1+50
            if var13 < var3
                var3=XSpeed*(-10)*Direction
                var13-=var1
                if NoOneHanging || var13 > 10
                    var3+=-45
                else
                    var3+=-25
                endif
                if DistFrontEdge > var3
                    if Rnd < 0.3
                        Seek _2
                        Jump
                    endif
                    var8=5
                endif
            endif
        endif
    else
        var8+=-1
    endif
    if YSpeed < 0
        if YCoord < var10
            Seek
        elif YCoord < var11
            if YCoord < var1 && DistFrontEdge > -50 && !(XDistLE 100)
                Seek
            elif YCoord > var12
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
var14=var0-XCoord
var15=Direction
if var14 < 0
    var15*=-1
endif
Abs var14
if var14 > 5
    var16=1
    if NumJumps > 0 && XDistLE 100 && !(MeteoChance)
        var16=YCoord-var1
        if var16 <= var2
            var16=1
        elif YSpeed > -0.5 && var16 < 10
            var16=1
        elif var7 >= 0
            if DistFrontEdge > -52 && DistFrontEdge < -1
                if DistFrontEdge < -48
                    var16=0
                else
                    var16=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var16=1
            endif
        elif LevelValue > 45 && DistFrontEdge > -52 && DistFrontEdge < -15
            if var16 < var5
                if DistFrontEdge < -48
                    var16=0
                else
                    var16=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var16=1
            endif
        else
            var16=1
        endif
    endif
    var14-=5
    var14/=5
    if var14 > 1
        var14=1
    endif
    var14*=var15*var16
    Stick var14
endif
Return
//____________________
label _1
if Falling && var9 > 0 && !(InAirOnSaved) && DistFrontEdge > -40 && DistFrontEdge <= 0
    GetNearestCliff var17
    var3=(var17-XCoord)*XSpeed
    if var3 <= 0
        Return
    endif
    if DistFrontEdge > -20
        var3=var18+(-15)
        if YCoord < var3
            Return
        endif
    endif
    SetVec var19 XSpeed
    var3=5+var18
    if YCoord > var3
        var19*=10
        var20*=10
        var3+=-4
    else
        var19*=18
        var20*=12
    endif
    AddVector var19 XCoord
    if var20 > var3
        if XSpeed > 0
            if var19 > var17
                Button R
                Finish
            endif
        elif var19 < var17
            Button R
            Finish
        endif
    endif
endif
Return
//____________________
label _2
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 2
else
    AbsStick (-2)
endif
Button B
if FrameGE 2
    Finish
endif
Return
Return
