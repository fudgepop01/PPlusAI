#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

if Equal var21 8272 && !(Equal AirGroundState 3) && YDistBackEdge < 0
    var18 = 255
    Call OnGotDamaged
endif

Cmd30
if Equal var16 8
    Seek _OL
    Jump
endif
if Equal var21 32768
    if FramesHitstun > 0 || Equal CurrAction 73
        Call AIHub
    endif
endif

// if Equal AIMD 2
//     Call EdgeguardHub
// endif

var16 = 1 // default

// we're unable to actually break out of this routine during the ledgejump
// actions, so I need to force the character to move to the target here
if CurrAction >= 121 && CurrAction <= 123
    AbsStick OPos
    var16 = 3
    Call ApproachHub
elif Equal AirGroundState 2 && Equal var21 32769 && !(MeteoChance)
    var21 = 8288
    Call ApproachHub
    Finish
elif Equal AirGroundState 1
    Call AIHub
endif

var0 = OXDistFrontEdge
Abs var0

if !(Equal CurrAction 117)
    if !(OutOfStage) && !(Equal CurrAction 116)
        Call AIHub
    endif 
    if Equal AirGroundState 2
        Seek
        Jump
    endif
    Return
endif

label getupOptions
var0 = OTopNX - TopNX
var1 = var0
Abs var1
LOGVAL var1
LOGVAL OYDistBackEdge
var18 = 0

var2 = Rnd
label _OL
if var1 < 35 && Equal Direction OPos
    if var2 < 0.3 && LevelValue >= 31 // offensive option
        label _OL1
        LOGSTR 1330393344 0 0 0 0
        if Equal CurrAction 117
            if NumFrames > 1
                SetFrame 0
            endif
            if Equal NumFrames 1
                Stick -1
                var16 = 8
            endif
        else
            Stick 1
            Button X
            var18 = 1
            var2 = Rnd
            var16 = 5
    if var2 < 0.1
        var18 = 0
        Call USpecial
    elif var2 < 0.35
        var18 = 0
        Call DAir
    else
        Call FAir
    endif
        endif
        Return
    elif var2 < 0.4 && LevelValue >= 60 // ledgedash
        Seek ledgedash
        Jump
    elif var2 < 0.7 && LevelValue >= 60
        label
        if Equal CurrAction 117
            Seek
            Jump
        endif
        Return
        label
        var16 = 5
        Stick 0 (-1)
        Call AIHub
    elif Equal CurrAction 117
        Button R
        Finish
    endif
elif var1 > 35 && Equal OPos Direction
    if var2 < 0.4 && LevelValue >= 75 // ledgedash
        Seek ledgedash
        Jump
    elif var2 < 0.8
        var16 = 5
        Stick 0 (-1)
        Call AIHub
    else
        Button X
        Call AIHub
    endif
elif var1 < 50 && OYDistBackEdge < -15
    if Equal CurrAction 117
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Button X
            var16 = 3
            var18 = 1
    Call BAir
            Finish
        endif
        Return
    endif
elif var1 < 70 && Rnd < 0.35 && !(Equal OPos Direction) && OYDistBackEdge > -10
    label _OL2
    LOGSTR 1330393600 0 0 0 0
    if Equal CurrAction 117
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
        var16 = 3
    if OYDistBackEdge > 35
        Call DAir
    else
        Call BAir
    endif
        Return
    endif
elif var1 < 50 && !(Equal OPos Direction) && OYDistBackEdge < 35
    label
    if Equal CurrAction 117 && var1 > 30
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            var16 = 5
            Stick 0 (-1)
            Call AIHub
        endif
        Return
    endif
    if !(MeteoChance) || (Equal OCurrAction 189)
        Seek getupOptions
    endif
    Return
else
    var0 = Rnd * 25 + 10
    label
    var0 -= 1
    if OYDistBackEdge < 35 && var1 < 50
        Button R
    endif
    if var0 < 0
        if Rnd < 0.25
            Seek getupOptions
        else
            var16 = 5
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
    elif Equal CurrAction 117
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
            var16 = 8
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

if Equal var16 8 && Equal AirGroundState 2
    var17 = Rnd
    LOGVAL var17
    if var17 < 1
        Seek _OL1
    elif var17 < 2
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
// SetAIMD 2 32768
Return
Return

