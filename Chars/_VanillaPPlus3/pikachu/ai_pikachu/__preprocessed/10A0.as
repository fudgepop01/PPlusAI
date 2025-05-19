#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x00000

//Strings
str "#jump_start_f"
str "#meteo_range"
str "#atk_range_base"
str "#atk_range_rnd"
str "#dash_range"

var0=36
var1=55
var2=22
var3=10
var4=40
SetVec var5 Zero
SetTimeout 600
var7=-1
//____________________
label
if DistToOEdge > var4 && !(InAir)
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
    if LevelValue > 60 && DistToOEdge < 8 && !(OSFall)
        if var13 > 50
            if var7 < 0.5
                EstOPosVecR var5 var6 0.5
                if var6 < -10
                    if Falling
                        Button B
                        var7=2
                    endif
                elif var6 < 10
                    if Idling
                        var8=XSpeed
                        Abs var8
                        if var8 < 0.01
                            Button X
                            var7=2
                        endif
                    elif Falling
                        Button B
                        var7=2
                    endif
                endif
            else
                var7-=1
            endif
        endif
    endif
endif
if ONumJumps < 0.5 && DistToOEdge < 8 && LevelValue > 55
    EstOYCoord var8 20
    var8-=YCoord
    if var8 < -5
        if OIsCharOf Yoshi || OIsCharOf Ness || OIsCharOf Lucas || OIsCharOf Purin || OIsCharOf ZSS || OIsCharOf Pikmin || OIsCharOf Fushigisou || OIsCharOf Diddy
            var8=LevelValue*0.008
            if Rnd < var8
                Seek _6
                Return
            endif
        endif
    endif
endif
if var11 > 2.5 && Idling
    EstOYCoord var15 var13
    var15-=YCoord
    if var15 > 35 && LevelValue < 60
        Stick (-0.75)
        Seek _2
    elif var15 > 10 && LevelValue < 60
        Seek _3
    elif var15 > 0
        Seek _4
    else
        var8=OXSpeed
        Abs var8
        if var8 < 0.5 || DistFrontEdge > 20
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
    var16=OYCoord-YCoord
    if var16 > 10
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
var8=YCoord+10
if OYCoord > var8
    AtkDiceRoll 0x603B
else
    AtkDiceRoll slot10
endif
Cmd2F var17 var2
var8=var3*Rnd
var17+=var8
if DiceRollResult DSpecial
    var17+=15
endif
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
    if DiceRollResult DSpecial
        Call 
    endif
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
var8=OYCoord-YCoord
if var8 > 1
    Finish
endif
var8=OPos*Direction
if var8 < 0
    var8=0.5*OPos
    AbsStick var8
    Return
endif
var8=XSpeed
Abs var8
if var8 < 0.01
    if var7 > 0
        var7-=1
    elif Idling || Falling
        if Rnd < 0.9 && Idling
            Button X
        else
            Button B
        endif
        var7=(100-LevelValue)*Rnd*0.5+4
    endif
endif
Return
Return

