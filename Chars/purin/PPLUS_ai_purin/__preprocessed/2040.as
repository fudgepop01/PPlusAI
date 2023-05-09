#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x60000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=40*Rnd-10
var3=BBoundary+10
if var2 < var3
    var2=var3
endif
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif YSpeed < 0 || NumJumps > 0
    Seek
endif
Return
//____________________
label
Goto _0
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
if FrameGE 2
    if CharDistLE 15 && DistFrontEdge > -30 && LevelValue > 30
        Goto _1
        Seek
        Return
    endif
    var1+=var2
    if !(InAirOnSaved) && YCoord < var1
        Goto _1
        Seek
        Return
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label
if !(InAir) || Falling
    Finish
endif
GetRndPointOnStage var0
if !(FrameGE 4)
    var3=var1+(-10)
    if YCoord < var3
        GetNearestCliff var0
    endif
endif
if XCoord < var0
    AbsStick 1 1
else
    AbsStick (-1) 1
endif
if FrameGE 24
    Finish
endif
Return
//____________________
label _0
if !(InAir)
    Finish
endif
GetReturnGoal var0
var4=var0-XCoord
var5=Direction
if var4 < 0
    var5*=-1
endif
Abs var4
if var4 > 5
    var4-=5
    var4/=5
    if var4 > 1
        var4=1
    endif
    var4*=var5
    Stick var4
endif
Return
//____________________
label _1
ClearStick
GetNearestCliff var0
if XCoord < var0
    AbsStick 0 1
else
    AbsStick 0 1
endif
if !(DiceRollResult SSpecialAir)
    AbsStick 0 1
endif
Button R
Return
Return

