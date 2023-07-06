#include <Definition_AIMain.h>
//TrueID=0x2050
id 0x2050

//Set Unknown
unk 0x0

//Strings

if !(InAir) || FramesHitstun < 1
    Finish
endif
if Rnd <= 0.25
    Seek _0
elif Rnd > 0.25 && !(Rnd >= 0.5)
    Seek _1
elif Rnd > 0.5 && !(Rnd >= 0.75)
    Seek _2
elif Rnd > 0.75
    Seek _3
endif
Return
//____________________
label _0
var0=Rnd
Stick (-1) var0
if FrameGE 4
    Seek _4
endif
Return
//____________________
label _1
var0=Rnd
Stick 1 var0
if FrameGE 4
    Seek _4
endif
Return
//____________________
label _2
Stick 1
if FrameGE 4
    Seek _4
endif
Return
//____________________
label _3
Stick (-1)
if FrameGE 4
    Seek _4
endif
Return
//____________________
label _4
if YDistFloor <= 25 && YDistFloor > 0 && YSpeed < 0 && FramesSinceShield >= 40 && FramesHitstun > 0
    Button R
endif
if Rnd >= 0.3 && Rnd < 0.6
    Stick 1
elif Rnd < 0.3
    Stick (-1)
endif
if !(InAir) || FramesHitstun < 1
    Finish
endif
if FrameGE 15 && InAir
    Stick 0 1
endif
Return
