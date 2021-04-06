#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

Cmd30
if Equal approachType at_OFF_LEDGE
    Seek getupOptions
    Jump
endif
if Equal lastScript hex(0x8000)
    if FramesHitstun > 0 || Equal CurrAction hex(0x49)
        Call AIHub
    endif
endif

// if Equal AIMD 2
//     Call EdgeguardHub
// endif

approachType = at_attack

// we're unable to actually break out of this routine during the ledgejump
// actions, so I need to force the character to move to the target here
if CurrAction >= hex(0x79) && CurrAction <= hex(0x7B)
    AbsStick OPos
    Call ApproachHub
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
LOGVAL absOCloseness

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
                approachType = at_OFF_LEDGE
            endif
        else
            Stick 1
            Button X
            movePart = 1
            rndChoice = Rnd
            approachType = at_ledgeRefresh
            {OFFENSIVE_ONSTAGE_MOVES}
        endif
        Return
    elif rndChoice < 0.4 && LevelValue >= LV7 // ledgedash
        Seek ledgedash
        Jump
    elif rndChoice < 0.7 && LevelValue >= LV7
        LOGSTR str("refresh")
        approachType = at_ledgeRefresh
        Stick 0 (-1)
        Call AIHub
    elif Equal CurrAction hex(0x75)
        Button R
        Finish
    endif
elif absOCloseness > 35 && Equal OPos Direction
    if rndChoice < 0.4 && LevelValue >= LV8 // ledgedash
        Seek ledgedash
        Jump
    elif rndChoice < 0.8
            LOGSTR str("refresh")
        approachType = at_ledgeRefresh
        Stick 0 (-1)
        Call AIHub
    else
        Button X
        Call AIHub
    endif
elif absOCloseness < 50 && OYDistBackEdge > 15
    if Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Button X
            {EDGEGUARD_ABOVE_MOVES}
            Finish
        endif
        Return
    endif
elif absOCloseness < 70 && Rnd < 0.25 && !(Equal OPos Direction) && OYDistBackEdge < 35
    label
    if Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
            approachType = at_OFF_LEDGE
        endif
        Return
    elif YSpeed <= 0
        if Equal NumFrames 2
            approachType = at_edgeguard
            {EDGEGUARD_BELOW_MOVES}
        endif
        Return
    endif
elif absOCloseness < 50 && !(Equal OPos Direction) && OYDistBackEdge < 35
    label
    if Equal CurrAction hex(0x75) && absOCloseness > 30
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            LOGSTR str("refresh")
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
else
    #let timer = var0
    timer = Rnd * 25 + 10
    label
    timer -= 1
    if OYDistBackEdge < 35 && absOCloseness < 50
        Button R
    endif
    if timer < 0
        if Rnd < 0.25
            Seek getupOptions
        else
            LOGSTR str("refresh")
            approachType = at_ledgeRefresh
            Stick 0 (-1)
            Call AIHub
        endif
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
            approachType = at_OFF_LEDGE
        endif
    else
        Stick 1
        if YDistBackEdge > 4
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
Return
Return
