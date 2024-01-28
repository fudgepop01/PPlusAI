#include <Definition_AIMain.h>
//TrueID=0x6040
id 0xE040

//Set Unknown
unk 0x40000

//Strings

if !(InAir)
    if !(Idling) && !(Dashing)
        if FrameGE 10
            Finish
        endif
        Return
    endif
    var0=(100-LevelValue)*0.1+6
    var1=Rnd*5
    var0+=var1
    Seek _0
    if CalledAs BAir
        var1=OPos*Direction
        if var1 > 0
            var1=OPos*(-0.7)
            AbsStick var1
            Return
        endif
    endif
    Jump
endif
var2=0
var3=3+Func12
//____________________
label
if CalledAs FAir
    Stick 1
elif CalledAs BAir
    Stick (-1)
elif CalledAs SSpecialAir
    AbsStick OPos
elif CalledAs UAir || CalledAs USpecialAir
    Stick 0 1
elif CalledAs DAir || CalledAs DSpecialAir
    Stick 0 (-1)
endif
if var2 < 1
    if CalledAs NSpecialAir || CalledAs SSpecialAir || CalledAs USpecialAir || CalledAs DSpecialAir
        Button B
    else
        Button A
    endif
    var2=Func13
else
    var2-=1
endif
if FrameGE var3
    Call Unk1080
    Finish
endif
Return
//____________________
label _0
AbsStick 0 (-1)
Button X
if FrameGE var0
    Seek
endif
Return
//____________________
label
Button X
if CalledAs FAir || CalledAs BAir || CalledAs SSpecialAir
    AbsStick OPos
elif CalledAs UAir || CalledAs USpecialAir
    Stick 0 1
elif CalledAs DAir || CalledAs DSpecialAir
    Stick 0 (-1)
endif
if CalledAs NSpecialAir || CalledAs SSpecialAir || CalledAs USpecialAir || CalledAs DSpecialAir
    Button B
else
    Button A
endif
if FrameGE 1
    SetTimeout 30
    Seek
endif
Return
//____________________
label
Button X
if Falling || Idling
    Finish
endif
if OCol
    var0=(100-LevelValue)*0.1
    var1=Rnd*4
    var0+=var1
    var0-=0.5
    Seek
endif
Return
//____________________
label
if FrameGE var0
    Finish
endif
Button X
Return
Return
