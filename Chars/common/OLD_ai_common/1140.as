#include <Definition_AIMain.h>
//TrueID=0x1140
id 0x1140

//Set Unknown
unk 0x70000

//Strings

AtkDiceRoll slot19
SetVec var0 Zero
var2=OPos
if InAir
    if NumJumps < 1.5
        Finish
    endif
    AtkDiceRoll 0x0
    SetTimeout 180
    Seek _0
    Jump
endif
SetTimeout 10
//____________________
label
if !(MeteoChance)
    Finish
endif
if !(Idling) && !(Dashing)
    Return
endif
SetTimeout 180
EstOPosVecR var0 var1 0.5
if var1 < 0
    Seek _1
    Jump
endif
if Dashing
    if DistToOEdge > 20
        var2=OPos
        Return
    endif
    Seek _2
    Jump
endif
if !(DiceRollResult Nothing) && DiceRollResult BAir && Rnd < 0.7
    Seek _2
    Jump
endif
AtkDiceRoll 0x0
Seek
Jump
Return
//____________________
label
var2=OPos*(-0.6)
AbsStick var2
var2=OPos
Seek
Return
//____________________
label _2
GetNearestCliff var4
if NumJumps < 2.5 && YSpeed < 0
    if NumJumps < 0.5
        Finish
    endif
    var6=YSpeed
    if IsCharOf Fox || IsCharOf Wolf
        var6*=2
    else
        var6*=30
    endif
    var6+=YCoord
    var6-=var5
    if var6 < -30
        Finish
    endif
endif
Goto _3
if !(FrameGE 8) && YCoord < OYCoord && XDistLE 10
    AbsStick 0
else
    AbsStick var2
endif
if FrameGE 10 && !(InAir)
    Finish
endif
if Falling
    if ODistLE 15
        if !(DiceRollResult Nothing)
            Call 
        else
            Call Unk1080
        endif
        Finish
    endif
endif
EstOPosVecR var0 var1 0.5
if !(FrameGE 10)
    if InAir || !(FrameGE 3) || var1 > 20
        Stick 0 1
    endif
endif
if FrameGE 10 && YSpeed < 0 && var1 > 10
    SetTimeout 180
    Seek
endif
Return
//____________________
label _0
Goto _3
AbsStick var2
if FrameGE 3
    Seek _2
endif
Return
//____________________
label _1
if !(MeteoChance)
    Finish
endif
AbsStick var2
if InAir
    Seek _2
endif
if FrameGE 50
    Finish
endif
Return
//____________________
label _3
if OPos > 0
    var2+=0.4
    if var2 > 1
        var2=1
    endif
else
    var2+=-0.4
    if var2 < -1
        var2=-1
    endif
endif
Return
Return
