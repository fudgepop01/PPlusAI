#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0x50000

//Strings

SetVec var0 Zero
AtkDiceRoll slot21
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif Falling
    if NumJumps > 0
        Call 
    elif YSpeed < -0.2
        var2=var1+50
        if YCoord < var2
            if YCoord < var1
                Call NAir
            else
                Call 
            endif
        endif
    endif
endif
Return
//____________________
label _0
if !(InAir)
    Finish
endif
GetReturnGoal var0
var3=var0-XCoord
var4=Direction
if var3 < 0
    var4*=-1
endif
Abs var3
if var3 > 5
    var3-=5
    var3/=5
    if var3 > 1
        var3=1
    endif
    var3*=var4
    Stick var3
endif
Return
Return
