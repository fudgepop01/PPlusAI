#include <Definition_AIMain.h>
//TrueID=0x10
id 0x8010

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

if Idling && !(InAir)
    Seek
endif
Return
//____________________
label
AbsStick OPos
if XDistLE 20 || XDistFrontEdge <= 20
    Seek
endif
Return
//____________________
label
if XDistLE 20 && OYCoord <= 25 && !(Back)
    Seek _0
elif XDistLE 20 && OYCoord <= 25 && Back
    Seek _1
elif XDistLE 40 && OYCoord <= 30 && !(Back)
    Seek _2
elif XDistLE 40 && !(OYCoord <= 30) && OYCoord < 50 && !(Back)
    Seek _3
endif
Return
//____________________
label _0
if FrameGE 0 && !(FrameGE 1)
    Stick 1
    Button A
endif
if FrameGE 5
    Finish
endif
Return
//____________________
label _1
if FrameGE 0 && !(FrameGE 1)
    Stick 0 0.3
    Button A
endif
if FrameGE 5
    Finish
endif
Return
//____________________
label _2
if FrameGE 0 && !(FrameGE 1)
    Stick 0 1
endif
if InAir && ODamage > 45
    ClearStick
    Stick (-1)
    Button A
    Seek _4
elif InAir && ODamage <= 45
    ClearStick
    Stick 1
    Button A
    Seek _4
endif
Return
//____________________
label _3
if FrameGE 0 && !(FrameGE 6)
    Stick 0 1
endif
if InAir
    ClearStick
    Stick 1
    Button A
    Seek _4
endif
Return
//____________________
label _4
if !(InAir)
    Finish
endif
Return
