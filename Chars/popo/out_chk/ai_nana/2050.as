#include <Definition_AIMain.h>
//TrueID=0x2050
id 0x2050

//Set Unknown
unk 0x0

//Strings

//____________________
label
if FramesHitstun > 0
    if KBAngle > 0 && KBAngle < 10
        Goto _0
    elif KBAngle > 170 && KBAngle < 180
        Goto _0
    elif KBYSpeed < 0 && IsOnStage < 1
        Goto _1
    elif KBSpeed < 3
        Goto _2
    else
        Goto _3
    endif
endif
if Idling || YDistFloor < 0
    Finish
endif
if TotalYSpeed < 0 && FramesSinceShield > 40
    if FramesHitlag >= 2
        Return
    endif
    var0=TotalYSpeed*(-1)+30
    if YDistFloor > 0 && YDistFloor < var0
        ClearStick
        var0=Rnd
        if var0 < 0.33
            var0=1
        elif var0 < 0.66
            var0=-1
        else
            var0=0
        endif
        if var0 > 0 && DistFrontEdge < 15
            if DistBackEdge < 15
                var0=0
            else
                var0=-1
            endif
        elif var0 < 0 && DistBackEdge < 15
            if DistFrontEdge < 15
                var0=0
            else
                var0=1
            endif
        endif
        Stick var0 (-1)
        Button R
    endif
endif
Return
//____________________
label _0
var0=KBYSpeed
var1=KBXSpeed*(-1)
if var1 > 0
    var0*=-1
    var1*=-1
endif
Norm var2 var0 var1
if var2 > 0
    var0/=var2
    var1/=var2
endif
AbsStick var0 var1
Return
//____________________
label _1
GetNearestCliff var0
SubVector var0 XCoord
var1=KBYSpeed
var2=KBXSpeed*(-1)
var3=var1*var0
if var3 < 0
    var1*=-1
    var2*=-1
endif
Norm var3 var1 var2
if var3 > 0
    var1/=var3
    var2/=var3
endif
AbsStick var1 var2
Return
//____________________
label _2
var0=KBYSpeed
var1=KBXSpeed*(-1)
if KBXSpeed > 0
    var2=RBoundary
else
    var2=LBoundary
endif
var2-=XCoord
Abs var2
if var2 > 100
    if var1 > 0
        var0*=-1
        var1*=-1
    endif
endif
Norm var2 var0 var1
if var2 > 0
    var0/=var2
    var1/=var2
endif
AbsStick var0 var1
Return
//____________________
label _3
if KBXSpeed < 0
    var0=LBoundary
else
    var0=RBoundary
endif
var1=var0-XCoord
Abs var1
var0=(TBoundary-YCoord)/var1
var1=KBYSpeed/KBXSpeed
Abs var1
var2=KBYSpeed
var3=KBXSpeed*(-1)
if var0 > var1
    if var3 < 0
        var2*=-1
        var3*=-1
    endif
elif var3 > 0
    var2*=-1
    var3*=-1
endif
Norm var0 var2 var3
if var0 > 0
    var2/=var0
    var3/=var0
endif
AbsStick var2 var3
Return
