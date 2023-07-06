#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

//Set Unknown
unk 0x140000

//Strings
str "#jump_start_f"
str "#meteo_range"
str "#atk_range_base"
str "#atk_range_rnd"
str "#quick_range1"
str "#quick_range2"
str "#dash_range"

if !(InAir) && Idling && LevelValue > 60
    Seek
else
    Finish
endif
Return
//____________________
label
if XDistLE 30
    Finish
endif
AbsStick OPos
if InAir
    Seek
endif
Return
//____________________
label
if FrameGE 13 && !(FrameGE 16)
    Stick (-1) 1
endif
if FrameGE 17 && !(FrameGE 18)
    Stick 1
endif
if FrameGE 24 && !(FrameGE 25)
    Button B
endif
if FrameGE 39 && !(FrameGE 40)
    Button B
    Finish
endif
Return
