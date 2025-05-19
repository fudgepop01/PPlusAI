#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x00000

//Strings

if FrameGE 7
    if OIsOnStage > 0
        Seek _0
    elif OIsOnStage < 1
        Seek _6
    endif
endif
Return
//____________________
label _0
var0=Rnd
var1=LevelValue
if var0 <= 0.2 && var1 > 60
    Seek _1
elif var0 > 0.2 && var0 <= 0.4 && var1 > 60
    Seek _2
elif var0 > 0.4 && var0 <= 0.6 && var1 > 60
    Seek _3
elif var0 > 0.6 && var0 <= 0.8
    Seek _4
elif var0 > 0.8 && var1 > 60
    Seek _5
else
    Seek _4
endif
Return
//____________________
label _1
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
endif
if FrameGE 3 && !(FrameGE 4)
    Stick 1 1
endif
if FrameGE 8 && !(FrameGE 13)
    ClearStick
    Stick 1 (-0.5)
    Button R
endif
Return
//____________________
label _2
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
endif
if FrameGE 3 && !(FrameGE 4)
    ClearStick
    Stick 0 1
endif
if FrameGE 6 && !(FrameGE 7)
    Stick 0 1
    Button B
endif
Return
//____________________
label _3
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
endif
if FrameGE 3 && !(FrameGE 4)
    ClearStick
    Stick 0 1
endif
if FrameGE 8 && !(FrameGE 9)
    ClearStick
    Stick 1
    Button B
endif
Return
//____________________
label _4
if FrameGE 4 && !(FrameGE 5)
    ClearStick
    Button A
endif
Return
//____________________
label _5
if FrameGE 0 && !(FrameGE 1)
    Stick 0 (-1)
endif
if FrameGE 3 && !(FrameGE 5)
    Stick 1 1
endif
if FrameGE 14 && !(FrameGE 15)
    Button B
endif
if FrameGE 29 && !(FrameGE 30)
    Button B
endif
Return
//____________________
label _6
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
    Finish
endif
Return
