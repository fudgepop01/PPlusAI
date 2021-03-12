#include <Definition_AIMain.h>
//TrueID=0x4020
id 0x4020

//Set Unknown
unk 0x0

//Strings

SetTimeout 120
//____________________
label
SetVec var0 OXCoord
SetVec var2 XCoord
SubVector var0 var2
Abs var0
var2=var1
Abs var2
if var0 > 30 || var2 > 50
    Seek _0
    Jump
elif var0 < 20
    Seek
    Jump
endif
Goto _1
Return
//____________________
label
SetVec var0 OXCoord
var2=XCoord
SubVector var0 var2
SetVec var2 var0
Abs var2
Abs var3
if var0 > 10 && var3 < 8
    Call FAir
elif var0 < -10 && var3 < 8
    Call BAir
elif var1 > 5 && var2 < 8
    Call UAir
elif var1 < -5 && var2 < 8
    Call DAir
endif
Finish
//____________________
label _0
var0=YCoord
//____________________
label
if !(InAir)
    Finish
endif
if YCoord < var0
    Stick 0 (-1)
endif
GetNearestCliff var1
var3=ExactYCoord-var2
if var3 < 5
    ClearStick
    Button R
    var3=OPos*Direction
    if var3 > 0
        Stick (-1) (-1)
    else
        Stick 1 (-1)
    endif
endif
var0=YCoord
Return
//____________________
label _1
if var1 > 30
    if NumJumps > 0 || var23 > 0
        Button X
        var23=1
    endif
endif
AbsStick OPos
Return
