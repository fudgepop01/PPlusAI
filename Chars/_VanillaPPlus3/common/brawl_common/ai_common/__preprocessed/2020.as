#include <Definition_AIMain.h>
//TrueID=0x2020
id 0x2020

//Set Unknown
unk 0x30000

//Strings

GetReturnGoal var0
//____________________
label
Goto _0
if InAirOnSaved
    if FrameGE 8
        Finish
    endif
elif YSpeed < -0
    Seek
endif
Return
//____________________
label
if FrameGE 4
    if XCoord > var0
        var2=-1
    else
        var2=1
    endif
    var2*=Direction
    Stick var2
    Button B
    Finish
else
    Goto _0
endif
Return
//____________________
label _0
var2=var0-XCoord
Abs var2
if var2 > 5
    if XCoord > var0
        var2=-1
    else
        var2=1
    endif
    var2*=Direction
    Stick var2
endif
Return
Return

