#include <Definition_AIMain.h>
//TrueID=0x4010
id 0x4010

//Set Unknown
unk 0x00000

//Strings

SetTimeout 120
//____________________
label
if MeteoChance
    Finish
endif
if !(Idling) && !(Dashing)
    Return
endif
var0=OXCoord-XCoord
Abs var0
if var0 < 30
    Seek
    Jump
elif DistToOEdge > 10
    AbsStick OPos
    Return
endif
//____________________
label
AbsStick OPos
var0=OYCoord-YCoord
if OInAir
    if var0 < 20
        if Rnd < 0.5
            Seek
        else
            Seek _0
            if XDistLE 20
                Jump
            endif
        endif
    elif var0 < 60
        SetFrame 0
        Seek _0
        if XDistLE 20
            Jump
        endif
    endif
else
    Finish
endif
Return
//____________________
label
var0=OYCoord-YCoord
if Dashing
    Call Unk3040
endif
//____________________
label
var0=OYCoord-YCoord
if var0 > 15
    // AtkDiceRoll slot5
    Call slot5
else
    // AtkDiceRoll slot0
    Call slot0
endif
Finish
//____________________
label _0
Button X
EstOXCoord var1 10
var1 -= XCoord
AbsStick var1
if FrameGE 3
    Call AerialCombo
    Finish
endif
Return

