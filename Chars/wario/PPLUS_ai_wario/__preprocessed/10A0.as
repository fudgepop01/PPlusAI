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
Random var9
if FullCharge
    var9-=0.3
else
    var9+=0.45
endif
var9*=LevelValue*0.01
SetTimeout 600
var10=-1
//____________________
label
if DistToOEdge > var6 && !(InAir)
    var11=LevelValue*0.0099
    if Rnd < var11
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
    var12=40
else
    var12=15
endif
var11=Direction*OPos
if var11 < 0
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
    var13=0
    Seek
endif
Return
//____________________
label _2
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
if var9 < 0.5 && XDistLE 50 100 && !(Dashing)
    var11=ExactOYCoord-ExactYCoord
    if var11 < 30
        Stick 0 (-1)
        Button B
        Seek _7
        Return
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
    if LevelValue > 60 && DistToOEdge < 9 && DistToOEdge > 3.5 && !(OSFall)
        if var15 > 50
            if var10 < 0.5
                EstOPosVecR var7 var8 0.5
                if var8 < -10
                    if Falling
                        Button B
                        var10=2
                    endif
                elif var8 < 10
                    if Idling
                        var11=XSpeed
                        Abs var11
                        if var11 < 0.01
                            Button X
                            var10=2
                        endif
                    elif Falling
                        Button B
                        var10=2
                    endif
                endif
            else
                var10-=1
            endif
        endif
    endif
endif
if ONumJumps < 0.5 && DistToOEdge < 8 && LevelValue > 55
    EstOYCoord var11 20
    var11-=YCoord
    if var11 < -5
        if OIsCharOf Yoshi || OIsCharOf Ness || OIsCharOf Lucas || OIsCharOf Purin || OIsCharOf ZSS || OIsCharOf Pikmin || OIsCharOf Fushigisou || OIsCharOf Diddy
            var11=LevelValue*0.008
            if Rnd < var11
                Seek _8
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
        Seek _3
    elif var17 > 10
        Seek _4
    elif var17 > 0
        Seek _5
    else
        var11=OXSpeed
        Abs var11
        if var11 < 0.5 || DistFrontEdge > 20
            Seek _5
        elif LevelValue < 60
            Call Unk1050
        elif NoOneHanging && Rnd < 0.1
            SetTimeout 30
            AbsStick OPos
            Seek _6
        else
            Seek _5
        endif
    endif
endif
Return
//____________________
label _3
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
label _4
if !(MeteoChance)
    Finish
endif
if XDistLE var1
    Call Unk1140
    Finish
endif
Return
//____________________
label _5
AtkDiceRoll slot10
Cmd2F var19 var2
var11=var3*Rnd
var19+=var11
Seek
Jump
Return
//____________________
label
if !(MeteoChance)
    Finish
endif
var11=Direction*OPos
if var11 < 0
    var11=OPos*0.6
    AbsStick var11
    Return
endif
if XDistLE var19
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
label
if FrameGE 5
    AbsStick OPos
    Button B
    Finish
endif
Return
//____________________
label _6
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
label _7
if FrameGE 15
    Stick 1 0
else
    var11=ExactOYCoord-ExactYCoord
    if var11 > 5
        Stick 1 1
    elif var11 < -10
        Stick 1 (-1)
    endif
endif
if FrameGE 30
    var9=1
    Seek _2
endif
Return
//____________________
label _8
if !(MeteoChance)
    Finish
endif
var11=OYCoord-YCoord
if var11 > 1
    Finish
endif
var11=OPos*Direction
if var11 < 0
    var11=0.5*OPos
    AbsStick var11
    Return
endif
var11=XSpeed
Abs var11
if var11 < 0.01
    if var10 > 0
        var10-=1
    elif Idling || Falling
        if Rnd < 0.4 && Idling
            Button X
        else
            Button B
        endif
        var10=(100-LevelValue)*Rnd*0.5+4
    endif
endif
Return
Return

