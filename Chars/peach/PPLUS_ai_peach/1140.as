#include <Definition_AIMain.h>
//TrueID=0x1140
id 0x1140

//Set Unknown
unk 0x50000

//Strings

var0=OPos
var1=-1
SetVec var2 Zero
SetTimeout 10
//____________________
label
if !(Idling) && !(Dashing)
    Return
endif
SetTimeout 10
Seek
Jump
Return
//____________________
label
Button X
AbsStick 0 (-1)
if PeachHover
    SetTimeout 0
    Seek
endif
Return
//____________________
label _0
if !(PeachHover)
    Finish
endif
Goto _1
Button X
AbsStick var0
if Falling
    if ODistLE 20
        Seek
        Jump
    endif
endif
if var1 > 0 && FrameGE 3 && !(OutOfStage)
    Finish
endif
Return
//____________________
label
if !(PeachHover)
    Finish
endif
Button X
AbsStick OPos
if !(FrameGE 2)
    Button A
else
    var1=1
    Seek _0
endif
Return
//____________________
label _1
var4=DistFrontEdge
if var4 < -80
    var1=1
endif
if var1 < 0
    if OPos > 0
        var0+=0.4
        if var0 > 1
            var0=1
        endif
    else
        var0+=-0.4
        if var0 < -1
            var0=-1
        endif
    endif
else
    GetRndPointOnStage var2
    if XCoord > var2
        var0=-1
    else
        var0=1
    endif
endif
Return
Return
