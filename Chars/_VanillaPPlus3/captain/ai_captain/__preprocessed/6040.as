#include <Definition_AIMain.h>
//TrueID=0x6040
id 0x603F

//Set Unknown
unk 0x50000

//Strings

SetTimeout 10
label
if CurrAction > 28
    Finish
endif
if CurrAction >= 73 && CurrAction < 74
    Call OnGotDamaged
endif
if CurrAction >= 51 && CurrAction < 52
    Button R
endif
GetNearestCliff var0
var1 -= YCoord
var2 = YCoord - OYCoord + HurtboxSize
if OutOfStage && var1 > 1 && NumJumps > 0 || !(InAir)
    if OutOfStage && var2 < 10 || !(InAir) 
        Button X
        label
        if InAir
            Finish
        endif
    endif    
    Return
endif
var0=0
var1=3+RandXOffset
var2=-1
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
    Stick 0 (-0.6)
endif
if var0 < 1
    if CalledAs NSpecialAir || CalledAs SSpecialAir || CalledAs USpecialAir || CalledAs DSpecialAir
        Button B
    else
        Button A 
        if FrameGE 3 && !(OutOfStage) 
            if Equal HitboxConnected 1 || !(XDistLE var1)
                Stick 0 (-1)
            endif
        endif
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
var5=0
//____________________
label _1
if var5 < 1
    Button R
    var5=1
else
    var5=0
endif
Return

