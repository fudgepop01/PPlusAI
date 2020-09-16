// Spotdodge routine

#include <Definition_AIMain.h>
//TrueID=0x0
id 0x30B0

//Set Unknown
unk 0x0

if !(Equal AirGroundState 1)
    Finish
endif

if !(OAttacking)
  SetTimeout 10
  Return
endif

SetTimeout 50
  var1 = OCurrActionFreq
  if var1 >= 5
      var0 = 0
  elif var1 >= 4
      var0 = 5
  elif var1 >= 3
      var0 = 10
  elif var1 >= 2
      var0 = 15
  else
      var0 = 25
  endif
  if !(Equal var0 0)
    var0 = var0 + Rnd * 5
    var0 = var0 + Rnd * (100 - LevelValue) / 6
  endif
  label
  if var0 <= 0
      Seek
  endif
  var0 -= 1
  Return
  label begin


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

Return
Return
