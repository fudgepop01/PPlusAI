#include <Definition_AIMain.h>
//TrueID=0x0
id 0x8000

//Set Unknown
unk 0x20000

//Strings

if OIsOnStage < 1
    Finish
endif
if !(InAir)
    Finish
endif
var0=OYCoord
var1=YCoord
var2=var1+20
var3=var1-20
var10=OXCoord
var11=XCoord
var12=var1+30
var13=var1-30
if var0 <= var2 && var0 >= var3 && IsOnStage > 0 && XDistLE 30 && !(YDistFrontEdge > 25)
    ClearStick
    Button A
    Seek
endif
if Back
    var1+=20
    if var0 <= var2 && var0 >= var3 && IsOnStage > 0 && XDistLE 30 && !(YDistFrontEdge > 25)
        ClearStick
        Stick (-1)
        Button A
        Seek
    endif
endif
if !(Back)
    var1+=20
    if var0 <= var2 && var0 >= var3 && IsOnStage > 0 && XDistLE 30 && !(YDistFrontEdge > 25)
        ClearStick
        Stick 1
        Button A
        Seek
    endif
endif
if OYCoord > YCoord
    var10+=10
    if var10 <= var12 && var10 >= var13 && IsOnStage > 0 && !(YDistFrontEdge > 25)
        ClearStick
        Stick 0 1
        Button A
        Seek
    endif
endif
if OYCoord < YCoord
    var10+=10
    if var10 <= var12 && var10 >= var13 && IsOnStage > 0 && !(YDistFrontEdge > 25)
        ClearStick
        Stick 0 (-1)
        Button A
        Seek
    endif
endif
Return
//____________________
label
Goto _0
if FrameGE 1
    Finish
endif
Return
//____________________
label _0
AbsStick OPos
Return
