#include <Definition_AIMain.h>
//TrueID=0x6038
id 0x6038

//Set Unknown
unk 0x00000

//Strings
str "#full_f"
str "#edge_range"

if FrameGE 0
    Button B
endif
if FrameGE 5 && CurrAction < 1
    Finish
endif
var0=150
if Rnd >= 0.6 && Rnd <= 0.8
    var0/=2
elif Rnd > 0.8
    var0/=4
endif
if FrameGE var0 || OAttacking && XDistLE 25 || XDistLE 25 || InAir
    Seek _0
endif
Return
//____________________
label _0
Button R
Finish
Return

