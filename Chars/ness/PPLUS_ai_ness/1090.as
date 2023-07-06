#include <Definition_AIMain.h>
//TrueID=0x1090
id 0x1090

//Set Unknown
unk 0x20000

//Strings
str "#key_f"

var0=3
AtkDiceRoll slot8
Cmd2F var1 22
if DiceRollResult Jab123
    var1+=15
endif
if !(XDistLE var1)
    Cmd30
endif
if Dashing
    Seek _0
    Jump
endif
SetTimeout 10
//____________________
label
if Dashing || Idling
    SetTimeout 120
    Seek
    Jump
endif
Return
//____________________
label _0
AbsStick OPos
if FrameGE var0 && XDistLE var1
    Call 
endif
if MeteoChance
    Finish
endif
Return
Return
