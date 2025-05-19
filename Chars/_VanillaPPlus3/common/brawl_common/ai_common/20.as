#include <Definition_AIMain.h>
//TrueID=0x20
id 0x8020

//Set Unknown
unk 0x50000

//Strings
// str "#full_f"
// str "#edge_range"

var0=8
var1=20
var2=0
if CalledAs Unk24
    SetTimeout 80
else
    SetTimeout 50
endif
//____________________
label
if DistFrontEdge < var1 || MeteoChance
    Seek _0
    Return
endif
if CalledAs Unk24
    var3=AIPDFloat2*0.25
    if XDistLE var3
        var2*=0.7
        Seek _1
        Jump
    endif
elif CalledAs Unk21
    if !(XDistLE AIPDFloat1)
        var2*=0.7
        Seek _1
        Jump
    endif
elif CalledAs Unk22
    if XDistLE AIPDFloat2 AIPDFloat1
        var2*=0.7
        Seek _1
        Jump
    endif
elif XDistLE AIPDFloat2
    var2*=0.7
    Seek _1
    Jump
endif
var2=OPos
if !(FrameGE var0)
    var2*=0.75
endif
if CalledAs Unk21
    var2*=-1
elif CalledAs Unk22 && XDistLE AIPDFloat2
    var2*=-1
endif
AbsStick var2
Return
//____________________
label _1
var3=11
if FrameGE var3
    Seek _0
    Return
elif !(FrameGE 9)
    AbsStick var2
endif
Return
//____________________
label _0
var4=Direction*OPos
if var4 < 0
    Stick (-0.5)
else
    Finish
endif
Return
Return
