#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

// if Equal AIMD 2
//     Call EdgeguardHub
// endif

// we're unable to actually break out of this routine during the ledgejump
// actions, so I need to force the character to move to the target here
if CurrAction >= hex(0x79) && CurrAction <= hex(0x7B)
    AbsStick OPos
    Call ApproachHub
elif !(Equal AirGroundState 3) && MeteoChance
    Call EdgeguardHub
    Finish
elif Equal AirGroundState 2 && Equal lastScript hex(0x8001) && !(MeteoChance)
    lastScript = hex(0x2060)
    Call ApproachHub
    Finish
elif Equal AirGroundState 1
    Call AIHub
endif

#let AbsOXDistFrontEdge = var0
AbsOXDistFrontEdge = OXDistFrontEdge
Abs AbsOXDistFrontEdge

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
            if rndChoice < 0.1
                Call USpecial
            elif rndChoice < 0.45
                Call NAir
            else
                Call FAir
            endif
        endif
        Return
    elif rndChoice < 0.4 && LevelValue >= LV7 // ledgedash
        Seek ledgedash
        Jump
    elif rndChoice < 0.7 && LevelValue >= LV7
        approachType = at_ledgeRefresh
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
        approachType = at_ledgeRefresh
        Stick 0 (-1)
        Call AIHub
    else
        Button X
        Call AIHub
    endif
elif absOCloseness < 50 && OYDistBackEdge < -15
    if Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Button X
            Call BAir
            Finish
        endif
        Return
    endif
elif absOCloseness < 70 && Rnd < 0.1 && !(Equal OPos Direction)
    label
    if Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
        endif
        Return
    elif YSpeed <= 0
        if Equal NumFrames 2
            approachType = at_edgeguard
            if OYDistBackEdge > 50
                Call DAir
            else
                Call BAir
            endif
        endif
        Return
    endif
elif absOCloseness < 50 && !(Equal OPos Direction)
    label
    if Equal CurrAction hex(0x75) && absOCloseness > 30
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            approachType = at_ledgeRefresh
            Stick 0 (-1)
            Call AIHub
        endif
        Return
    endif
    if !(MeteoChance) || (Equal OCurrAction hex(0xBD))
        Seek getupOptions
    endif
    Return
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
        Stick 1 (-0.3)
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
if rndVal < 0.02
    Button X
elif rndVal < 0.5
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
