#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xA0000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
if LevelValue > 45 && NoOneHanging
    var2=LevelValue*0.006+0.3
else
    var2=0
endif
if Rnd < var2
    var3=8*Rnd-45
else
    var3=10*Rnd-20
endif
var2=BBoundary+10
if var3 < var2
    var3=var2
endif
if LevelValue > 55
    var4=-1
else
    var4=1
endif
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    var2=0
    if LevelValue < 40
        var2=(40-LevelValue)*(-0.015)
    endif
    if YSpeed < var2
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
if FrameGE 2
    if CharDistLE 10 && DistFrontEdge > -30 && LevelValue > 30
        Goto _1
        Seek
        Return
    endif
    if !(InAirOnSaved)
        var2=var1+var3
        if YCoord < var2
            Goto _1
            Seek
            Return
        endif
        if LevelValue > 45 && OutOfStage
            var5=YCoord-var1
            var6=Rnd*10+20
            if YSpeed >= -1 && var5 > var6 && DistFrontEdge < -40
                SetTimeout 40
                var4=30*Rnd+10
                Seek _2
                Return
            endif
            if var4 < 0
                var2=var1+20
                if YCoord > var2
                    var7=DistFrontEdge
                    var2=var1+30
                    if YCoord < var2 && var7 > -40
                        if Rnd < 0.6
                            SetTimeout 40
                            Seek _2
                            var4=15*Rnd
                            Return
                        endif
                        var4=1
                    endif
                endif
            endif
        endif
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label
if !(InAir) || Falling
    Finish
endif
GetRndPointOnStage var0
if !(FrameGE 4)
    var2=var1+(-10)
    if YCoord < var2
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
GetReturnGoal var0
var8=var0-XCoord
var9=Direction
if var8 < 0
    var9*=-1
endif
Abs var8
if var8 > 5
    var8-=5
    var8/=5
    if var8 > 1
        var8=1
    endif
    var8*=var9
    Stick var8
endif
Return
//____________________
label _1
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 0.8
else
    AbsStick (-0.8)
endif
if !(DiceRollResult SSpecialAir)
    AbsStick 0 1
endif
Button B
Return
//____________________
label _2
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
if FrameGE var4 || !(InAir)
    Finish
else
    Button B
endif
Return
Return
