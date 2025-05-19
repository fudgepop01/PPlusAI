#include <Definition_AIMain.h>
//TrueID=0x2041
id 0x2041

//Set Unknown
unk 0x00000

//Strings
str "#sp_wait"

if FramesHitstun < 1
    Seek
endif
Return
//____________________
label
Goto _0
if FrameGE 0 && !(FrameGE 3) && XDistFrontEdge <= 60 && !(YDistFrontEdge <= -60) && !(YDistFrontEdge >= 60) || FrameGE 0 && !(FrameGE 3) && XDistBackEdge <= 60 && !(YDistBackEdge < -60) && !(YDistBackEdge > 60)
    Stick 0 1
    Button B
    Seek
else
    Finish
endif
Return
//____________________
label
Goto _0
if YCoord <= 10 && YCoord >= -10
    if XCoord > 0
        var15=-1
    elif XCoord < 0
        var15=1
    endif
    AbsStick var15
    Button B
elif YCoord < -10 && !(YCoord < -20)
    var0=0.5
elif YCoord > 10 && !(YCoord > 20)
    var0=-0.5
elif YCoord < -20
    var0=1
elif YCoord > 20
    var0=-1
endif
var1=1
if XDistFrontEdge < 10 || XDistBackEdge < 10
    var1*=0.5
elif XDistFrontEdge >= 10 && !(XDistFrontEdge > 25) || XDistBackEdge >= 10 && !(XDistBackEdge > 25)
    var1*=0.5
endif
if XCoord > 0
    var1*=1
elif XCoord < 0
    var1*=1
endif
if YCoord > 0
    Stick var1 var0
else
    Stick var1 var0
endif
if FrameGE 43 && Falling
    Finish
endif
Return
//____________________
label _0
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
