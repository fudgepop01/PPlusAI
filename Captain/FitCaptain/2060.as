#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

// EDGEGUARD PART
// LOGSTR str("ODistLedge")
// LOGVAL OXDistFrontEdge
// LOGVAL OYDistFrontEdge

#let AbsOXDistFrontEdge = var0
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge
if Equal OIsOnStage 0 && Equal AirGroundState 3
    if NoOpponent && Equal CurrAction hex(0x75)
        Button R
    elif !(MeteoChance)
        Button R
    elif AbsOXDistFrontEdge > 10 && AbsOXDistFrontEdge < 50 && OYDistFrontEdge < 40 && Equal CurrAction hex(0x75) && AnimFrame > 7 && Rnd < 0.1
        if OYDistFrontEdge < -10
            Button X
        else
            Stick -1
        endif
        SetAIMD 2 hex(0x8003)
        Call EdgeguardHub
        Finish
    elif AnimFrame > 12 && AbsOXDistFrontEdge > 50
        Stick 0 (-1)
        Call AIHub
        Finish
    elif AbsOXDistFrontEdge < 30 && OYDistFrontEdge < 30 && Equal CurrAction hex(0x75) && AnimFrame > 7
        Button R
    endif
    Return
endif

if !(Equal AirGroundState 3)
    Call EdgeguardHub
    Finish
endif

if !(Equal CurrAction hex(0x75))
    Return
endif

// OTHERWISE

#let rndVal = var1
rndVal=Rnd
if rndVal < 0.2
    Button X
elif rndVal < 0.4
    Button A
elif rndVal < 0.6
    Stick 1
elif rndVal < 0.8
    Stick (-1)
else
    // Button R
    Stick (-1) (-0.5)
endif
SetAIMD 2 hex(0x8000)
Finish
Return
Return
