#include <Definition_AIMain.h>
//TrueID=0x3090
id 0x3090

//Set Unknown
unk 0x70000

//Strings
str "#full_f"
str "#edge_range"

var0=8
var1=20
var2=0
var3=(Rnd*0.2+0.3)*AIPDFloat2
var4=Rnd*12+4
SetTimeout 50
//____________________
label
if DistFrontEdge < var1 || MeteoChance
    Seek _0
    Return
endif
var2=OPos
if XDistLE var3
    SetTimeout 60
    if Rnd < 0.6 || XDistLE 10
        var2*=-1
        Seek _1
    else
        var2*=-0.7
        var4*=3
        Seek _2
    endif
    Jump
endif
if !(FrameGE var0)
    var2*=0.75
endif
AbsStick var2
Return
//____________________
label _1
if FrameGE var4
    Seek _0
    Return
elif !(FrameGE 2)
    AbsStick var2
endif
Return
//____________________
label _2
if FrameGE var4
    Seek _0
    Return
else
    AbsStick var2
endif
Return
//____________________
label _0
if !(FrameGE 2)
    var5=Direction*OPos
else
    var5=1
endif
if var5 < 0
    Stick (-1)
else
    Random var6
    if OAttacking 6 && ODistLE 40
        if var6 < 0.2
            Call Unk1010
        elif var6 < 0.5
            Call Unk1020
        endif
    endif
    Finish
endif
Return
Return
