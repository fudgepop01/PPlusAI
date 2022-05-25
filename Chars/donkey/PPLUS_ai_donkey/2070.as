#include <Definition_AIMain.h>
//TrueID=0x2070
id 0x2070

//Set Unknown
unk 0x50000

//Strings
str "#full_f"
str "#edge_range"

var0=Rnd
var1=0
if var1 > 0
    var1=0
    Return
endif
if CurrAction >= 66 && CurrAction <= 85 && FramesSinceShield >= 40
    Button R
endif
//____________________
label _0
if var0 < 0.5 && fXClose
    Button A
    Finish
elif var0 < 0.25 && !(var0 >= 0.25)
    Stick 0 1
    Finish
elif var0 > 0.25 && !(var0 >= 0.5)
    Stick 1
    Finish
elif var0 > 0.5 && !(var0 >= 0.75)
    Stick (-1)
    Finish
elif var0 > 0.75
    Seek _0
    Finish
endif
Return
