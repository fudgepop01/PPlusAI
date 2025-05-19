#include <Definition_AIMain.h>
//TrueID=0x5000
id 0x5000

//Set Unknown
unk 0x00000

//Strings

var0=Rnd
if FrameGE 0 && !(FrameGE 1) && !(XDistLE 3) && XDistLE 30 && var0 < 0.6
    Stick 1
    Button A
    Finish
elif FrameGE 0 && !(FrameGE 1) && !(XDistLE 3) && XDistLE 30 && var0 >= 0.6
    Seek
elif FrameGE 0 && !(FrameGE 1) && !(XDistLE 3) && !(XDistLE 30)
    Call ATKMidB
elif FrameGE 0 && !(FrameGE 1) && XDistLE 3 && var0 < 0.6
    Stick 0 (-1)
    Button B
    Finish
elif FrameGE 0 && !(FrameGE 1) && XDistLE 3 && var0 >= 0.6
    Button A | R
    Finish
else
    Finish
endif
Return
//____________________
label
AbsStick OPos
if FrameGE 4 && !(FrameGE 5)
    Stick 0 1
endif
if FrameGE 10 && !(FrameGE 11)
    Button A
    Finish
endif
Return

