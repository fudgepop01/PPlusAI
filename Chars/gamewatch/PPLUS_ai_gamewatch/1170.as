#include <Definition_AIMain.h>
//TrueID=0x1170
id 0x1170

//Set Unknown
unk 0x40000

//Strings
str "#full_f"
str "#range_chk_f"

var0=8
var1=30
AtkDiceRoll slot3
Cmd2F var2 10
//____________________
label
if FrameGE var0
    var3=1
endif
var3*=OPos
AbsStick var3
if MeteoChance
    Finish
endif
if FrameGE var1 && !(XDistLE 0 AIPDFloat2)
    Finish
endif
if XDistLE var2
    Call 
endif
Return
Return
