#include <Definition_AIMain.h>
//TrueID=0x30B0
id 0x30B0

//Set Unknown
unk 0x40000

//Strings

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
if FrameGE var0 && Idling
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
if FrameGE var0
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
        Call USpecial
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
                    Call USpecial
                endif
            elif XDistLE 12
                Random var3
                if var3 < 0.4
                    Call USpecial
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
