#include <Definition_AIMain.h>
//TrueID=0x1160
id 0x1160

//Set Unknown
unk 0x00000

//Strings

SetTimeout 50
var0=45*Rnd
//____________________
label
if OutOfStage
    Finish
endif
if OAttacking
    if Idling
        Call Unk3020
    endif
    Finish
endif
var0+=-1
if var0 < 0
    if Idling
        Call NSpecial
    elif Falling
        Call NSpecialAir
    endif
    Finish
endif
var1=Direction*OPos
if var1 < 0
    var1=0.5*OPos
    AbsStick var1
endif
Return
Return

