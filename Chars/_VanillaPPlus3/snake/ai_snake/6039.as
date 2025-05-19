#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x00000

//Strings

var0=LevelValue*(-0.5)+35
var1=-1
var2=(LevelValue-20)*0.0166*30
if var2 < 0
    var2=0
elif var2 > 30
    var2=30
endif
var3=0.95
var4=LevelValue*0.01-0.2
var5=LevelValue*0.008+0.2
if MeteoChance
    var6=Rnd*25+10
elif Rnd < 0.5
    var6=Rnd*30
else
    var6=0
endif
//____________________
label
if !(Idling)
    if FrameGE 10
        Finish
    endif
    Return
endif
Stick 0.7
Button B
SetTimeout 50
Seek
Jump
Return
//____________________
label
if Invincible
    SetTimeout 0
    Seek
endif
Return
//____________________
label _0
if !(Invincible)
    Finish
endif
if FrameGE var0
    SetVec var7 OXSpeed
    var7*=var2
    var8*=0
    AddVector var7 ExactOXCoord
    SubVector var7 ObjXCoord
    var9=var7
    Abs var9
    if var9 < 7 && var8 < -10
        if Rnd < 0.2
            Button R
        endif
    elif var9 > 80
        var10=ExactOXCoord-ExactXCoord
        Abs var10
        if var9 > var10
            Button R
        endif
    endif
    SetVec var7 ExactOXCoord
    SubVector var7 ObjXCoord
    Dot var11 var7 var8 ObjXSpeed ObjYSpeed
    if var1 < 0
        if var11 > var3
            var1=1
        else
            SetVec var7 OXSpeed
            SubVector var7 ObjXSpeed
            var7*=var2
            var8*=var2
            AddVector var7 ExactOXCoord
            SubVector var7 ObjXCoord
            var8+=var6
            Norm var11 var7 var8
            if var11 < 0.001
                AbsStick 0 1
            else
                var7/=var11
                var8/=var11
                var7*=var5
                var8*=var5
                AbsStick var7 var8
            endif
        endif
    elif var11 < var4
        var1=-1
    endif
endif
Return
Return
