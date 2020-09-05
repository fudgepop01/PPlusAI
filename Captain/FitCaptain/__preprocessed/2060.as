#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

// EDGEGUARD PART
LOGSTR 1329883392 1937001472 1701078784 1694498816 0
LOGVAL OXDistFrontEdge
LOGVAL OYDistFrontEdge

var0 = OXDistFrontEdge
Abs var0
if Equal OIsOnStage 0
    if NoOpponent && Equal CurrAction 117
        Button R
    elif var0 < 50 && OYDistFrontEdge < 0 && CurrAction >= 116 && CurrAction <= 123
        if Rnd < 0.5
            Button X
        else
            Stick 0 (-1)
        endif
        Call EdgeguardHub
        Finish
    elif AnimFrame > 12 && var0 > 50
        Stick 0 (-1)
    elif var0 < 30 && OYDistFrontEdge < 30 && Equal CurrAction 117
        Button R
    endif
    Return
endif

if !(Equal AirGroundState 3)
    Call AIHub
    Finish
endif

// OTHERWISE

var1=Rnd
if var1 < 0.2
    Button X
    Finish
elif var1 < 0.4
    Button A
    Finish
elif var1 < 0.6
    Stick 1
    Finish
elif var1 < 0.8
    Stick (-1)
    Finish
else
    // Button R
    Stick (-1) (-0.5)
    Finish
endif
Return
Return

