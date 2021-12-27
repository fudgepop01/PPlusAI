#include <Definition_AIMain.h>
//TrueID=0x6049
id 0x6049

//Set Unknown
unk 0x70000

//Strings

var0=(LevelValue-20)*0.0166
if var0 < 0
    var0=0
elif var0 > 1
    var0=1
endif
var1=0
Random var2
SetVec var3 Zero
//____________________
label _0
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
AbsStick 0 (-1)
Button B
SetTimeout 32
Seek
Return
//____________________
label
EstOPosVecR var3 var4 var0
if var4 < 3 && var4 > -3
    var4=0
endif
Goto _2
if OutOfStage
    var1+=1
    if var1 >= 4
        var1=0
        Seek _1
        SetTimeout 20
        Return
    endif
endif
if var2 > 0.6
    Button B
endif
Return
//____________________
label _1
GetReturnGoal var3
var4+=20
var3-=ExactXCoord
var4-=ExactYCoord
Goto _2
if !(OutOfStage)
    Finish
endif
Return
//____________________
label _2
Norm var6 var3 var4
if var6 > 1
    var3/=var6
    var4/=var6
endif
AbsStick var3 var4
Return
Return
