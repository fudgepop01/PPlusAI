#include <Definition_AIMain.h>
//TrueID=0x4010
id 0x4010

//Set Unknown
unk 0x0

//Strings

if OBlown && OXSpeed < 1
    Call DodgeWhenAttacked
endif
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
elif DistToOEdge > 2
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
        endif
    elif var0 < 60
        SetFrame 0
        Seek _0
    endif
else
    Finish
endif
Return
//____________________
label
var0=OYCoord-YCoord
if Dashing
    Call RollF
endif
//____________________
label
var0=OYCoord-YCoord
if var0 > 15
    AtkDiceRoll slot5
    Call 
else
    AtkDiceRoll slot0
    Call 
endif
Finish
//____________________
label _0
Button X
AbsStick OPos
if FrameGE 3
    Call AerialCombo
    Finish
endif
Return
