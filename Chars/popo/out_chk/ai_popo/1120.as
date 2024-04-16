#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x40000

//Strings

SetTimeout 0
var0=0
Goto _3
Random var1
var1-=0.3
var2=LevelValue-160
var1*=var2*0.009
var1+=1
var2=ODamage
if var2 > 100
    var2-=100
    var2*=0.6
    var2+=100
elif var2 < 50
    var2*=0.4
    var2+=30
endif
var2*=0.03
if var2 > 8
    var2=8
endif
var1*=var2
var1-=0.2
var3=0
//____________________
label _0
if Grabbing
    var0-=1
    if var0 <= 0
        Goto _3
        if NormCharDistLE 30
            var1=0
        else
            var1-=1
        endif
        if var1 > 0
            Seek _1
        else
            Random var1
            Seek _2
        endif
    endif
endif
Return
//____________________
label _1
Button A
Seek _0
Return
//____________________
label _2
if ev1C && LevelValue > 60
    if ODamage > 90 || Rnd < 0.8
        var1=1
    else
        var1=0
    endif
elif ODamage > 90
    var2=LevelValue*0.0075
    if Rnd < var2
        var2=TBoundary-YCoord
        if var2 < 150 && ODamage > 120
            var1=1
        else
            var2=LBoundary-XCoord
            if var2 > -200
                if Direction > 0
                    var1=0.5
                else
                    var1=0.7
                endif
            else
                var2=RBoundary-XCoord
                if var2 < 200
                    if Direction > 0
                        var1=0.7
                    else
                        var1=0.5
                    endif
                elif !(CanThrow) && ODamage > 130
                    if DistFrontEdge < DistBackEdge
                        var1=0.7
                    else
                        var1=0.5
                    endif
                endif
            endif
        endif
    elif LevelValue < 45
        var2=Rnd
        if var2 < 0.6
            if DistFrontEdge < DistBackEdge
                var1=0.5
            else
                var1=0.7
            endif
        elif var2 < 0.8
            var1=0
        endif
    endif
endif
if var1 < 0.32
    Stick 0 (-1)
    var3=-1
elif var1 < 0.6
    Stick (-1)
elif var1 < 0.8
    Stick 1
else
    Stick 0 1
    var3=1
endif
if LevelValue > 60
    Seek
else
    Finish
endif
Return
//____________________
label
Stick 0 var3
Button A
Finish
Return
//____________________
label _3
Random var2
var0=(LevelValue-110)*(-0.2)*var2
var2=(LevelValue-100)*(-0.1)
var0+=var2
Return
Return
