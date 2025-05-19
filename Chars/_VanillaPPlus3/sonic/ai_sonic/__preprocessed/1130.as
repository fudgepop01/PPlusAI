#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x00000

//Strings

SetTimeout 120
SetVec var0 Zero
var2=0
SetVec var3 Zero
var5=LevelValue*0.001+0.01
var6=1-var5
var7=0
//____________________
label
if NoOpponent
    var7=50
else
    EstOPosVecR var0 var1 0.5
    Goto _1
endif
if OutOfStage || var7 >= 40
    var7+=1
    if var7 >= 40
        var7=0
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
var0-=ExactXCoord
var1-=ExactYCoord
Goto _1
if !(OutOfStage)
    var7+=1
    if var7 >= 10
        Finish
    endif
endif
Return
//____________________
label _1
var1*=2
Norm var2 var0 var1
if var2 > 1
    var0/=var2
    var1/=var2
endif
if FrameGE 2
    var3*=var6
    var4*=var6
    var0*=var5
    var1*=var5
    var3+=var0
    var4+=var1
else
    var3*=0.7
    var4*=0.7
    var0*=0.3
    var1*=0.3
    var3+=var0
    var4+=var1
endif
AbsStick var3 var4
Return
Return

