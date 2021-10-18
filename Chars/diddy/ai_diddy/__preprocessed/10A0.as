#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x150000

//Strings
str "#jump_start_f"
str "#meteo_range"
str "#atk_range_base"
str "#atk_range_rnd"
str "#quick_range1"
str "#quick_range2"
str "#dash_range"

var0=36
var1=55
var2=22
var3=10
var4=30
var5=80
var6=40
SetTimeout 600
var7=-1
SetVec var8 Zero
var10=0
//____________________
label
if LevelValue > 50 && DiddyBanana && DistToOEdge > 40 && DistToOEdge < 90 && !(InAir)
    var11=LevelValue*0.004
    if Rnd < var11
        if DistToOEdge > 60
            var10=-1
        else
            var10=0
        endif
        SetTimeout 20
        Seek _0
        Jump
    endif
endif
Seek _1
Jump
Return
//____________________
label _0
var11=Direction*OPos
if var11 < 0
    var10+=-0.125
    if var10 <= -1 && Idling
        Stick 0 (-1)
        Button B
        SetTimeout 50
        Seek _2
    else
        Stick 0 var10
    endif
else
    var11=OPos*(-0.5)
    AbsStick var11
endif
Return
//____________________
label _1
if DistToOEdge > var6 && !(InAir)
    var11=LevelValue*0.0099
    if Rnd < var11
        SetTimeout 10
        Seek _2
        if Dashing
            Jump
        endif
        Return
    endif
endif
Seek _3
Jump
Return
//____________________
label _2
if Idling || Dashing
    SetTimeout 600
    Seek
    Jump
endif
Return
//____________________
label _3
if !(MeteoChance)
    Finish
endif
if OutOfStage
    if NumJumps > 0.5
        Call JumpOnStage
    else
        Call EdgeRecover
    endif
endif
if Dashing
    var12=40
else
    var12=15
endif
var13=Direction*OPos
if var13 < 0
    var11=OPos*0.5
    AbsStick var11
    Return
elif DistToOEdge > var12
    if DistToOEdge > 40
        AbsStick OPos
    else
        var11=OPos*0.5
        AbsStick var11
    endif
    Return
else
    var11=OYCoord-YCoord
    if Dashing && var11 < 50 && var11 > 0 && XDistLE var4 var5
        var11=0.006*LevelValue
        if Rnd < var11
            if Dashing
                AbsStick OPos
            endif
            Call Unk1140
            Finish
        endif
    endif
    var14=0
    Seek
endif
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
WaitForGroundCanAct
Seek
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
if ODistLE 30
    Call slot10
endif
if Idling
    if DistToOEdge > 10
        var11=0.5*OPos
        AbsStick var11
    elif DistToOEdge < 3
        var11=-0.5*OPos
        AbsStick var11
    else
        var11=OPos*Direction
        if var11 < 0
            var11=0.5*OPos
            AbsStick var11
        endif
    endif
endif
var15=OPos*15+XCoord
EstOPassTimeX var16 var15
if var16 < 0
    var16=9999
endif
if var16 < var0
    var14+=1
else
    var14=0
    if LevelValue > 60 && DistToOEdge < 9 && DistToOEdge > 3.5 && !(OSFall)
        if var16 > 60
            if var7 < 0.5
                EstOPosVecR var8 var9 0.5
                if Idling && var9 < 20 && var9 > -40
                    AtkDiceRoll slot2
                    if DiceRollResult NSpecial
                        Call 
                        Finish
                    endif
                    AtkDiceRoll 0x0
                    var7=4
                endif
            else
                var7-=1
            endif
        endif
    endif
endif
if var14 > 2.5 && Idling
    EstOYCoord var18 var16
    var18-=YCoord
    if var18 > 35
        Stick (-0.75)
        Seek _4
    elif var18 > 10
        Seek _5
    elif var18 > 0
        Seek _6
    else
        var11=OXSpeed
        Abs var11
        if var11 < 0.5 || DistFrontEdge > 20
            Seek _6
        elif LevelValue < 60
            Call Unk1050
        elif NoOneHanging && Rnd < 0.1
            SetTimeout 30
            AbsStick OPos
            Seek _7
        else
            Seek _6
        endif
    endif
endif
Return
//____________________
label _4
Stick 0 1
if FrameGE 10
    Seek
endif
Return
//____________________
label
if !(InAir) || NumJumps < 0.5
    Finish
endif
if ODistLE 35
    Call Unk1080
    Finish
endif
if !(FrameGE 3)
    Stick 0 1
endif
if YSpeed < 0
    var19=OYCoord-YCoord
    if var19 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _5
if !(MeteoChance)
    Finish
endif
if XDistLE var1
    Call Unk1140
    Finish
endif
Return
//____________________
label _6
AtkDiceRoll slot10
Cmd2F var20 var2
var11=var3*Rnd
var20+=var11
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var13=Direction*OPos
if var13 < 0
    var13=OPos*0.6
    AbsStick var13
    Return
endif
if XDistLE var20
    var11=OYCoord-ExactYCoord
    if var11 > 45
        Call DJNeutral
    elif var11 > 25
        Call slot5
    else
        Call 
    endif
endif
Return
//____________________
label _7
if !(MeteoChance) || FrameGE 50
    Finish
endif
Stick 1
if InAir
    Seek
endif
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
if FrameGE 2
    Stick (-1)
    if FrameGE 6
        Finish
    endif
else
    AbsStick OPos
endif
Return
Return

