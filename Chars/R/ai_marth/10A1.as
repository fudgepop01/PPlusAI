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

Button B
if OYCoord >= -40 && !(OYCoord >= 40) && XDistLE 40
    Finish
endif
if !(OInAir)
    Finish
endif
Return
