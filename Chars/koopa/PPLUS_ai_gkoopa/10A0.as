#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0xE0000

//Strings
str "#jump_start_f"
str "#meteo_range"
str "#atk_range_base"
str "#atk_range_rnd"
str "#dash_range"

var0=36
var1=55
var2=27
var3=10
var4=40
SetTimeout 600
//____________________
label
if DistToOEdge > var4 && !(InAir)
    var5=LevelValue*0.0099
    if Rnd < var5
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
    var6=40
else
    var6=15
endif
var7=Direction*OPos
if var7 < 0
    var5=OPos*0.5
    AbsStick var5
    Return
elif DistToOEdge > var6
    if DistToOEdge > 40
        AbsStick OPos
    else
        var5=OPos*0.5
        AbsStick var5
    endif
    Return
else
    var8=0
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
        var5=0.5*OPos
        AbsStick var5
    elif DistToOEdge < 3
        var5=-0.5*OPos
        AbsStick var5
    else
        var5=OPos*Direction
        if var5 < 0
            var5=0.5*OPos
            AbsStick var5
        endif
    endif
endif
var9=OPos*15+XCoord
EstOPassTimeX var10 var9
if var10 < 0
    var10=9999
endif
if var10 < var0
    var8+=1
else
    var8=0
endif
if var8 > 2.5 && Idling
    EstOYCoord var11 var10
    var11-=YCoord
    if var11 > 35
        Stick (-0.75)
        Seek _2
    elif var11 > 0
        if Rnd < 0.15
            Seek _3
        else
            Seek _4
        endif
    else
        var5=OXSpeed
        Abs var5
        if var5 < 0.5 || DistFrontEdge > 20
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
    var12=OYCoord-YCoord
    if var12 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _3
if !(MeteoChance)
    Finish
endif
if XDistLE var1
    Call Unk1140
    Finish
endif
Return
//____________________
label _4
AtkDiceRoll slot10
Cmd2F var13 var2
var5=var3*Rnd
var13+=var5
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var7=Direction*OPos
if var7 < 0
    var7=OPos*0.6
    AbsStick var7
    Return
endif
if XDistLE var13
    var5=OYCoord-ExactYCoord
    if var5 > 45
        Call DJNeutral
    elif var5 > 25
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
