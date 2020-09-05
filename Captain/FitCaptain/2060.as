#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

// EDGEGUARD PART
LOGSTR str("ODistLedge")
LOGVAL OXDistFrontEdge
LOGVAL OYDistFrontEdge

#let AbsOXDistFrontEdge = var0
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge
if Equal OIsOnStage 0
    if NoOpponent && Equal CurrAction hex(0x75)
        Button R
    elif AbsOXDistFrontEdge < 50 && OYDistFrontEdge < 0 && CurrAction >= hex(0x74) && CurrAction <= hex(0x7B)
        if Rnd < 0.5
            Button X
        else
            Stick 0 (-1)
        endif
        Call EdgeguardHub
        Finish
    elif AnimFrame > 12 && AbsOXDistFrontEdge > 50
        Stick 0 (-1)
    elif AbsOXDistFrontEdge < 30 && OYDistFrontEdge < 30 && Equal CurrAction hex(0x75)
        Button R
    endif
    Return
endif

if !(Equal AirGroundState 3)
    Call AIHub
    Finish
endif

// OTHERWISE

#let rndVal = var1
rndVal=Rnd
if rndVal < 0.2
    Button X
    Finish
elif rndVal < 0.4
    Button A
    Finish
elif rndVal < 0.6
    Stick 1
    Finish
elif rndVal < 0.8
    Stick (-1)
    Finish
else
    // Button R
    Stick (-1) (-0.5)
    Finish
endif
Return
Return
