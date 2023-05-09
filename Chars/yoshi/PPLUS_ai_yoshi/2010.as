#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x130000

//Strings
str "#hi_base"

SetVec var0 Zero
var2=OGetAirHigh*(-1)
if NoOneHanging && LevelValue > 55
    var2+=-10
endif
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
var3=40*Rnd
var2+=var3
var4=80
var5=10
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
elif FrameGE 2
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
Return
Return
