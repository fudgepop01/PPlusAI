// forcibly handles shields
#include <Definition_AIMain.h>
//TrueID=0x3020
id 0x3020

//Set Unknown
unk 0x00000

//Strings

if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif

GetShieldRemain var0
if var0 < 20
    Finish
endif

  var0 = 21 - 0
  var0 = Rnd * var0 + 0
  if !(Equal var0 0)
    var0 = var0 + Rnd * (100 - LevelValue) / 6
  endif
  var1 = 0
  label
  if !(OAttacking)
    var1 = 1
  endif
  if Equal var1 1 && OAttacking
    Seek
    Jump
  elif var0 <= 0
    Seek
    Jump
  endif
  var0 -= 1
  Return
  label
  SetFrame 0
  label begin

if !(Equal AirGroundState 1) || Equal CurrSubaction JumpSquat
    Finish
endif

label

if Rnd < 0.5 && Equal LevelValue 100 && Equal AirGroundState 1 && FramesHitstun < 1 && Damage < 60
    SetFrame 0
    label
    Stick 0 (-1)
    if NumFrames >= 20
        Call AIHub
    elif FramesHitstun > 0
        Seek
        Jump
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
        Button R
    endif
    Return
endif
SetTimeout 120
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
    Button A
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
if FrameGE 2
    Button A
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
Button R
Return

label shieldStunCheck
if Equal CurrAction 29
    Call OOSHub
    Finish
endif
Return
Return

