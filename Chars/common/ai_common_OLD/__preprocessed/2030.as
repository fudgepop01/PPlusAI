#include <Definition_AIMain.h>
//TrueID=0x2030
id 0x2030

//Set Unknown
unk 0x40000

//Strings

SetVec var0 Zero
//____________________
label
Goto _0
var1+=50
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif YSpeed < 0 && YCoord < var1
    Seek
endif
Return
//____________________
label
Goto _0
if FrameGE 4
    if !(InAirOnSaved)
        Stick 0 1
    endif
    if FrameGE 10
        Finish
    endif
endif
Return
//____________________
label _0
GetReturnGoal var0
var2=var0-XCoord
var3=Direction
if var2 < 0
    var3*=-1
endif
Abs var2
if var2 > 5
    var2-=5
    var2/=5
    if var2 > 1
        var2=1
    endif
    var2*=var3
    Stick var2
endif
Return
Return

