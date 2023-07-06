#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings
SetDisabledMd -1

if Equal lastScript hex(0x2050) && !(Equal AirGroundState 3) && YDistBackEdge < 0
    movePart = hex(0xFF)
    Call OnGotDamaged
endif

Cmd30
if Equal approachType at_OFF_LEDGE
    Seek _OL
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
    approachType = at_edgeguard
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
    if !(OutOfStage) && !(Equal CurrAction hex(0x74))
        Call AIHub
    endif 
    if Equal AirGroundState 2
        Seek
        Jump
    endif
    Return
endif

label getupOptions
#let oCloseness = var0
oCloseness = OTopNX - TopNX
#let absOCloseness = var1
absOCloseness = oCloseness
Abs absOCloseness
LOGVAL absOCloseness
LOGVAL OYDistBackEdge
movePart = 0

#let rndChoice = var2
rndChoice = Rnd
label _OL
lastScript = hex(0x2060)

if absOCloseness < 35 && Equal Direction OPos
    if rndChoice < 0.3 && LevelValue >= LV4 // offensive option
        label _OL1
        LOGSTR str("OL1")
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
        label
        if Equal CurrAction hex(0x75)
            Seek
            Jump
        endif
        Return
        label
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
            approachType = at_edgeguard
            movePart = 1
            {EDGEGUARD_ABOVE_MOVES}
            Finish
        endif
        Return
    endif
elif absOCloseness < 70 && Rnd < 0.35 && !(Equal OPos Direction) && OYDistBackEdge > -10
    label _OL2
    LOGSTR str("OL2")
    if Equal CurrAction hex(0x75)
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
            Seek
            Jump
        endif
        Return
    elif True
        label
        approachType = at_edgeguard
        {EDGEGUARD_BELOW_MOVES}
        Return
    endif
elif absOCloseness < 50 && !(Equal OPos Direction) && OYDistBackEdge < 35
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
        Stick 1 (-0.3)
        if YDistBackEdge >= -1
            Button X
        else
            Button R
            Call AIHub
        endif
    endif
    Return
endif

if Equal approachType at_OFF_LEDGE && Equal AirGroundState 2
    globTempVar = Rnd
    LOGVAL globTempVar
    if globTempVar < 1
        Seek _OL1
    elif globTempVar < 2
        Seek _OL2
    else
        Seek ledgedash
    endif
    Jump
endif

// OTHERWISE

// #let rndVal = var1
// rndVal=Rnd
// if rndVal < 0.2
//     Button X
// elif rndVal < 0.4
//     Button A
// elif rndVal < 0.6
//     Stick 1
// elif rndVal < 0.8
//     Stick (-1)
// else
//     // Button R
//     Stick (-1) (-0.5)
// endif
// SetAIMD 2 hex(0x8000)
Return
Return
