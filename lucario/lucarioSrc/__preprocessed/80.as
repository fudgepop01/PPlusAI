#include <Definition_AIMain.h>
//TrueID=0x80
id 0x80

//Set Unknown
unk 0x20000

//Strings

Call AIHub

if InAir
    Seek _0
    Jump
endif
SetTimeout 20
//____________________
label
if MeteoChance
    Finish
endif
if !(Idling) && !(Dashing)
    Return
endif
SetTimeout 180
Seek
Jump
Return
//____________________
label _1
if MeteoChance
    Finish
endif
if FrameGE 10 && !(InAir)
    Finish
endif
if Falling
    if ODistLE 15
        Call Unk1080
        Finish
    endif
endif
var0=(OXCoord-XCoord)*ODirection
if var0 > 10
    if Falling && ODistLE 40
        Call Unk1080
    endif
    Finish
endif
if Falling && !(OutOfStage) && DistFrontEdge < 10
    Call Unk1080
    Finish
endif
var1=ODirection*(-1)
AbsStick var1
if !(FrameGE 20)
    Stick 0 1
endif
if FrameGE 30 && NumJumps > 0 && YSpeed < 0
    Seek
    SetTimeout 180
endif
Return
//____________________
label _0
if MeteoChance
    Finish
endif
var1=ODirection*(-1)
AbsStick var1
if FrameGE 3
    if OutOfStage
        EdgeCheck (-1)
    elif NumJumps < 2
        EdgeCheck 10
    endif
    Seek _1
endif
Return
Return

