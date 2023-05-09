#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0xF0000

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
SetTimeout 600
//____________________
label
if DistToOEdge > var5 && !(InAir)
    var6=LevelValue*0.0099
    if Rnd < var6
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
    var7=40
else
    var7=15
endif
var8=Direction*OPos
if var8 < 0
    var6=OPos*0.5
    AbsStick var6
    Return
elif DistToOEdge > var7
    if DistToOEdge > 40
        AbsStick OPos
    else
        var6=OPos*0.5
        AbsStick var6
    endif
    Return
else
    var6=OYCoord-YCoord
    if Dashing && var6 < 80 && var6 > -50 && XDistLE var3 var4
        var6=0.006*LevelValue
        if Rnd < var6
            if Dashing
                AbsStick OPos
            endif
            Call Unk1140
            Finish
        endif
    endif
    var9=0
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
        var6=0.5*OPos
        AbsStick var6
    elif DistToOEdge < 3
        var6=-0.5*OPos
        AbsStick var6
    else
        var6=OPos*Direction
        if var6 < 0
            var6=0.5*OPos
            AbsStick var6
        endif
    endif
endif
var10=OPos*15+XCoord
EstOPassTimeX var11 var10
if var11 < 0
    var11=9999
endif
if var11 < var0
    var9+=1
else
    var9=0
endif
if var9 > 2.5 && Idling
    EstOYCoord var12 var11
    var12-=YCoord
    if var12 > 10 || ONumJumps > 0.5
        Call Unk1140
        Finish
    elif var12 > 0
        Seek _3
    else
        Random var6
        if var6 < 0.5
            Call Unk1140
            Finish
        else
            var6=OXSpeed
            Abs var6
            if var6 < 0.5 || DistFrontEdge > 20
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
    var13=OYCoord-YCoord
    if var13 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _3
AtkDiceRoll slot10
Cmd2F var14 var1
var6=var2*Rnd
var14+=var6
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var8=Direction*OPos
if var8 < 0
    var8=OPos*0.6
    AbsStick var8
    Return
endif
if XDistLE var14
    var6=OYCoord-ExactYCoord
    if var6 > 45
        Call DJNeutral
    elif var6 > 25
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

