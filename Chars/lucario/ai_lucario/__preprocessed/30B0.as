// Spotdodge routine

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x30B0

//Set Unknown
unk 0x0

if !(Equal AirGroundState 1)
  if OAttacking && Equal AirGroundState 1
    Call Unk3020
  elif Equal var21 32769
    Call ApproachHub
  endif
    Call AIHub
endif

SetTimeout 50
  if !(OAttacking) || Rnd <= 0.25 || OCurrActionFreq >= 4
    Seek begin
    Jump
  endif
  var0 = 21 - 0
  var0 = Rnd * var0 + 0
  if !(Equal var0 0)
    var0 = var0 + Rnd * (100 - LevelValue) / 6
  endif
  
  // var0 = var0 - (OCurrActionFreq * 4) 
  var1 = 0
  label
  LOGSTR 1027423488 1025524736 1162223616 1027423488 1023410176
  if FramesHitstun > 0
    Call AIHub
  endif
  if !(OAttacking)
    var1 = 1
  endif
  if Equal CurrAction 3
    Stick 0.8
  elif Equal CurrAction 4
    Stick 0 (-1)
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

SetTimeout 15
var0=100-LevelValue
var1=var0
var0*=0.15*Rnd
var1*=0.05
var0+=var1
var1=Rnd*3-2
var0+=var1
//____________________
label
var2=Direction*OPos
if var2 < 0
    var2=0.5*OPos
    AbsStick var2
endif
if OAttacking && ODistLE 50
    SetTimeout 20
    Seek
    Jump
endif
Return
//____________________
label
if FrameGE 0 && Idling
    Button R
    var0=(100-LevelValue)*0.05*Rnd
    var1=Rnd
    if !(OWiring)
        var1*=8
    endif
    var1-=2
    var0+=var1
    SetTimeout 40
    Seek
    Jump
endif
Return
//____________________
label
Button R
if FrameGE 0
    var1=Rnd
    if OWiring
        var1*=0.7
    endif
    if var1 < 0.5
        Stick 1
        Finish
    elif var1 < 0.7
        Stick (-1)
        Finish
    else
        Stick 0 (-1)
        Seek
    endif
endif
Return
//____________________
label
if FrameGE 2
    if !(Act1EOr1D var2)
        if LevelValue > 60
            if XDistLE 6
                Random var3
                if var3 < 0.5
                    Call Grab
                elif var3 < 0.7
                    Call Unk1010
                endif
            elif XDistLE 12
                Random var3
                if var3 < 0.4
                    Call Unk1010
                endif
            endif
        endif
        Finish
    endif
else
    Button R
    Stick 0 (-1)
endif
Return
Return
