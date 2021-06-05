#include <Definition_AIMain.h>
//TrueID=0x70
id 0x8070

//Set Unknown
unk 0x0

//Strings

TRACK_O_OPTIONS

if DistFrontEdge < 25 || !(ODistLE 60) || InAir
    Goto _end
elif DistBackEdge < 25 || !(ODistLE 60) || InAir
    Goto _end
endif
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Button X
endif
if InAir
    Button R
    if ODistLE 40
        globTempVar = OPos * -1
        AbsStick globTempVar (-1)
    else
        AbsStick OPos (-1)
    endif
endif
if FrameGE 10
    Goto _end
endif
Return

label _end
FORCED_SWITCH_CONDITIONS
Call AIHub
Return
Return
