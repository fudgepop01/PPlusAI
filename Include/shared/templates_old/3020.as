// forcibly handles shields
#include <Definition_AIMain.h>
//TrueID=0x3020
id 0x3020

//Set Unknown
unk 0x00000

//Strings

TRACK_O_OPTIONS

if FramesHitstun > 0 || Equal CurrAction hex(0x45)
    Call OnGotDamaged
endif

if Rnd < 0.35
    movePart = 1
    Call FakeOutHub
endif

if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif

GetShieldRemain var0
if var0 < 20
    Finish
endif

if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif

label

if Rnd < 0.2 && Equal LevelValue LV9 && Equal AirGroundState 1 && Damage < 60
    SetFrame 0
    label
    Stick 0 (-1)
    if NumFrames >= 40
        Call AIHub
    elif FramesHitstun > 0
        Call OnGotDamaged
    endif
    Return
endif
label

var10=Rnd*20+5
var11=(100-LevelValue)*0.12
var10+=var11
var11*=Rnd
var10+=var11
SetTimeout 20
//____________________
label
Goto shieldStunCheck
if !(Idling) && !(Dashing)
    if FrameGE 1 && !(FrameGE 3)
        if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
            Finish
        endif
        Button R
    endif
    Return
endif
Seek
Jump
Return
//____________________
label
Goto shieldStunCheck
Button R
if OAttacking && LevelValue >= 60 && XDistLE 20 && !(FrameGE 20)
    var10-=0.01
else
    var10-=1
    if var10 <= 0
        Call OOSHub
    endif
endif
if Act1EOr1D var10
    var10=Rnd*4
    SetTimeout 30
    Seek
endif
Return
//____________________
label
Goto shieldStunCheck
if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif
Button R
if FrameGE var10
    var12=Rnd
    var11=Direction*OPos
    if var11 < 0
        var12*=0.18
    elif !(XDistLE 8)
        var12*=0.3
        if var12 < 0.1
            var12+=0.05
        endif
    endif
    if LevelValue < 30
        var12=0.12
    elif LevelValue < 60
        var11=(70-LevelValue)*0.025
        if Rnd < var11
            var12=0.12
        endif
    endif
    if var12 < 0.1
        Seek _0
    elif var12 < 0.15
        var11=9*Rnd+1
        SetTimeout var11
        Seek _3
    elif CharDistLE 10 && ModeRelated
        if var12 < 0.2
            Seek _1
        else
            Seek _2
        endif
    else
        Finish
    endif
endif
Return
//____________________
label _0
Goto shieldStunCheck
if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif
Button R
if FrameGE 3
    Stick 1
    if FrameGE 4
        SetFrame 0
    endif
endif
if !(Act1EOr1D var10)
    Call OOSHub
endif
Return
//____________________
label _1
Goto shieldStunCheck
if FrameGE 2
    Stick 0 1
    if FrameGE 2
        SetFrame 0
    endif
endif
if !(Act1EOr1D var10)
    Call OOSHub
endif
Return
//____________________
label _2
Button R
if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif
if FrameGE 2
    if FrameGE 2
        SetFrame 0
    endif
endif
if !(Act1EOr1D var10)
    Call OOSHub
endif
Goto shieldStunCheck
Return
//____________________
label _3
Goto shieldStunCheck
if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif
Button R
Return

label shieldStunCheck
if Equal CurrAction hex(0x1D)
    Call OOSHub
    Finish
endif
if XDistLE 5 && Rnd <= 0.1
    Button R|A
    Finish
endif
Return
Return
