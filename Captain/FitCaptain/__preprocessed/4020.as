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
SetVec var11 XCoord
SubVector var0 var11
Abs var0
var11=var10
Abs var11
if var0 > 30 || var11 > 50
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
var11=XCoord
SubVector var0 var11
SetVec var11 var0
Abs var11
Abs var12
if var0 > 10 && var12 < 8
    Call FAir
elif var0 < -10 && var12 < 8
    Call BAir
elif var10 > 5 && var11 < 8
    Call UAir
elif var10 < -5 && var11 < 8
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
GetNearestCliff var10
var12=ExactYCoord-var11
if var12 < 5
    ClearStick
    Button R
    var12=OPos*Direction
    if var12 > 0
        Stick (-1) (-1)
    else
        Stick 1 (-1)
    endif
endif
var0=YCoord
Return
//____________________
label _1
if var10 > 30
    if NumJumps > 0 || var23 > 0
        Button X
        var23=1
    endif
endif
AbsStick OPos
Return

