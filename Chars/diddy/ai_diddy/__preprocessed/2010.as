#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x150000

//Strings
str "#hi_base"

SetVec var0 Zero
var2=OGetAirHigh*(-1)
if NoOneHanging && LevelValue > 55
    var2+=-12
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
var9=var1
var10=var1
var11=var1
var9+=var2
var10+=var4
var11+=var5
if !(Falling)
    if FrameGE 4
        Finish
    endif
elif DiddyCling && LevelValue >= 45 && ODistLE 15
    SetTimeout 40
    Seek _0
    Return
elif InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    Goto _2
    var12=YCoord-var1
    var13=Rnd*10+10
    if DiddyCling && LevelValue >= 60 && var12 > var13 && OutOfStage && DistFrontEdge < -40
        SetTimeout 40
        Seek _0
    endif
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
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
if !(FrameGE 2)
    Button B
elif Falling || !(InAir)
    Finish
endif
Return
//____________________
label _1
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
label _2
Return
Return

