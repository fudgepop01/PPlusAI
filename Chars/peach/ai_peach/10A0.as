#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x100000

//Strings
str "#jump_start_f"
str "#meteo_range"
str "#atk_range_base"
str "#atk_range_rnd"
str "#quick_range1"
str "#quick_range2"
str "#dash_range"

var0=36
var1=85
var2=22
var3=10
var4=30
var5=100
var6=40
SetTimeout 600
//____________________
label
if DistToOEdge > var6 && !(InAir)
    var7=LevelValue*0.0099
    if Rnd < var7
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
    var8=40
else
    var8=15
endif
var9=Direction*OPos
if var9 < 0
    var7=OPos*0.5
    AbsStick var7
    Return
elif DistToOEdge > var8
    if DistToOEdge > 40
        AbsStick OPos
    else
        var7=OPos*0.5
        AbsStick var7
    endif
    Return
else
    var7=OYCoord-YCoord
    if Dashing && var7 < 50 && var7 > 0 && XDistLE var4 var5
        var7=0.006*LevelValue
        if Rnd < var7
            if Dashing
                AbsStick OPos
            endif
            Call Unk1140
            Finish
        endif
    endif
    var10=0
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
        var7=0.5*OPos
        AbsStick var7
    elif DistToOEdge < 3
        var7=-0.5*OPos
        AbsStick var7
    else
        var7=OPos*Direction
        if var7 < 0
            var7=0.5*OPos
            AbsStick var7
        endif
    endif
endif
var11=OPos*15+XCoord
EstOPassTimeX var12 var11
if var12 < 0
    var12=9999
endif
if var12 < var0
    var10+=1
else
    var10=0
endif
if var10 > 2.5 && Idling
    EstOYCoord var13 var12
    var13-=YCoord
    if var13 > 30
        Stick (-0.75)
        Seek _2
    elif var13 > 25
        Seek _4
    elif var13 > 5
        Stick (-0.75)
        Seek _3
    elif var13 > 0
        Seek _4
    else
        var7=OXSpeed
        Abs var7
        if var7 < 0.5 || DistFrontEdge > 20
            Seek _4
        elif LevelValue < 60
            Call Unk1050
        elif NoOneHanging && Rnd < 0.1
            SetTimeout 30
            AbsStick OPos
            Seek _5
        else
            Seek _4
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
    var14=OYCoord-YCoord
    if var14 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _3
if !(MeteoChance)
    Finish
endif
if OXSpeed > 1
    if OXCoord > XCoord
        Return
    endif
elif OXSpeed < -1
    if OXCoord < XCoord
        Return
    endif
endif
if XDistLE var1
    Call Unk1140
    Finish
endif
Return
//____________________
label _4
AtkDiceRoll slot10
Cmd2F var15 var2
var7=var3*Rnd
var15+=var7
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var9=Direction*OPos
if var9 < 0
    var9=OPos*0.6
    AbsStick var9
    Return
endif
if XDistLE var15
    var7=OYCoord-ExactYCoord
    if var7 > 45
        Call DJNeutral
    elif var7 > 25
        Call slot5
    else
        Call 
    endif
endif
Return
//____________________
label _5
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
