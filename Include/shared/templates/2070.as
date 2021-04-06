// "LYING DOWN" ROUTINE
#include <Definition_AIMain.h>
//TrueID=0x2070
id 0x2070

//Set Unknown
unk 0x00000

//Strings

Cmd30

#let timer = var0
timer = Rnd * 80 + 10
label
if Equal CurrAction hex(0x4D)
    if timer <= 0 || ODistLE 15
        var0 = Rnd * 4
        if var0 > 3
            Button A
        elif var0 > 2
            Button R
        elif var0 > 1
            AbsStick 1 0
        else
            AbsStick (-1) 0
        endif
    endif
    if ODistLE 25 && timer < 60 && Rnd <= 0.02
        Button A
    endif
    timer -= 1
else
    Call AIHub
endif
Return
Return
