#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

// if Equal AIMD 2
//     Call EdgeguardHub
// endif

if !(Equal AirGroundState 3)
    Call EdgeguardHub
    Finish
endif

#let AbsOXDistFrontEdge = var0
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge
if Equal OIsOnStage 0 && Equal AirGroundState 3
    if OXDistFrontEdge > 10 || OYDistBackEdge < 0
        if NoOpponent && Equal CurrAction hex(0x75)
            Button R
        elif !(MeteoChance)
            Button R
        elif AbsOXDistFrontEdge > 20 && AbsOXDistFrontEdge < 50 && OYDistFrontEdge < 30 && Equal CurrAction hex(0x75) && AnimFrame > 7 && Rnd < 0.3
            if OYDistFrontEdge < -10
                Button X
            else
                Stick -1
            endif
            Return
        elif AbsOXDistFrontEdge > 80 && AnimFrame > 7
            Button R
        elif AbsOXDistFrontEdge < 30 && OYDistFrontEdge < 30 && Equal CurrAction hex(0x75) && AnimFrame > 7
            Button R
        elif AnimFrame > 12 && AbsOXDistFrontEdge > 45 && AbsOXDistFrontEdge < 80
            moveVariant = mv_ledgeRefresh
            Stick 0 (-1)
            Call AIHub
            Finish
        endif
        Return
    endif
endif

if !(Equal CurrAction hex(0x75))
    Return
endif

label getupOptions
#let oCloseness = var0
oCloseness = OTopNX - TopNX
#let absOCloseness = var1
absOCloseness = oCloseness
Abs absOCloseness

#let rndChoice = var2
rndChoice = Rnd
if absOCloseness < 35 && Equal Direction OPos
    if rndChoice < 0.3 && LevelValue >= LV4 // offensive option
        label
        if Equal CurrAction hex(0x75)
            if NumFrames > 1
                SetFrame 0
            endif
            if Equal NumFrames 1
                Stick -1
            endif
        else
            Stick 1
            Button X
            movePart = 1
            rndChoice = Rnd
            if rndChoice < 0.4
                Call UAir
            elif rndChoice < 0.8
                Call NAir
            else
                Call DAir
            endif
        endif
        Return
    elif rndChoice < 0.4 && LevelValue >= LV7 // ledgedash
        Seek ledgedash
        Jump
    elif rndChoice < 0.7 && LevelValue >= LV7
        moveVariant = mv_ledgeRefresh
        Stick 0 (-1)
        Call AIHub
    elif Equal CurrAction hex(0x75)
        Button R
        Finish
    endif
elif absOCloseness > 35 && Equal OPos Direction
    if rndChoice < 0.6 && LevelValue >= LV8 // ledgedash
        Seek ledgedash
        Jump
    elif rndChoice < 0.8
        moveVariant = mv_ledgeRefresh
        Stick 0 (-1)
        Call AIHub
    else
        Button X
        Call AIHub
    endif
elif absOCloseness < 25
    if Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
        endif
    elif True
        if YDistBackEdge < 10
            Call UAir
        else
            Call BAir
        endif
    endif
endif

if !(True)
    label ledgedash
    if FramesHitstun > 0
        Call AIHub
    elif Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
        endif
    else
        Stick 1
        if YDistBackEdge > 5
            Button X
        else
            Button R
            Call AIHub
        endif
    endif
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
// SetAIMD 2 hex(0x8000)
Finish
Return
Return
