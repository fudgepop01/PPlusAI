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
var10=55
var11=32
var12=10
var13=30
var14=80
var15=40
SetTimeout 600
LOGSTR 1157627904 0 0 0 0
//____________________
label
LOGSTR 1160655104 0 0 0 0
if DistToOEdge > var15 && !(InAir)
    var16=LevelValue*0.0099
    if Rnd < var16
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
LOGSTR 805306368 0 0 0 0
if Idling || Dashing
    // Call EdgeguardHub
    SetTimeout 600
    Seek
    Jump
endif
Return
//____________________
label _1
LOGSTR 822083584 0 0 0 0
if !(MeteoChance)
    Finish
endif
if OutOfStage
    if NumJumps > 0.5
        Call RecoveryHub
    else
        Call RecoveryHub
    endif
endif
if Dashing
    var17=40
else
    var17=15
endif
var9=Direction*OPos
if var9 < 0
    var16=OPos*0.9
    AbsStick var16
    Return
elif DistToOEdge > var17
    if DistToOEdge > 20
        AbsStick OPos
    else
        var16=OPos*0.5
        AbsStick var16
    endif
    Return
else
    var16=OYCoord-YCoord
    if Dashing && var16 < 50 && var16 > 0 && XDistLE var13 var14
        var16=0.006*LevelValue
        if Rnd < var16
            if Dashing
                AbsStick OPos
            endif
            // Call EdgeguardHub
            Finish
        endif
    endif
    var0=0
    Seek
endif
Return
//____________________
label
LOGSTR 825110784 0 0 0 0
if !(MeteoChance)
    Finish
endif
Cmd21
Seek
Return
//____________________
label
LOGSTR 825111040 0 0 0 0
if !(MeteoChance)
    Finish
endif
if ODistLE 30
    Call slot10
endif
if Idling
    if DistToOEdge > 10
        var16=0.5*OPos
        AbsStick var16
    elif DistToOEdge < 2
        var16=-1*OPos
        AbsStick var16
    else
        Call EdgeguardHub
        var16=OPos*Direction
        if var16 < 0
            var16=0.5*OPos
            AbsStick var16
        endif
    endif
endif
var1=OPos*15+XCoord
EstOPassTimeX var2 var1
if var2 < 0
    var2=9999
endif
if var2 < var0
    var0+=1
else
    var0=0
endif
if var0 > 2.5 && Idling
    // Call EdgeguardHub
    EstOYCoord var3 var2
    var3-=YCoord
    if var3 > 35
        Stick (-0.75)
        Seek _2
    elif var3 > 10
        Seek _3
    elif var3 > 0
        Seek _4
    else
        var16=OXSpeed
        Abs var16
        if var16 < 0.5 || DistFrontEdge > 20
            Seek _4
        elif LevelValue < 60
            Call EdgeguardHub
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
LOGSTR 838860800 0 0 0 0
Stick 0 1
if FrameGE 10
    Seek
endif
Return
//____________________
label
LOGSTR 841888000 0 0 0 0
if !(InAir) || NumJumps < 0.5
    Finish
endif
if ODistLE 35
    // Call EdgeguardHub
    Finish
endif
if !(FrameGE 3)
    Stick 0 1
endif
if YSpeed < 0
    var4=OYCoord-YCoord
    if var4 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _3
LOGSTR 855638016 0 0 0 0
if !(MeteoChance)
    Finish
endif
// Call EdgeguardHub
if XDistLE var10
    Finish
endif
Return
//____________________
label _4
LOGSTR 872415232 0 0 0 0
AtkDiceRoll slot10
Cmd2F var5 var11
var16=var12*Rnd
var5+=var16
Seek
Jump
Return
//____________________
label
LOGSTR 875442432 0 0 0 0

if !(MeteoChance)
    Finish
endif
var9=Direction*OPos
if var9 < 0
    var9=OPos*0.6
    AbsStick var9
    Return
endif
// Call EdgeguardHub
if XDistLE var5
    var16=OYCoord-ExactYCoord
    if var16 > 45
        Call DJNeutral
    elif var16 > 25
        Call slot5
    else
        Call
    endif
endif
Return
//____________________
label _5
LOGSTR 889192448 0 0 0 0
// Call EdgeguardHub
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
LOGSTR 892219648 0 0 0 0
// Call EdgeguardHub
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

