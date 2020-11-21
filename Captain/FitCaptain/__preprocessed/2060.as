#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

if Equal AIMD 2
    Call EdgeguardHub
endif

var0 = OXDistFrontEdge
Abs var0
if Equal OIsOnStage 0 && Equal AirGroundState 3
    if NoOpponent && Equal CurrAction 117
        Button R
    elif !(MeteoChance)
        Button R
    elif var0 > 10 && var0 < 50 && OYDistFrontEdge < 40 && Equal CurrAction 117 && AnimFrame > 7 && Rnd < 0.3
        if OYDistFrontEdge < -10
            Button X
        else
            Stick -1
        endif
        // SetAIMD 2 8288
        Return
    elif AnimFrame > 12 && var0 > 35
        var19 = 254
        Stick 0 (-1)
        Call AIHub
        Finish
    elif var0 < 30 && OYDistFrontEdge < 30 && Equal CurrAction 117 && AnimFrame > 7
        Button R
    endif
    Return
endif

if !(Equal AirGroundState 3)
    Call EdgeguardHub
    Finish
endif

if !(Equal CurrAction 117)
    Return
endif

// OTHERWISE

var1=Rnd
if var1 < 0.2
    Button X
elif var1 < 0.4
    Button A
elif var1 < 0.6
    Stick 1
elif var1 < 0.8
    Stick (-1)
else
    // Button R
    Stick (-1) (-0.5)
endif
// SetAIMD 2 32768
Finish
Return
Return

