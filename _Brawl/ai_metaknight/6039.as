#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x50000

//Strings

SetVec var0 Zero
var2=(LevelValue-20)*0.0166
if var2 < 0
    var2=0
elif var2 > 1
    var2=1
endif
//____________________
label _0
if !(Idling)
    if FrameGE 10
        Finish
    endif
    Return
endif
AbsStick OPos
Button B
var3=0
SetTimeout 40
Seek
Return
//____________________
label
EstOPosVecR var0 var1 var2
if OutOfStage
    var3=1
elif var1 > 5
    var3+=0.1
    if var3 > 1
        var3=1
    endif
elif var1 < -10
    var3-=0.1
    if var3 < -1
        var3=-1
    endif
elif YSpeed > 0.1
    var3-=0.1
    if var3 < 0
        var3=0
    endif
elif YSpeed < 0
    var3+=0.1
    if var3 > 0
        var3=0
    endif
endif
AbsStick 0 var3
Return
Return
