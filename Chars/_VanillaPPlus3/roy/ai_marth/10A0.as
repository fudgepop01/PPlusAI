#include <Definition_AIMain.h>
//TrueID=0x10A0
id 0x10A0

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

if !(InAir) && Idling
    Seek
else
    Finish
endif
Return
//____________________
label
if XDistFrontEdge > 20
    Seek _0
endif
if XDistFrontEdge < 20
    Seek _1
endif
Return
//____________________
label _0
AbsStick OPos
if XDistFrontEdge < 20
    Seek _2
endif
Return
//____________________
label _1
if OYCoord >= 40
    Call BlockRecovery1
endif
if OYCoord >= 10 && !(OYCoord >= 40)
    Call BlockRecovery2
endif
if OYCoord < 10
    Call BlockRecovery3
endif
Return
//____________________
label _2
if FrameGE 0 && !(FrameGE 5)
    Stick 0 (-1)
endif
if FrameGE 5 && OYCoord >= -40 && !(OYCoord >= 40) && XDistLE 40
    Stick 1
    Button A
else
    Finish
endif
Return
