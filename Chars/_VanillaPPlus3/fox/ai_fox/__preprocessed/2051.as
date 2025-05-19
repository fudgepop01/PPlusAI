#include <Definition_AIMain.h>
//TrueID=0x2051
id 0x2051

//Set Unknown
unk 0x0

//Strings

if !(InAir) || FramesHitstun < 1
    Finish
endif
var0=Rnd
Stick 1 var0
if FrameGE 5
    Seek
endif
Return
//____________________
label
if !(InAir) || FramesHitstun < 1
    Finish
endif
if Rnd >= 0.3 && Rnd < 0.6
    Stick 1
elif Rnd < 0.3
    Stick (-1)
endif
if FramesSinceShield >= 40
    Button R
endif
Return

