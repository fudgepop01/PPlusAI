#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0xF0000

//Strings

SetTimeout 120
SetVec var0 Zero
var2=LevelValue*0.001+0.01
var3=1-var2
var4=0
var5=(LevelValue-20)*0.0166*30
if var5 < 0
    var5=0
elif var5 > 30
    var5=30
endif
var6=(100-LevelValue)*0.6+3
var7=var6
//____________________
label
if NoOpponent
    var4=50
else
    SetVec var8 OXSpeed
    var8-=XSpeed
    var8*=var5
    var8+=ExactOXCoord
    var9-=YSpeed
    var9*=var5
    var9+=ExactOYCoord
    SetVec var10 var8
    if ODistLE 40
        var11+=15
    else
        var11+=45
    endif
    Goto _1
endif
if LevelValue < 60 || !(ODistLE 30)
    Goto _2
endif
if OutOfStage || var4 >= 40
    var4+=1
    if var4 >= 20
        var4=0
        Seek _0
        SetTimeout 150
        Return
    endif
endif
Return
//____________________
label _0
GetReturnGoal var10
var11+=30
Goto _1
Goto _2
if !(OutOfStage)
    var4+=1
    if var4 >= 4
        Finish
    endif
endif
Return
//____________________
label _1
var10-=ExactXCoord
var11-=ExactYCoord
Norm var12 var10 var11
if var12 > 1
    var10/=var12
    var11/=var12
endif
SetVec var13 ExactOXCoord
var13-=ExactXCoord
var14-=ExactYCoord
Norm var12 var13 var14
if var12 < 10
    var10*=0.2
    var11*=0.4
elif var12 < 70
    var10*=0.5
    var11*=0.2
elif var12 < 100
    var10*=0.7
endif
if var11 < 0
    if YSpeed < 0
        var11=YSpeed*(-0.8)
        if OutOfStage
            var11+=0.3
        endif
    else
        var11*=0.1
    endif
else
    var11*=2
    var11+=0.2
    if YSpeed < 0
        var11+=0.5
    endif
    if LevelValue < 40
        var11+=0.3
    endif
    if OutOfStage
        var11+=0.5
    endif
endif
if FrameGE 2
    var0*=var3
    var1*=var3
    var10*=var2
    var11*=var2
    var0+=var10
    var1+=var11
else
    var0*=0.7
    var1*=0.7
    var10*=0.3
    var11*=0.3
    var0+=var10
    var1+=var11
endif
AbsStick var0 var1
Return
//____________________
label _2
var7-=1
if var7 <= 0
    Button A
    var7=var6
endif
Return
Return

