#include <Definition_AIMain.h>
//TrueID=0x6047
id 0x6047

//Set Unknown
unk 0x00000

//Strings

SetVec var0 Zero
var2=(LevelValue-20)*0.0166
if var2 < 0
    var2=0
elif var2 > 1
    var2=1
endif
//____________________
label
if !(Falling)
    if FrameGE 4
        Finish
    endif
    Return
endif
AbsStick OPos
Button B
SetTimeout 40
Seek
Return
//____________________
label
EstOPosVecR var0 var1 var2
if OutOfStage
    var4=1
elif var1 > 5
    var4+=0.1
    if var4 > 1
        var4=1
    endif
elif var1 < -10
    var4-=0.1
    if var4 < -1
        var4=-1
    endif
elif YSpeed > 0.1
    var4-=0.1
    if var4 < 0
        var4=0
    endif
elif YSpeed < 0
    var4+=0.1
    if var4 > 0
        var4=0
    endif
endif
AbsStick 0 var4
Return
Return

