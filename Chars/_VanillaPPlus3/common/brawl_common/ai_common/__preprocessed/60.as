#include <Definition_AIMain.h>
//TrueID=0x60
id 0x60

//Set Unknown
unk 0x10000

//Strings

//____________________
label
if !(Idling)
    if FrameGE 10
        Finish
    endif
    Return
endif
SetTimeout 30
if !(CanThrow)
    var0=OPos
    Seek _0
    Return
endif
Seek
Return
//____________________
label
if FrameGE 4
    Seek
endif
Return
//____________________
label
Stick 0 (-1)
if FrameGE 4
    Seek
endif
Return
//____________________
label
AbsStick OPos
if FrameGE 6
    if InAir
        Call Unk1080
        Finish
    endif
    Finish
endif
Return
//____________________
label _0
if FrameGE 4
    SetTimeout 40
    Seek
endif
Return
//____________________
label
AbsStick var0
if !(Idling) && !(Dashing)
    Finish
endif
if InAir || XDistFrontEdge <= 5 || XDistBackEdge >= -5
    // if Running
    Finish
endif
Return
Return

