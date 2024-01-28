#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x60000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=20*Rnd
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
    var3=var1+var2
    if !(InAirOnSaved) && YCoord < var3 && DistFrontEdge > -40 && DistFrontEdge < 20
        var3=var1+(-20)
        if DistFrontEdge > -15 && DistFrontEdge < 10 && YCoord > var3 && YSpeed > -0.5
            Return
        else
            Goto _1
            Seek
        endif
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
    AbsStick 1
else
    AbsStick (-1)
endif
if FrameGE 10
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
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 0.8
else
    AbsStick (-0.8)
endif
GetNearestCliff var0
var3=(YSpeed*8+YCoord)-var1
if var3 < -20 || DistFrontEdge > -5
    AbsStick 0 1
endif
Button B
Return
Return
