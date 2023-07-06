#include <Definition_AIMain.h>
//TrueID=0x10A1
id 0x10A1

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

if !(InAir) && Idling && DistFrontEdge <= 60 && LevelValue > 60
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
if FrameGE 10 && !(FrameGE 13)
    Button B
endif
if FrameGE 18
    Stick 0 (-1)
endif
if FrameGE 20 && !(InAir)
    Finish
endif
Return
