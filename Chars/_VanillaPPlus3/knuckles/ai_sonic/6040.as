#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x6040

//Set Unknown
unk 0x00000

//Strings

var0=0
var1=3+RandXOffset
var2=-1
//____________________
label
if CalledAs FAir
    Stick 1
    Button R
elif CalledAs BAir || CalledAs UAir
    Stick (-1)
    Button R
elif CalledAs SSpecialAir
    AbsStick OPos
elif CalledAs UAir || CalledAs USpecialAir || CalledAs FAir
    Stick 0 1
    Button R
elif CalledAs DAir || CalledAs DSpecialAir || CalledAs BAir
    Stick 0 (-0.6)
    Button R
endif
if var0 < 1
    if CalledAs NSpecialAir || CalledAs SSpecialAir || CalledAs USpecialAir || CalledAs DSpecialAir
        Button B
    else
        Button A
        Stick 0 (-1)
    endif
    var0=Func13
    if var2 < 0 && LevelValue > 55
        if IsCharOf Robot && CalledAs NSpecialAir
            var2=1
            Stick 0 (-1)
            if var1 < 4
                var1+=4
            endif
        endif
    endif
else
    var0-=1
endif
if var2 > 0
    if var2 > 1
        Goto _0
    else
        var2+=1
    endif
endif
if FrameGE var1
    if var2 > 0
        Seek
    elif !(OutOfStage)
        Call Unk1080
    endif
    Finish
endif
Return
//____________________
label
if FrameGE 4
    Finish
endif
Goto _0
Return
//____________________
label _0
var3=HurtboxSize*0.6+YCoord
if OYCoord > var3
    Stick 0 0.6
else
    var4=OHurtboxSize+OYCoord
    if var4 < var3
        Stick 0 (-0.6)
    else
        var3=HurtboxSize+YCoord+2
        if var4 > var3
            Stick 0 0.6
        endif
    endif
endif
Return
Return
