#include <Definition_AIMain.h>
//TrueID=0x30D0
id 0x30D0

//Set Unknown
unk 0x20000

//Strings

SetTimeout 15
var0=100-LevelValue
var1=var0
var0*=0.1*Rnd
var1*=0.03
var0+=var1
var1=Rnd*3-2
var0+=var1
//____________________
label
if OutOfStage
    Finish
endif
if !(InAir)
    Finish
endif
if OAttacking && ODistLE 50
    SetTimeout 20
    Seek
    Jump
endif
Return
//____________________
label
if !(InAir)
    Finish
endif
if FrameGE var0 && Falling
    Button X
    Finish
endif
Return
Return

