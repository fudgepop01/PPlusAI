#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x40000

//Strings
str "#wait_f"

var0=2
var1=0
Random var2
var2*=50
var2+=Func12
//____________________
label _0
if var1 < 1
    Button B
    var1=Func13
else
    var1-=1
endif
if LevelValue > 45
    var3=Direction*OPos
    if var3 < 0
        var2=0
    endif
endif
if FrameGE var2
    Finish
endif
Return
Return
