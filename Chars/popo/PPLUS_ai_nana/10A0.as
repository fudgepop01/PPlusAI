#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x140000

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
SetVec var7 Zero
SetTimeout 600
var9=-1
//____________________
label
if DistToOEdge > var6 && !(InAir)
    var10=LevelValue*0.0099
    if Rnd < var10
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
    var11=40
else
    var11=15
endif
var12=Direction*OPos
if var12 < 0
    var10=OPos*0.5
    AbsStick var10
    Return
elif DistToOEdge > var11
    if DistToOEdge > 40
        AbsStick OPos
    else
        var10=OPos*0.5
        AbsStick var10
    endif
    Return
else
    var10=OYCoord-YCoord
    if Dashing && var10 < 50 && var10 > 0 && XDistLE var4 var5
        var10=0.006*LevelValue
        if Rnd < var10
            if Dashing
                AbsStick OPos
            endif
            Call Unk1140
            Finish
        endif
    endif
    var13=0
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
        var10=0.5*OPos
        AbsStick var10
    elif DistToOEdge < 3
        var10=-0.5*OPos
        AbsStick var10
    else
        var10=OPos*Direction
        if var10 < 0
            var10=0.5*OPos
            AbsStick var10
        endif
    endif
endif
var14=OPos*15+XCoord
EstOPassTimeX var15 var14
if var15 < 0
    var15=9999
endif
if var15 < var0
    var13+=1
else
    var13=0
    if LevelValue > 60 && DistToOEdge < 8 && !(OSFall)
        if var15 > 50
            if var9 < 0.5
                EstOPosVecR var7 var8 0.5
                if var8 < -10
                    if Falling
                        Button B
                        var9=2
                    endif
                elif var8 < 10
                    if Idling
                        var10=XSpeed
                        Abs var10
                        if var10 < 0.01
                            Button X
                            var9=2
                        endif
                    elif Falling
                        Button B
                        var9=2
                    endif
                endif
            else
                var9-=1
            endif
        endif
    endif
endif
if ONumJumps < 0.5 && DistToOEdge < 8 && LevelValue > 55
    EstOYCoord var10 20
    var10-=YCoord
    if var10 < -5
        if OIsCharOf Yoshi || OIsCharOf Ness || OIsCharOf Lucas || OIsCharOf Purin || OIsCharOf ZSS || OIsCharOf Pikmin || OIsCharOf Fushigisou || OIsCharOf Diddy
            var10=LevelValue*0.008
            if Rnd < var10
                Seek _6
                Return
            endif
        endif
    endif
endif
if var13 > 2.5 && Idling
    EstOYCoord var17 var15
    var17-=YCoord
    if var17 > 35
        Stick (-0.75)
        Seek _2
    elif var17 > 10
        Seek _3
    elif var17 > 0
        Seek _4
    else
        var10=OXSpeed
        Abs var10
        if var10 < 0.5 || DistFrontEdge > 20
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
    var18=OYCoord-YCoord
    if var18 > 10
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
Cmd2F var19 var2
var10=var3*Rnd
var19+=var10
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var12=Direction*OPos
if var12 < 0
    var12=OPos*0.6
    AbsStick var12
    Return
endif
if XDistLE var19
    var10=OYCoord-ExactYCoord
    if var10 > 45
        Call DJNeutral
    elif var10 > 25
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
//____________________
label _6
if !(MeteoChance)
    Finish
endif
var10=OYCoord-YCoord
if var10 > 1
    Finish
endif
var10=OPos*Direction
if var10 < 0
    var10=0.5*OPos
    AbsStick var10
    Return
endif
var10=XSpeed
Abs var10
if var10 < 0.01
    if var9 > 0
        var9-=1
    elif Idling || Falling
        if Rnd < 0.4 && Idling
            Button X
        else
            Button B
        endif
        var9=(100-LevelValue)*Rnd*0.5+4
    endif
endif
Return
Return
