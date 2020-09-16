#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x0

//Strings
str "#hi_base"

Call RecoveryHub

SetVec var0 Zero
var11=Func23*(-1)
if NoOneHanging && LevelValue > 55
    var11+=-15
endif
var12=BBoundary+10
if var11 < var12
    var11=var12
endif
var12=40*Rnd
var11+=var12
var13=70
if Rnd < 0.3
    var14=10
else
    var14=(var13-10-var11)*LevelValue*0.01+var11
endif
var15=-1
var16=LevelValue*0.01*Rnd-0.35
var12=LevelValue*0.01
if Rnd < var12
    var17=1
else
    var17=-1
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
var9=var10
var0=var10
var1=var10
var9+=var11
var0+=var13
var1+=var14
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    Goto _1
    if YSpeed < 0
        if YCoord < var9
            Seek
        elif YCoord < var0
            if YCoord < var10 && DistFrontEdge > -50 && !(XDistLE 100)
                Seek
            elif YCoord > var1
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
if var15 < 0
    if YCoord > var10 && DistFrontEdge < -5 && DistFrontEdge > -20
        if Rnd < 0.15
            Call EdgeRecover
            Finish
        else
            var15=1
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
GetNearestCliffR var0
var2=var0-XCoord
var3=Direction
if var2 < 0
    var3*=-1
endif
Abs var2
if var2 > 5
    var4=1
    if NumJumps > 0 && XDistLE 100 && !(MeteoChance)
        var4=YCoord-var10
        if var4 <= var11
            var4=1
        elif YSpeed > -0.5 && var4 < 10
            var4=1
        elif var16 >= 0
            if DistFrontEdge > -52 && DistFrontEdge < -1
                if DistFrontEdge < -48
                    var4=0
                else
                    var4=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var4=1
            endif
        elif LevelValue > 45 && DistFrontEdge > -52 && DistFrontEdge < -15
            if var4 < var14
                if DistFrontEdge < -48
                    var4=0
                else
                    var4=(50+DistFrontEdge)*(-0.02)-0.4
                endif
            else
                var4=1
            endif
        else
            var4=1
        endif
    endif
    var2-=5
    var2/=5
    if var2 > 1
        var2=1
    endif
    var2*=var3*var4
    Stick var2
endif
Return
//____________________
label _1
Return
Return
