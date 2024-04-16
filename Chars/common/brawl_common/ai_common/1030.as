#include <Definition_AIMain.h>
//TrueID=0x1030
id 0x1030

//Set Unknown
unk 0x50000

//Strings
str "#range_chk_f"

var0=10
var1=30
AtkDiceRoll slot4
Cmd2F var2 15
if !(XDistLE var2)
    Cmd30
endif
//____________________
label
var3=0.8
if !(FrameGE var0)
    var3*=NumFrames
    var3/=var0
    var4=0.75
else
    var4=1
endif
var4*=OPos
AbsStick var4 var3
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
