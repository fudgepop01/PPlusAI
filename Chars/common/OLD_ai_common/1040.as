#include <Definition_AIMain.h>
//TrueID=0x1040
id 0x1040

//Set Unknown
unk 0x70000

//Strings
str "#key_f"

var0=8
if LevelValue > 45
    var1=-1
else
    var1=1
endif
AtkDiceRoll slot1
Cmd2F var2 30
var3=20*Rnd
var2+=var3
var4=0
if Rnd < 0.8
    var5=0.5*Rnd
    if var5 < 0.2
        var5=0
    endif
else
    var5=0
endif
if !(XDistLE var2)
    Cmd30
endif
Random var6 10 25 0 0
//____________________
label
var3=Direction*OPos
if var3 < 0
    var4=0.5*OPos
    AbsStick var4
else
    var3=var4
    Abs var3
    if var3 > var5
        var3-=0.08
        if var3 < var5
            var3=var5
        endif
    else
        var3+=0.08
        if var3 > var5
            var3=var5
        endif
    endif
    if var4 < 0.01 && var4 > -0.01
        var4=OPos
    endif
    if var4 > 0
        var4=var3
    else
        var4=var3*(-1)
    endif
    AbsStick var4
    if var1 < 0
        var3=var2+(-20)
        if XDistLE var3
            var3=Rnd
            if var3 < 0.2
                var1=1
                Return
            elif var3 < 0.6
                Call Unk3020
            else
                Call DodgeWhenAttacked
            endif
            Finish
        endif
    endif
endif
if MeteoChance || !(XDistLE AIPDFloat1) || FrameGE var6
    Finish
endif
if XDistLE var2
    Call 
endif
Return
Return
