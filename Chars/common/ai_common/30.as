#include <Definition_AIMain.h>
//TrueID=0x30
id 0x8030

//Set Unknown
unk 0x50000

//Strings
str "#wait"
str "#edge_range"

var0=8
var1=20
EdgeCheck var1
if Dashing
    Seek _0
    Jump
endif
SetTimeout 30
WaitForGroundCanAct
SetTimeout 120
//____________________
label
if FrameGE var0
    Seek
endif
Return
//____________________
label _0
if MeteoChance
    Goto _1
endif
if CalledAs 0x34
    var2=AIPDFloat2*0.3
    if XDistLE var2
        Goto _1
    endif
elif CalledAs Unk31
    if !(XDistLE AIPDFloat1)
        Goto _1
    endif
elif CalledAs Unk32
    if XDistLE AIPDFloat2 AIPDFloat1
        Goto _1
    endif
elif XDistLE AIPDFloat2
    Goto _1
endif
var3=OPos
if CalledAs Unk31
    var3*=-1
elif CalledAs Unk32 && XDistLE AIPDFloat2
    var3*=-1
endif
AbsStick var3
Return
//____________________
label _1
var4=Direction*OPos
if var4 < 0
    Stick (-0.5)
endif
Finish
Return
