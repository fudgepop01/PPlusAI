#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x20000

//Strings

var0=0
SetTimeout 0
//____________________
label _0
var0=100-LevelValue
var1=var0
var0*=0.18
var0+=2
var0*=Rnd
var1*=0.04
var0+=var1
if Rnd < 0.5
    var0*=-1
endif
Seek
Return
//____________________
label
var1=ObjXCoord
if var1 > -0.5
    if var1 <= var0
        Button A
        Seek _1
        Return
    elif var1 <= 1
        Seek _2
        Return
    endif
endif
Return
//____________________
label _2
var0+=1
if var0 >= 0
    Button A
    Seek _0
endif
Return
//____________________
label _1
if ObjXCoord > var0
    Seek _0
endif
Return
Return
