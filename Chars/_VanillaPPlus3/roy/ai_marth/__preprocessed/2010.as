#include <Definition_AIMain.h>
//TrueID=0x2010
id 0x2010

//Set Unknown
unk 0x00000

//Strings
str "#hi_base"

if PrevAction >= 117 && PrevAction <= 118
    Stick 1 1
    Finish
endif
if FramesHitstun < 1
    Seek
endif
Return
//____________________
label
if XCoord < var0
    AbsStick 0.8
else
    AbsStick (-0.8)
endif
if FrameGE 0 && !(FrameGE 1)
    Button B
endif
if FrameGE 32
    Seek
endif
Return
//____________________
label
GetRndPointOnStage var0
var1=1
var2=-2
if DistFrontEdge >= -15
    var1*=0
    var2*=0
endif
if XCoord < var0
    AbsStick var1
else
    AbsStick var2
endif
if !(OutOfStage)
    Button R
    Finish
endif
var5=Rnd*40
if FrameGE var5
    Seek
endif
Return
//____________________
label
var4=Rnd*30
Button X
if DistFrontEdge <= -20
    if XCoord < var0
        AbsStick var1
    else
        AbsStick var2
    endif
elif DistFrontEdge > 0
    var1*=-1
    var2*=-1
    if XCoord < var0
        AbsStick var1
    else
        AbsStick var2
    endif
endif
if FrameGE var4
    Call EdgeRecover
endif
Return
//____________________
label _0
if FrameGE 2 && !(FrameGE 3)
    Button A
    Finish
endif
Return

