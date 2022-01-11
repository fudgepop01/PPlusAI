#include <Definition_AIMain.h>
//TrueID=0x40
id 0x40

//Set Unknown
unk 0x00000

//Strings

if Equal CurrAction 276 || Equal CurrAction 16
  Call RecoveryHub
endif

if MeteoChance
    Call EdgeguardHub
endif

//____________________
label
var0=Direction*OPos*0.7
AbsStick OPos
if var0 > 0 || FrameGE 5
    var10=6*Rnd
    Seek
endif
Return
//____________________
label
AbsStick OPos
if FrameGE var10 || ODistLE 10
    Finish
endif
Return
Return

