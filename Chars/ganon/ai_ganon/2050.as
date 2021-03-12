#include <Definition_AIMain.h>
//TrueID=0x2050
id 0x2050

//Set Unknown
unk 0x0

//Strings

if Rnd <= 0.5
    Seek _0
elif Rnd >= 0.6
    Seek _1
endif
Return
//____________________
label _0
var0=Rnd
Stick (-1)
if FrameGE 4
    Seek _2
endif
Return
//____________________
label _1
var0=Rnd
Stick (-1)
if FrameGE 4
    Seek _2
endif
Return
//____________________
label _2
if Rnd >= 0.3 && Rnd < 0.6
    Stick (-1)
elif Rnd < 0.3
    Stick (-1)
endif
if FramesSinceShield >= 40
    Button R
endif
if !(InAir) || FramesHitstun < 1
    Finish
endif
if FrameGE 15 && InAir
    Stick 0 1
endif
Return
