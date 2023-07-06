#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x40000

//Strings

Random var0 110 10
var1=(LevelValue-20)*0.0166*30
if var1 < 0
    var1=0
elif var1 > 30
    var1=30
endif
var2=OPos*OXSpeed
if var2 < -0.3
    var3=30
else
    var3=5
endif
//____________________
label
if !(Idling)
    if FrameGE 10
        Finish
    endif
    Return
endif
Seek
Jump
Return
//____________________
label
if FrameGE var0
    Finish
endif
Button B
if FrameGE var3
    var2=((OXSpeed-ObjXSpeed)*var1+OXCoord)-ObjXCoord
    if var2 > 20
        AbsStick 1
    elif var2 > 0
        AbsStick 0.5
    elif var2 < -20
        AbsStick (-1)
    else
        AbsStick (-0.5)
    endif
endif
Return
Return
