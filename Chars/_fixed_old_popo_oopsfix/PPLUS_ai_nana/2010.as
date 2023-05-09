#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x140000

//Strings
str "#hi_base"

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
//____________________
label
Goto _1
if NumJumps < 0.5 && FrameGE 4
    Finish
endif
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
var8=var1
var9=var1
var10=var1
var8+=var2
var9+=var4
var10+=var5
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    Goto _2
    var11=YCoord-var1
    var12=Rnd*10+30
    if YSpeed >= -1 && LevelValue >= 50 && var11 > var12 && OutOfStage && DistFrontEdge < -50
        SetTimeout 40
        Seek _0
        Return
    endif
    if YSpeed < 0
        if YCoord < var8
            Seek
        elif YCoord < var9
            if YCoord < var1 && DistFrontEdge > -50 && !(XDistLE 100)
                Seek
            elif YCoord > var10
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
Goto _1
Goto _2
if var6 < 0
    if YCoord > var1 && DistFrontEdge < -5 && DistFrontEdge > -20
        if Rnd < 0.2
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
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
Return
//____________________
label _1
if !(InAir)
    Finish
endif
GetReturnGoal var0
var13=var0-XCoord
var14=Direction
if var13 < 0
    var14*=-1
endif
Abs var13
if var13 > 5
    var15=1
    if NumJumps > 0 && XDistLE 100 && !(MeteoChance)
        var15=YCoord-var1
        if var15 <= var2
            var15=1
        elif YSpeed > -0.5 && var15 < 10
            var15=1
        elif var7 >= 0
            if DistFrontEdge > -52 && DistFrontEdge < -1
                if DistFrontEdge < -48
                    var15=0
                else
                    var15=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var15=1
            endif
        elif LevelValue > 45 && DistFrontEdge > -52 && DistFrontEdge < -15
            if var15 < var5
                if DistFrontEdge < -48
                    var15=0
                else
                    var15=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var15=1
            endif
        else
            var15=1
        endif
    endif
    var13-=5
    var13/=5
    if var13 > 1
        var13=1
    endif
    var13*=var14*var15
    Stick var13
endif
Return
//____________________
label _2
if Falling && !(InAirOnSaved) && DistFrontEdge > -40 && DistFrontEdge <= 0
    GetNearestCliff var16
    var3=(var16-XCoord)*XSpeed
    if var3 <= 0
        Return
    endif
    if DistFrontEdge > -20
        var3=var17+(-15)
        if YCoord < var3
            Return
        endif
    endif
    SetVec var18 XSpeed
    var3=5+var17
    if YCoord > var3
        var18*=10
        var19*=10
        var3+=-4
    else
        var18*=18
        var19*=12
    endif
    AddVector var18 XCoord
    if var19 > var3
        if XSpeed > 0
            if var18 > var16
                Button X
                Finish
            endif
        elif var18 < var16
            Button X
            Finish
        endif
    endif
endif
Return
var21=var20
var20/=var21
Return
