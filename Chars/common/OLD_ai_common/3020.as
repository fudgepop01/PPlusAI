#include <Definition_AIMain.h>
//TrueID=0x3020
id 0x3020

//Set Unknown
unk 0x40000

//Strings

GetShieldRemain var0
if var0 < 30
    Finish
endif
var1=Rnd*20+5
var2=(100-LevelValue)*0.12
var1+=var2
var2*=Rnd
var1+=var2
SetTimeout 20
//____________________
label
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
Button R
if OAttacking && LevelValue >= 60 && XDistLE 20 && !(FrameGE 20)
    var1-=0.01
else
    var1-=1
    if var1 <= 0
        Finish
    endif
endif
if Act1EOr1D var1
    var1=Rnd*4
    SetTimeout 30
    Seek
endif
Return
//____________________
label
Button R
if FrameGE var1
    var3=Rnd
    var2=Direction*OPos
    if var2 < 0
        var3*=0.18
    elif !(XDistLE 8)
        var3*=0.3
        if var3 < 0.1
            var3+=0.05
        endif
    endif
    if LevelValue < 30
        var3=0.12
    elif LevelValue < 60
        var2=(70-LevelValue)*0.025
        if Rnd < var2
            var3=0.12
        endif
    endif
    if var3 < 0.1
        Seek _0
    elif var3 < 0.15
        var2=9*Rnd+1
        SetTimeout var2
        Seek _1
    elif CharDistLE 10 && ModeRelated
        if var3 < 0.2
            Seek _2
        else
            Seek _3
        endif
    else
        Finish
    endif
endif
Return
//____________________
label _0
Button R
if FrameGE 3
    Stick 1
    if FrameGE 4
        SetFrame 0
    endif
endif
if !(Act1EOr1D var1)
    Finish
endif
Return
//____________________
label _2
if FrameGE 2
    Stick 0 1
    Button A
    if FrameGE 2
        SetFrame 0
    endif
endif
if !(Act1EOr1D var1)
    Finish
endif
Return
//____________________
label _3
Button R
if FrameGE 2
    Button A
    if FrameGE 2
        SetFrame 0
    endif
endif
if !(Act1EOr1D var1)
    Finish
endif
Return
//____________________
label _1
Button R
Return
Return
