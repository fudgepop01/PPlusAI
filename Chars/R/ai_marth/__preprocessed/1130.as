#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x20000

//Strings

var0=100
if LevelValue >= 30
    var0-=LevelValue
    var0*=0.12
    var0+=3
endif
var1=0
//____________________
label
if OutOfStage
    var1+=1
    if var1 >= var0
        Stick 1
        Button B
        Finish
    endif
else
    var1=0
endif
Return
Return

