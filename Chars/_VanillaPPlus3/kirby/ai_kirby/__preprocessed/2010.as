#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x00000

//Strings
str "#hi_base"

SetVec var0 Zero
var2=GetAirHigh*(-1)
if NoOneHanging && LevelValue > 55
    var2+=-10
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
var6=LevelValue*0.01*Rnd-0.35
var3=LevelValue*0.01
if Rnd < var3
    var7=1
else
    var7=-1
endif
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
    var12=Rnd*70-20
    if var11 < var12
        var13=(var0-XCoord)*Direction
        if YCoord < var1 && var13 < 80
            var13=-1
        endif
        if LevelValue < 50
            var13=-1
        endif
        if OutOfStage && var13 > 0
            if YSpeed < -0.5
                Seek _0
                Return
            endif
        endif
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
if FrameGE 4
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
if FrameGE 4
    Stick 2 1
    if !(FrameGE 10)
        if YSpeed > 0
            Button A
        endif
    endif
    if FrameGE 30
        Finish
    endif
endif
Return
//____________________
label _1
if !(InAir)
    Finish
endif
GetReturnGoal var0
var14=var0-XCoord
var13=Direction
if var14 < 0
    var13*=-1
endif
Abs var14
if var14 > 5
    var15=1
    if NumJumps > 0 && XDistLE 100 && !(MeteoChance)
        var15=YCoord-var1
        if var15 <= var2
            var15=1
        elif YSpeed > -0.5 && var15 < 10
            var15=1
        elif var6 >= 0
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
    var14-=5
    var14/=5
    if var14 > 1
        var14=1
    endif
    var14*=var13*var15
    Stick var14
endif
Return
//____________________
label _2
Return
Return

