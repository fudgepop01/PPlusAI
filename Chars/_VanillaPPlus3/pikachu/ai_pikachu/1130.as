#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x00000

//Strings

SetTimeout 120
SetVec var0 Zero
SetVec var2 Zero
var4=LevelValue*0.001+0.01
var5=1-var4
var6=0
var7=0
//____________________
label
if NoOpponent
    var6=50
else
    SetVec var0 ExactOXCoord
    Goto _1
endif
Goto _2
if OutOfStage || var6 >= 40
    var6+=1
    if var6 >= 40
        var6=0
        Seek _0
        SetTimeout 60
        Return
    endif
endif
Return
//____________________
label _0
GetReturnGoal var0
if YCoord > var1
    GetRndPointOnStage var0
endif
var1+=20
Goto _1
Goto _2
if !(OutOfStage)
    var6+=1
    if var6 >= 10
        Finish
    endif
endif
Return
//____________________
label _1
var0-=ExactXCoord
var1-=ExactYCoord
Norm var8 var0 var1
if var8 > 1
    var0/=var8
    var1/=var8
endif
if FrameGE 2
    var2*=var5
    var3*=var5
    var0*=var4
    var1*=var4
    var2+=var0
    var3+=var1
else
    var2*=0.7
    var3*=0.7
    var0*=0.3
    var1*=0.3
    var2+=var0
    var3+=var1
endif
AbsStick var2 var3
Return
//____________________
label _2
if var7 > 0
    var7+=-1
    Return
endif
if ODamage < 100
    var9=ODamage*0.008+0.2
    if Rnd > var9
        var7=8
        Return
    endif
endif
var9=(100-LevelValue)*0.2*Rnd
if Rnd < 0.5
    var9*=-1
endif
var9+=3
SetVec var0 ObjXSpeed
SubVector var0 OXSpeed
var0*=var9
var1*=var9
AddVector var0 ObjXCoord
SubVector var0 ExactOXCoord
Norm var9 var0 var1
if var9 < 25
    Button A
    var7=LevelValue*0.5
endif
Return
Return
