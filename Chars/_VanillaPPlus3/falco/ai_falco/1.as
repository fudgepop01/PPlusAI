#include <Definition_AIMain.h>
//TrueID=0x1
id 0x8001

//Set Unknown
unk 0x00000

//Strings

if FrameGE 0 && !(FrameGE 6)
    AbsStick OPos 1
endif
if FrameGE 6
    AbsStick OPos
    if XDistLE 25 || !(InAir)
        Finish
    endif
endif
Return
//____________________
label _0
var20=YCoord+30
if OYCoord > var20
    Call routine0x8001
endif
Return
