#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x70000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
Random var2
var3=20*Rnd
var4=LevelValue*0.004+0.25
if Rnd < var4
    var3+=-30
else
    var3+=10
endif
var4=BBoundary+10
if var3 < var4
    var3=var4
endif
//____________________
label _0
var21=1
Goto _6
Goto _2
if FramesHitstun > 0
    Return
endif
var7=DistFrontEdge
var8=YDistFrontEdge
Abs var7
if var7 > 50 && var8 > -20
    Seek _4
elif var7 < 50 && var8 > 50 && NumJumps > 0.5
    Button X
    Return
elif NumJumps < 0.5 && var8 > 25
    Seek _3
endif
Return
//____________________
label _1
var21=2
if InAirOnSaved
    var10=1
else
    var10=0
endif
Goto _6
if !(InAir) || Falling
    Finish
endif
GetRndPointOnStage var0
if !(FrameGE 4)
    var4=var1+(-10)
    if YCoord < var4
        GetNearestCliff var0
    endif
endif
if XCoord < var0
    AbsStick 1
else
    AbsStick (-1)
endif
if FrameGE 24
    Finish
endif
Return
//____________________
label _2
if !(InAir)
    Finish
endif
GetReturnGoal var0
var5=var0-XCoord
var6=Direction
if var5 < 0
    var6*=-1
endif
Abs var5
if var5 > 5
    var5-=5
    var5/=5
    if var5 > 1
        var5=1
    endif
    var5*=var6
    Stick var5
endif
Return
//____________________
label _3
var21=4
ClearStick
GetRndPointOnStage var0
if XCoord < var0
    AbsStick 0.8
else
    AbsStick (-0.8)
endif
AbsStick 0 1
Button B
Seek _1
Return
//____________________
label _4
var21=5
Goto _6
Goto _2
if FramesHitstun > 0
    Return
endif
Button B
Seek _5
Return
//____________________
label _5
var21=6
Goto _6
var7=DistFrontEdge
var8=YDistFrontEdge
Abs var7
if var7 < 25 && var8 < 0
    Button B
    Seek _3
elif var7 < 6
    if NumJumps > 0.5 && Rnd > 0.4
        Button X
    else
        Button B
    endif
    Finish
endif
Return
//____________________
label _6
var10=YDistFloor
GetReturnGoal var11
GetNearestCliff var12
var13=DistFrontEdge
var14=YDistFrontEdge
var15=FramesHitstun
var16=CurrAction
var18=XCoord
var19=YCoord
var20=NumFrames
Return
