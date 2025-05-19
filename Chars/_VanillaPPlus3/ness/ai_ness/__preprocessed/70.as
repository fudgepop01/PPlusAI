#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x00000

//Strings

//____________________
label
if InAir
    Finish
endif
if !(Idling) && !(Dashing)
    if FrameGE 30
        Finish
    endif
endif
Seek
Return
//____________________
label
var1=Rnd
if Rnd < 0.5
    Call 0x7001
elif Rnd < 0.5 && !(InAir)
    Button R
    if FrameGE 5 && XDistLE 25
        Button X
    endif
    if FrameGE 10 && XDistLE 15
        Call AerialBase
    endif
endif
endif
if FrameGE 3
Seek
endif
Return
//____________________
label
var1=Rnd
if Rnd < 0.5
Call 0x7001
elif Rnd < 0.5 && !(InAir)
Button R
if FrameGE 5 && XDistLE 25
    Button X
endif
if FrameGE 10 && XDistLE 15
    Call AerialBase
endif
endif
if CalledAs RollB
Stick (-1)
else
Stick 1
endif
Finish
Return

