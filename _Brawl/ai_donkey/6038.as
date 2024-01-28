#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x50000

//Strings
str "#wait_f"

var0=2
var1=0
var2=0
var3=0
if Rnd < 0.5
    var2+=0.5
endif
if MeteoChance
    var4=15
else
    var4=var2+Func12+3
endif
//____________________
label _0
if FrameGE var2
    if var1 < 1
        Button B
        if MeteoChance
            var1=2
        else
            var1=Func13
        endif
    else
        var1-=1
    endif
    if FrameGE var4
        Finish
    endif
endif
Return
Return
