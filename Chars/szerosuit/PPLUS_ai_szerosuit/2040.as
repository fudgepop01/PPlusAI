#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x60000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
var2=0
if LevelValue > 55
    var3=-1
else
    var3=9999
endif
var12=Rnd*30+5
//____________________
label
Goto _3
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
else
    var4=0
    if LevelValue < 40
        var4=(40-LevelValue)*(-0.015)
    endif
    if YSpeed < var4
        Seek
    endif
endif
Return
//____________________
label
Goto _3
Goto _0
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
if NoOneHanging || NumJumps > 0.5
    var10=120
    var11=80
elif !(NoOneHanging) || !(NumJumps > 0.5)
    var10=60
    var11=40
endif
if YDistFrontEdge > var12 && XDistFrontEdge <= 25
    Stick 0 1
    Button B
    Seek _1
endif
Return
//____________________
label
Goto _3
if !(InAir) || Falling
    Finish
endif
var0=OYCoord
var1=YCoord
var2=var1+20
var3=var1-20
if var0 <= var2 && var0 >= var3 && IsOnStage < 1 && XDistLE 10 && !(YDistFrontEdge > 25)
    Stick 1
    Button A
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
label _0
if !(InAir)
    Finish
endif
var0=OYCoord
var1=YCoord
var2=var1+20
var3=var1-20
if var0 <= var2 && var0 >= var3 && IsOnStage < 1 && XDistLE 10 && !(YDistFrontEdge > 25)
    Stick 1
    Button A
endif
GetReturnGoal var0
var7=var0-XCoord
var6=Direction
if var7 < 0
    var6*=-1
endif
Abs var7
if var7 > 5
    var7-=5
    var7/=5
    if var7 > 1
        var7=1
    endif
    var7*=var6
    Stick var7
endif
Return
//____________________
label _1
Goto _3
ClearStick
Return
//____________________
label _2
GetNearestCliff var7
if YCoord > var8
    GetRndPointOnStage var7
endif
if !(CanJump) && Falling
    Goto _0
endif
SubVector var7 ExactXCoord
Norm var9 var7 var8
if var9 > 1
    var7/=var9
    var8/=var9
    AbsStick var7 var8
elif OutOfStage
    AbsStick var7 1
else
    AbsStick var7 (-1)
endif
Return
//____________________
label _3
var13=XDistFrontEdge
var14=YDistFrontEdge
var15=FramesHitstun
var16=CurrAction
var18=XCoord
var19=YCoord
var20=NumFrames
Return
