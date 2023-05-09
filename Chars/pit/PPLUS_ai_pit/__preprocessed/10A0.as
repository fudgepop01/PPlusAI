#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x120000

//Strings
str "#jump_start_f"
str "#atk_range_base"
str "#atk_range_rnd"
str "#quick_range1"
str "#quick_range2"
str "#dash_range"

var0=60
var1=22
var2=10
var3=30
var4=100
var5=40
SetVec var6 Zero
SetTimeout 600
//____________________
label
if DistToOEdge > var5 && !(InAir)
    var8=LevelValue*0.0099
    if Rnd < var8
        SetTimeout 10
        Seek _0
        if Dashing
            Jump
        endif
        Return
    endif
endif
Seek _1
Jump
Return
//____________________
label _0
if Idling || Dashing
    SetTimeout 600
    Seek
    Jump
endif
Return
//____________________
label _1
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
    var9=40
else
    var9=15
endif
var10=Direction*OPos
if var10 < 0
    var8=OPos*0.5
    AbsStick var8
    Return
elif DistToOEdge > var9
    if DistToOEdge > 40
        AbsStick OPos
    else
        var8=OPos*0.5
        AbsStick var8
    endif
    Return
else
    var8=OYCoord-YCoord
    if Dashing && var8 < 80 && var8 > -50 && XDistLE var3 var4
        var8=0.006*LevelValue
        if Rnd < var8
            if Dashing
                AbsStick OPos
            endif
            Call Unk1140
            Finish
        endif
    endif
    var11=0
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
        var8=0.5*OPos
        AbsStick var8
    elif DistToOEdge < 3
        var8=-0.5*OPos
        AbsStick var8
    else
        var8=OPos*Direction
        if var8 < 0
            var8=0.5*OPos
            AbsStick var8
        endif
    endif
endif
var12=OPos*15+XCoord
EstOPassTimeX var13 var12
if var13 < 0
    var13=9999
endif
if var13 < var0
    var11+=1
else
    var11=0
    if LevelValue > 60 && DistToOEdge < 9 && DistToOEdge > 3.5 && !(OSFall)
        if var13 > 60 && !(XDistLE 60)
            EstOPosVecR var6 var7 0.5
            if Idling && var7 < 50 && var7 > -50
                Call NSpecial
                Finish
            endif
        endif
    endif
endif
if var11 > 2.5 && Idling
    EstOYCoord var15 var13
    var15-=YCoord
    if var15 > 10 || ONumJumps > 0.5
        Call Unk1140
        Finish
    elif var15 > 0
        Seek _3
    else
        Random var8
        if var8 < 0.5
            Call Unk1140
            Finish
        else
            var8=OXSpeed
            Abs var8
            if var8 < 0.5 || DistFrontEdge > 20
                Seek _3
            elif LevelValue < 60
                Call Unk1050
            elif NoOneHanging && Rnd < 0.1
                SetTimeout 30
                AbsStick OPos
                Seek _4
            else
                Seek _3
            endif
        endif
    endif
endif
Return
//____________________
label _2
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
    var16=OYCoord-YCoord
    if var16 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _3
AtkDiceRoll slot10
Cmd2F var17 var1
var8=var2*Rnd
var17+=var8
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var10=Direction*OPos
if var10 < 0
    var10=OPos*0.6
    AbsStick var10
    Return
endif
if XDistLE var17
    var8=OYCoord-ExactYCoord
    if var8 > 45
        Call DJNeutral
    elif var8 > 25
        Call slot5
    else
        Call 
    endif
endif
Return
//____________________
label _4
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

