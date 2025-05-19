#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x00000

//Strings

SetTimeout 0
SetVec var0 Zero
var2=0
Random var3
if var3 < 0.1
    var3=10
elif var3 < 0.2
    var3=-10
else
    var3=0
endif
//____________________
label
if LevelValue >= 20
    var4=LevelValue*0.01+0.5
    EstOPosVecR var0 var1 0.5
    if var1 > -0.1 && var1 < 0.1
        if var0 > 0
            var2=1
        else
            var2=-1
        endif
    else
        var6=var0/var1
        var7=ObjXCoord
        var8=ObjYCoord
        if var8 > -0.01 && var8 < 0.01
            var8=-0.01
        endif
        var7/=var8
        if var6 > var7
            var2=-1
        else
            var2=1
        endif
    endif
    if var2 > 0
        var3+=var4
        if var3 > 10
            var3=10
        endif
    else
        var3-=var4
        if var3 < -10
            var3=-10
        endif
    endif
endif
if var3 > 5
    AbsStick 1
elif var3 < -5
    AbsStick (-1)
endif
Return
Return

