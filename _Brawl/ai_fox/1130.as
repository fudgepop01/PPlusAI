#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x90000

//Strings

var0=0
var1=LevelValue*0.0096+0.04
Random var2
var2*=30
var2+=20
var3=(LevelValue-120)*0.4
//____________________
label _0
if OutOfStage
    if var3 > 0
        Seek _1
        Return
    endif
    var3+=1
else
    var3=(LevelValue-120)*0.4
endif
Goto _2
if FrameGE 30
    Seek
endif
Return
//____________________
label
if OutOfStage
    if var3 > 0
        Seek _1
        Return
    endif
    var3+=1
else
    var3=(LevelValue-120)*0.4
endif
var4=OXCoord-XCoord
Abs var4
if var4 < 50
    var4=OYCoord-YCoord
    if var4 > 0 && var4 < 45 && !(InAir)
        Random var4
        var4*=100
        if var4 > LevelValue
            Seek _0
        else
            Random var4
            if var4 < 0.1
                Seek _0
            elif var4 < 0.6
                Button A
                Seek _0
            else
                Stick 0 (-1)
                Seek _3
                Return
            endif
        endif
    endif
elif FrameGE 50
    Random var4
    var4*=70
    if var4 > LevelValue
        Seek _0
    else
        Random var4
        if var4 < 0.5
            Button A
            Seek _0
        endif
    endif
endif
Goto _2
Return
//____________________
label _3
Stick 0 (-1)
if FrameGE 10
    Seek _0
endif
Return
//____________________
label _4
GetReturnGoal var5
var7=var5-XCoord
var8=Direction
if var7 < 0
    var8*=-1
endif
Abs var7
if var7 > 5
    var7-=5
    var7/=5
    if var7 > 1
        var7=1
    endif
    var7*=var8
    Stick var7
endif
Return
//____________________
label _1
Goto _4
var4=(YSpeed*20+YCoord)-var6
if OutOfStage && var4 < var2
    Button X
else
    Random var2
    var2*=30
    var2+=20
endif
if !(InAir)
    Seek _0
endif
Return
//____________________
label _2
if OPos > 0
    var0+=var1
    if var0 > 1
        var0=1
    endif
else
    var0-=var1
    if var0 < -1
        var0=-1
    endif
endif
AbsStick var0
var4=OYCoord-YCoord
if var4 > 40
    if YSpeed > -0.1
        AbsStick 0 1
    endif
elif var4 < -10
    if Rnd < 0.5
        AbsStick 0 (-1)
    endif
endif
Return
Return
