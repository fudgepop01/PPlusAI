#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

var0=2
var1=0
var2=1
var3=1
if Rnd < 0.5
    var2+=0.5
endif
var4=120*Rnd+20
SetTimeout 20
//____________________
label
if !(Idling) && !(Dashing)
    Return
endif
SetTimeout 180
Seek
Jump
Return
//____________________
label _0
var5=var3
if !(FrameGE var2)
    var5*=NumFrames
    var5/=var2
endif
var5*=OPos
AbsStick var5
if FrameGE var2
    if var1 < 1
        Button B
        var1=Func13
        var5=Rnd
        Seek
    else
        var1-=1
    endif
endif
Return
//____________________
label
if LevelValue > 50
    var6=Direction*OPos
    if var6 < 0
        Finish
    endif
    if OBlown
        var6=var4+(-35)
        if FrameGE var6
            var4+=35
        endif
    endif
endif
if FrameGE var4 || Idling || InAir
    Finish
endif
if FrameGE 4
    if var5 < 0.4
        AbsStick 0 1
    elif var5 < 0.7
        AbsStick 0 (-1)
    else
        Stick 1
    endif
endif
if var1 < 1
    Button B
    var1=20
    var5=Rnd
    var1*=Rnd
    var1+=2
else
    var1-=1
endif
Return
Return

