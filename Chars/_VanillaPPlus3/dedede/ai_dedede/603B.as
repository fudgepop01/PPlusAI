#include <Definition_AIMain.h>
//TrueID=0x603B
id 0x603B

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

var0=2
var1=0
SetVec var2 Zero
var4=1
var5=1
if Rnd < 0.5
    var4+=0.5
endif
var6=(var4+RandXOffset)*2+60
var7=0
//____________________
label
var8=var5
if !(FrameGE var4)
    var8*=NumFrames
    var8/=var4
endif
var8*=-1
Stick 0 var8
if FrameGE var4
    Button B
    Seek
endif
Return
//____________________
label
if OutOfStage || Idling || Falling
    Finish
endif
var9=OPos
var10=DistFrontEdge
if var10 < 10
    var11=var9*Direction
    if var10 < 5
        if var11 < 0 || var10 < 2
            var7=var9*(-0.6)
        else
            var7=0
        endif
    elif var11 < 0
        var7=var9*0.5
    else
        var7=0
    endif
elif XDistLE 0
    var11=var9*0.2
    var7+=var11
    if var7 > 1
        var7=1
    elif var7 < -1
        var7=-1
    endif
elif var9 > 0
    var7+=0.2
    if var7 > 1
        var7=1
    endif
else
    var7+=-0.2
    if var7 < -1
        var7=-1
    endif
endif
AbsStick var7
var11=ExactOYCoord-ExactYCoord
if !(InAir) && var11 > 30
    var11=var7
    Abs var11
    if var10 > 30 || var11 < 0.3
        Button X
    endif
endif
Abs var11
if var11 < 20
    var9*=Direction
    if var9 > 0 && XDistLE 14
        if XDistLE 8
            var6=0
        else
            var6+=-1
        endif
    endif
endif
if FrameGE var6
    Finish
endif
Button B
Return
Return
