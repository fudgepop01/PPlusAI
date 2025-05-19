#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x00000

//Strings

SetVec var0 Zero
var2=0
var3=0
SetVec var4 Zero
var6=(LevelValue-20)*0.0166*30
if var6 < 0
    var6=0
elif var6 > 30
    var6=30
endif
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif YSpeed < 0.2 || NumJumps > 0
    Seek
endif
Return
//____________________
label
GetReturnGoal var0
var7=var1+50
if YCoord > var7
    Goto _0
else
    var7=var1
    if YCoord > var7 && DistFrontEdge > -10
        Goto _0
    elif DistFrontEdge > -50
        if XSpeed > 1
            AbsStick (-1)
        elif XSpeed < -1
            AbsStick 1
        else
            var7=XSpeed*(-1)
            AbsStick var7
        endif
    else
        Goto _0
    endif
endif
if !(InAirOnSaved) && Falling
    var7=var1
    if DistFrontEdge > -20
        var7+=-12
    else
        var7+=10
    endif
    if YCoord < var7
        Goto _1
        Seek
        Return
    endif
endif
if FrameGE 10
    Finish
endif
Return
//____________________
label
if !(InAir) || Falling
    Finish
endif
AbsStick var3 (-1)
if FrameGE 23
    Seek
endif
Return
//____________________
label
if !(InAir) || Falling
    Finish
endif
AbsStick 0 (-1)
if FrameGE 15
    Seek
endif
Return
//____________________
label
if !(InAir) || Falling
    Finish
endif
SetVec var4 ExactXCoord
SubVector var4 ObjXCoord
Norm var8 var4 var5
var8*=0.015625
if var8 > 1
    var8=1
endif
var4=((XSpeed-ObjXSpeed)*var6*var8+ExactXCoord)-ObjXCoord
var7=var3*2
var4+=var7
var5=((YSpeed-ObjYSpeed)*var6*var8+ExactYCoord)-ObjYCoord
Norm var8 var4 var5
if var8 > 1
    var4/=var8
    var5/=var8
endif
if !(FrameGE var2)
    var7=(NumFrames-var2)/var2
    var5+=var7
endif
AbsStick var4 var5
if FrameGE 60
    Finish
endif
Return
//____________________
label _0
if !(InAir)
    Finish
endif
GetReturnGoal var0
var9=var0-XCoord
var10=Direction
if var9 < 0
    var10*=-1
endif
Abs var9
if var9 > 5
    var9-=5
    var9/=5
    if var9 > 1
        var9=1
    endif
    var9*=var10
    Stick var9
endif
Return
//____________________
label _1
ClearStick
AbsStick 0 1
Button B
GetNearestCliff var0
var3=var0-XCoord
if var3 > 0
    var3=-1
else
    var3=1
endif
var11=var3*XSpeed
var2=12
if var11 > 0
    var11*=-3
    if var11 < -4
        var11=-3
    endif
    var2+=var11
elif var11 < 0
    var11*=-8
    if var11 > 12
        var11=12
    endif
    var2+=var11
endif
Return
Return
