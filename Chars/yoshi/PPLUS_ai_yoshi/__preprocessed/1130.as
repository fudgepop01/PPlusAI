#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x110000

//Strings

SetTimeout 120
SetVec var0 Zero
var2=LevelValue*0.001+0.01
var3=1-var2
var4=0
var5=(100-LevelValue)*0.4+8
var6=(100-LevelValue)+10
var7=var6*0.3
var8=(LevelValue-20)*0.0166*30
if var8 < 0
    var8=0
elif var8 > 30
    var8=30
endif
//____________________
label
SetVec var9 OXSpeed
var9-=XSpeed
var9*=var8
var9+=ExactOXCoord
var10-=YSpeed
var10*=var8
var10+=ExactOYCoord
if var7 > 0
    var7-=1
else
    SetVec var11 var9
    var12-=ExactYCoord
    Abs var12
    if LevelValue < 30
        Abs var11
    else
        var11*=Direction
    endif
    if var11 > 20 && var12 < var5
        Button A
        var7=var6
    endif
endif
SetVec var11 var9
if Direction > 0
    var11+=35
else
    var11-=35
endif
if ODamage < 120
    var12+=15
else
    var12+=3
endif
Goto _1
if OutOfStage
    var4+=1
    if var4 >= 40
        var4=0
        Seek _0
        SetTimeout 60
        Return
    endif
endif
Return
//____________________
label _0
GetReturnGoal var11
var12+=20
Goto _1
if !(OutOfStage)
    var4+=1
    if var4 >= 10
        Finish
    endif
endif
Return
//____________________
label _1
var11-=ExactXCoord
var12-=ExactYCoord
Norm var13 var11 var12
if var13 > 1
    var11/=var13
    var12/=var13
endif
SetVec var14 ExactOXCoord
var14-=ExactXCoord
var15-=ExactYCoord
Norm var13 var14 var15
if var13 < 10
    var11*=0.2
elif var13 < 70
    var16=(ExactOXCoord-ExactXCoord)*Direction
    if var16 < 0
        var11=OPos
    else
        var11*=0.5
    endif
elif var13 < 100
    var11*=0.7
endif
if FrameGE 2
    var0*=var3
    var1*=var3
    var11*=var2
    var12*=var2
    var0+=var11
    var1+=var12
else
    var0*=0.7
    var1*=0.7
    var11*=0.3
    var12*=0.3
    var0+=var11
    var1+=var12
endif
AbsStick var0 var1
Return
Return

