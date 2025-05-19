#include <Definition_AIMain.h>
//TrueID=0x10A2
id 0x10A2

//Set Unknown
unk 0x00000

//Strings
str "#jump_start_f"
str "#meteo_range"
str "#atk_range_base"
str "#atk_range_rnd"
str "#quick_range1"
str "#quick_range2"
str "#dash_range"

if !(InAir) && Idling && !(XDistLE 30)
    Seek
else
    Finish
endif
Return
//____________________
label
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if FrameGE 10 && !(FrameGE 11)
    ClearStick
    Button B
endif
if FrameGE 18
    Stick 0 (-1)
endif
if FrameGE 20 && !(InAir)
    Finish
endif
Return
