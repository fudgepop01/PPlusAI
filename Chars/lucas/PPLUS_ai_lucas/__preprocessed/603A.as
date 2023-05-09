#include <Definition_AIMain.h>
//TrueID=0x603A
id 0x603A

//Set Unknown
unk 0xA0000

//Strings

SetVec var0 Zero
var2=0
var3=0
var4=0
var5=(LevelValue-20)*0.0166*30
if var5 < 0
    var5=0
elif var5 > 30
    var5=30
endif
SetTimeout 60
//____________________
label
if Idling
    Goto _0
    SetTimeout 600
    Seek
endif
Return
//____________________
label
if Idling
    Finish
endif
if FrameGE 24
    Seek
endif
Return
//____________________
label
if Idling
    Finish
endif
AbsStick var3 (-1)
if FrameGE 16
    var3*=-1
    Seek
endif
Return
//____________________
label
if Idling
    Finish
endif
AbsStick var3 (-1)
if FrameGE 2
    Seek
endif
Return
//____________________
label
if Idling
    Finish
endif
SetVec var6 ExactXCoord
SubVector var6 ObjXCoord
Norm var8 var6 var7
var8*=0.015625
if var8 > 1
    var8=1
endif
var6=((XSpeed-ObjXSpeed)*var5*var8+ExactXCoord)-ObjXCoord
var9=var3*2
var6+=var9
var7=(((YSpeed-ObjYSpeed)*var5*var8+ExactYCoord)-ObjYCoord)+var4
Norm var8 var6 var7
if var8 > 1
    var6/=var8
    var7/=var8
endif
if !(FrameGE var2)
    var9=(NumFrames-var2)/var2
    var7+=var9
endif
AbsStick var6 var7
if FrameGE 60
    Finish
endif
Return
//____________________
label _0
ClearStick
AbsStick 0 1
Button B
var3=OPos*(-1)
var4=Rnd*12+(-6)
var2=16
Return
Return

