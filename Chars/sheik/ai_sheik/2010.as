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
if LevelValue > 30 && NoOneHanging
    var8=0.009*LevelValue
else
    var8=-1
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
    Goto _2
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
Goto _2
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
label _1
Return
//____________________
label _2
if var8 > 0 && NoOneHanging && DistFrontEdge > -48 && DistFrontEdge <= 0
    GetNearestCliff var16
    var3=XSpeed
    if var16 < XCoord
        var3*=-1
    endif
    if var3 > -0.2
        var3=var17+(-5)
        if YCoord > var3
            var3=var17+25
            if YCoord < var3
                var3=(var16-XCoord)*Direction
                if var3 > 0
                    if Rnd < var8
                        ClearStick
                        GetNearestCliff var0
                        if XCoord < var0
                            AbsStick 0.8
                        else
                            AbsStick (-0.8)
                        endif
                        Finish
                    else
                        var8=-1
                    endif
                endif
            endif
        endif
    endif
endif
Return
Return
