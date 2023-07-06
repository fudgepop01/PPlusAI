#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0xD0000

//Strings
str "#jump_start_f"
str "#atk_range_base"
str "#atk_range_rnd"
str "#dash_range"

var0=40
var1=26
var2=12
var3=40
SetTimeout 600
//____________________
label
if DistToOEdge > var3 && !(InAir)
    var4=LevelValue*0.0099
    if Rnd < var4
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
    var5=40
else
    var5=15
endif
var6=Direction*OPos
if var6 < 0
    var4=OPos*0.5
    AbsStick var4
    Return
elif DistToOEdge > var5
    if DistToOEdge > 40
        AbsStick OPos
    else
        var4=OPos*0.5
        AbsStick var4
    endif
    Return
else
    var7=0
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
        var4=0.5*OPos
        AbsStick var4
    elif DistToOEdge < 3
        var4=-0.5*OPos
        AbsStick var4
    else
        var4=OPos*Direction
        if var4 < 0
            var4=0.5*OPos
            AbsStick var4
        endif
    endif
endif
var8=OPos*15+XCoord
EstOPassTimeX var9 var8
if var9 < 0
    var9=9999
endif
if var9 < var0
    var7+=1
else
    var7=0
endif
if var7 > 2.5 && Idling
    EstOYCoord var10 var9
    var10-=YCoord
    if var10 > 35
        Stick (-0.75)
        Seek _2
    elif var10 > 0
        Seek _3
    else
        var4=OXSpeed
        Abs var4
        if var4 < 0.5 || DistFrontEdge > 20
            Seek _3
        elif LevelValue < 60
            Call Unk1050
        else
            Seek _3
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
    var11=OYCoord-YCoord
    if var11 > 10
        SetFrame 0
    endif
endif
Return
//____________________
label _3
AtkDiceRoll slot10
Cmd2F var12 var1
var4=var2*Rnd
var12+=var4
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var6=Direction*OPos
if var6 < 0
    var6=OPos*0.6
    AbsStick var6
    Return
endif
if XDistLE var12
    var4=OYCoord-ExactYCoord
    if var4 > 45
        Call DJNeutral
    elif var4 > 25
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
