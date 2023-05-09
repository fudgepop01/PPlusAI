#include <Definition_AIMain.h>
//TrueID=0x4010
id 0x4010

//Set Unknown
unk 0x0

//Strings

if FrameGE 0 && !(FrameGE 900)
    Seek _0
endif
Return
//____________________
label _0
if CurrAction >= 21 && CurrAction <= 22
    Call ComboG0
endif
if PrevAction >= 40 && PrevAction < 41
    Call ComboG1
endif
if PrevAction >= 60 && PrevAction < 61
    Finish
endif
if PrevAction >= 36 && PrevAction < 37
    Finish
endif
if PrevAction >= 39 && PrevAction < 40
    Seek _5
endif
if PrevAction >= 38 && PrevAction < 39
    Finish
endif
if PrevAction >= 44 && PrevAction < 45
    Finish
endif
if PrevAction >= 47 && PrevAction < 48
    Finish
endif
if PrevAction >= 51 && PrevAction < 52
    Seek _3
endif
if CurrAction >= 277 && CurrAction < 278
    Seek _2
endif
if FrameGE 5
    Finish
endif
Return
//____________________
label _1
//____________________
label _2
if DistBackEdge <= 30
    Stick 0 1
    Finish
endif
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 6 && !(FrameGE 7)
    Stick (-1) (-0.5)
    Button R
    Finish
endif
if FrameGE 16
    Finish
endif
Return
//____________________
label _3
AbsStick OPos
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 6 && !(FrameGE 7)
    ClearStick
    Button A
    Finish
endif
Return
//____________________
label _4
if FrameGE 0 && !(FrameGE 1)
    Stick 1
    Button A
    Finish
endif
Return
//____________________
label _5
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 10 && !(FrameGE 11)
    Button B
endif
if FrameGE 18
    Stick 0 (-1)
endif
if FrameGE 20 && !(InAir)
    Finish
endif
Return

