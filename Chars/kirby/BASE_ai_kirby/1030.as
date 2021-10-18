#include <Definition_AIMain.h>
//TrueID=0x1030
id 0x1030

//Set Unknown
unk 0x60000

//Strings
str "#range"
str "#key_f"
str "#range2"

var0=7
var1=8
var2=15
if !(XDistLE var2)
    Cmd30
endif
if Rnd < 0.5 || !(XDistLE AIPDFloat2)
    Seek _0
    Jump
endif
//____________________
label
var3=0.8
if !(FrameGE var1)
    var3*=NumFrames
    var3/=var1
endif
Stick 0.7 var3
if MeteoChance || !(XDistLE 0 AIPDFloat2)
    Finish
endif
if XDistLE var0
    var4=NumFrames
    Seek
    SetFrame var4
endif
Return
//____________________
label
var3=0.8
if !(FrameGE var1)
    var3*=NumFrames
    var3/=var1
endif
Stick 0 var3
if FrameGE var1
    Stick (-0.6)
    Seek
endif
Return
//____________________
label
Stick (-0.6) 0.8
Button A
Finish
Return
//____________________
label _0
var5=Direction*OPos
Stick var5
if MeteoChance
    Finish
endif
if XDistLE var2
    Stick (-1) 1
    Button A
    Seek
endif
Return
//____________________
label
if FrameGE 10
    Finish
endif
Return
