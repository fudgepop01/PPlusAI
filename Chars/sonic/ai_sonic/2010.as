#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x140000

//Strings
str "#hi_base"

SetVec var0 Zero
Random var2 0 15 60 50
var3=OGetAirHigh*(-1)
if NoOneHanging && LevelValue > 55
    var3+=-15
endif
var4=BBoundary+10
if var3 < var4
    var3=var4
endif
var4=40*Rnd
var3+=var4
var5=70
if Rnd < 0.3
    var6=10
else
    var6=(var5-10-var3)*LevelValue*0.01+var3
endif
var7=-1
var8=LevelValue*0.01*Rnd-0.35
var4=LevelValue*0.01
if Rnd < var4
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
var10+=var3
var11+=var5
var12+=var6
if FrameGE var2 && ODistLE 50
    if OInHigh || !(MeteoChance)
        Seek _1
        Return
    endif
endif
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
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
Goto _2
if FrameGE var2 && ODistLE 50
    if OInHigh || !(MeteoChance)
        Seek _1
        Return
    endif
endif
if var7 < 0
    if YCoord > var1 && DistFrontEdge < -5 && DistFrontEdge > -20
        if Rnd < 0.15
            Call EdgeRecover
            Finish
        else
            var7=1
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
        if var15 <= var3
            var15=1
        elif YSpeed > -0.5 && var15 < 10
            var15=1
        elif var8 >= 0
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
            if var15 < var6
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
ClearStick
if FrameGE 2
    Button B
    Finish
endif
Return
//____________________
label _2
Return
Return