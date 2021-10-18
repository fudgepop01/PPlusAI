#include <Definition_AIMain.h>
//TrueID=0x4067
id 0x4067

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if !(InAir) && Idling
    Seek
endif
Return
//____________________
label
var0=OPos
var1=OPos*(-1)
if FrameGE 0 && !(FrameGE 6)
    AbsStick var1
endif
if FrameGE 6 && !(FrameGE 12)
    AbsStick var0
endif
if FrameGE 12 && !(FrameGE 13)
    Stick 0 1
endif
if FrameGE 13 && !(FrameGE 14)
    Button A | R
endif
if Grabbing
    Seek
endif
if FrameGE 14
    Finish
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
    Call UAir
endif
if FrameGE 1
    Finish
endif
Return
