#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

//____________________
label _0
if FrameGE 7 && !(FrameGE 8) && !(XDistLE 30) && OIsOnStage > 0
    Stick 1
elif FrameGE 7 && !(FrameGE 8) && OIsOnStage < 1
    Seek _1
elif FrameGE 7 && !(FrameGE 8) && XDistLE 30
    Seek _1
endif
if FrameGE 9 && !(FrameGE 10)
    Stick 0 1
endif
if XCoord > 0
    var15=-1
elif XCoord < 0
    var15=1
endif
if FrameGE 10 && !(FrameGE 11)
    AbsStick var15
    Button B
endif
if FrameGE 11 && !(InAir)
    Finish
endif
Return
//____________________
label
if XDistLE 10
    if FrameGE 0 && !(FrameGE 1)
        Stick (-1)
    endif
    if FrameGE 1 && !(FrameGE 2)
        Stick 0 1
    endif
    if FrameGE 4 && !(FrameGE 5)
        Stick (-1)
        Button A
    endif
    if XDistFrontEdge > 0
        var15=1
    elif XDistBackEdge > 0
        var15=-1
    endif
    if FrameGE 5
        Stick var15
    endif
    if !(InAir)
        Finish
    endif
endif
Return
//____________________
label _1
if FrameGE 0 && !(FrameGE 1)
    Button R
endif
if FrameGE 1
    Finish
endif
Return
