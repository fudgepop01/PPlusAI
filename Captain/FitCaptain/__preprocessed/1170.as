#include <Definition_AIMain.h>
//TrueID=0x1170
id 0x1170

//Set Unknown
unk 0x40000

//Strings
str "#full_f"
str "#range_chk_f"

var0=8
var10=30
AtkDiceRoll slot3
Cmd2F var11 10
//____________________
label
if FrameGE var0
    var12=1
endif
var12*=OPos
AbsStick var12
if MeteoChance
    Finish
endif
if FrameGE var10 && !(XDistLE 0 AIPDFloat2)
    Finish
endif
if XDistLE var11
    Call
endif
Return
Return

