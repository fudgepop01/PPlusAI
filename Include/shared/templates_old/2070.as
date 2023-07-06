// "LYING DOWN" ROUTINE
#include <Definition_AIMain.h>
//TrueID=0x2070
id 0x2070

//Set Unknown
unk 0x00000

//Strings

lastScript = hex(0x2070)

Cmd30
#let timer = var0
timer = Rnd * 20 + 5
label
if Equal CurrAction hex(0x4D)
    if timer <= 0 || ODistLE 20
        var0 = Rnd * 4
        if ODistLE 30 && Rnd < 0.4
            var0 = 4
        endif
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
    if ODistLE 30 && Rnd <= 0.1
        Button A
    endif
    timer -= 1
endif
Return
Return
