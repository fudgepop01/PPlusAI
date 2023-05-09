#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

if FrameGE 7
    if OIsOnStage > 0 && XDistLE 30
        Seek _4
    elif OIsOnStage > 0 && !(XDistLE 30) && XDistLE 60
        Seek _0
    elif OIsOnStage > 0 && !(XDistLE 60)
        Seek _1
    elif OIsOnStage < 1 && XDistLE 30
        Seek _2
    elif OIsOnStage < 1 && !(XDistLE 30)
        Seek _3
    endif
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
endif
if FrameGE 2 && !(FrameGE 3)
    Stick 0 1
endif
if FrameGE 12 && !(FrameGE 13)
    Stick 1 (-0.5)
    Button R
endif
if FrameGE 22
    Finish
endif
Return
//____________________
label _1
if FrameGE 0 && !(FrameGE 1)
    Stick 1
endif
Return
//____________________
label _2
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
endif
if FrameGE 2 && !(FrameGE 3)
    Stick 0.5 1
endif
if FrameGE 5 && !(FrameGE 6)
    var0=OYCoord
    var1=YCoord
    var2=var1+20
    var3=var1-20
    var10=OXCoord
    var11=XCoord
    var12=var11+40
    var13=var11-40
    if var0 <= var2 && var0 >= var3 && var10 <= var12 && var10 >= var13
        Stick (-1)
        Button A
    endif
endif
if FrameGE 8
    Finish
endif
Return
//____________________
label _3
if XDistLE 20 || FrameGE 30
    Button R
endif
Return
//____________________
label _4
if FrameGE 0 && !(FrameGE 1)
    Stick (-1)
endif
if FrameGE 2 && !(FrameGE 3)
    Stick 1 1
endif
if FrameGE 4 && !(FrameGE 5)
    Button A
endif
if FrameGE 5
    Finish
endif
Return

