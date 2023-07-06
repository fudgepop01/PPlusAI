#include <Definition_AIMain.h>
//TrueID=0x1060
id 0x1060

//Set Unknown
unk 0x80000

//Strings
str "#full_f"

var0=8
var1=0
SetVec var2 Zero
AtkDiceRoll slot5
var4=4*Rnd+10
if DiceRollResult USmash
    var5=30*Rnd
    var4+=var5
endif
//____________________
label
if MeteoChance || !(OInAir)
    Finish
endif
var5=OYCoord+(-5)
if var5 < YCoord
    Finish
endif
var5=Direction*OPos
if var5 < 0
    var1=3
elif XDistLE 2
    var5=var0+(-1)
    if var1 > var5
        var1=var5
    elif var1 > 0
        var1+=-1
    endif
    EstOPosVecR var2 var3 0.5
    var3-=HurtboxSize
    if var3 < var4
        Call 
    endif
else
    var1+=1
endif
if var1 >= var0
    var7=1
else
    var5=var1/var0
    var7=var5
endif
var7*=OPos
AbsStick var7
Return
Return
