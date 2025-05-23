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
if CurrAction >= 121 && CurrAction <= 123
    AbsStick OPos
    Call ApproachHub
elif !(Equal AirGroundState 3) && MeteoChance
    Call EdgeguardHub
    Finish
elif Equal AirGroundState 2 && Equal var21 32769 && !(MeteoChance)
    var21 = 8288
    Call ApproachHub
    Finish
elif Equal AirGroundState 2 && Equal var21 33028 && !(MeteoChance)
    var21 = 8288
    Call ApproachHub
    Finish
elif Equal AirGroundState 1
    Call AIHub
endif

var0 = OXDistFrontEdge
Abs var0

if !(Equal CurrAction 117)
    Return
endif

label getupOptions
var0 = OTopNX - TopNX
var1 = var0
Abs var1

var2 = Rnd
if var1 < 35 && Equal Direction OPos
    if var2 < 0.3 && LevelValue >= 31 // offensive option
        label
        if Equal CurrAction 117
            if NumFrames > 1
                SetFrame 0
            endif
            if Equal NumFrames 1
                Stick -1
            endif
        else
            Stick 1
            Button X
            var18 = 1
            var2 = Rnd
            if var2 < 0.4
                Call UAir
            elif var2 < 0.8
                Call NAir
            else
                Call DAir
            endif
        endif
        Return
    elif var2 < 0.4 && LevelValue >= 60 // ledgedash
        Seek ledgedash
        Jump
    elif var2 < 0.7 && LevelValue >= 60
        var16 = 5
        Stick -1 0
        Call RecoveryHub
    elif Equal CurrAction 117
        Button R
        Finish
    endif
elif var1 > 35 && Equal OPos Direction
    if var2 < 0.6 && LevelValue >= 75 // ledgedash
        Seek ledgedash
        Jump
    elif var2 < 0.8
        var16 = 5
        Stick -1 0
        Call RecoveryHub
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
            Call BAir
            Finish
        endif
        Return
    endif
elif var1 < 70 && Rnd < 0.1 && !(Equal OPos Direction)
    label
    if Equal CurrAction 117
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            Stick -1
        endif
        Return
    elif YSpeed <= 0
        if Equal NumFrames 2
            var16 = 3
            if OYDistBackEdge < 10
                Call UAir
            elif OYDistBackEdge > 50
                Call DAir
            else
                Call BAir
            endif
        endif
        Return
    endif
elif var1 < 50 && !(Equal OPos Direction)
    label
    if Equal CurrAction 117 && var1 > 30
        if NumFrames > 1
            SetFrame 0
        endif
        if Equal NumFrames 1
            var16 = 5
            Stick -1 0
            Call RecoveryHub
        endif
        Return
    endif
    if !(MeteoChance) || (Equal OCurrAction 189)
        Seek getupOptions
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

