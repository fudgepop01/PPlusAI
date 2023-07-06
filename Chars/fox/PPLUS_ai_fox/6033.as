#include <Definition_AIMain.h>
//TrueID=0x6033
id 0x6033

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

var0=2
var1=0
var2=8
var3=0.7
if Rnd < 0.5
    var2+=0.5
endif
var4=var2+Func12+3
var5=OPos*(-0.5)
AbsStick var5
//____________________
label _0
var5=var3
if !(FrameGE var2)
    var5*=NumFrames
    var5/=var2
endif
Stick 0 var5
if FrameGE var2
    if var1 < 1
        Button A
        var1=Func13
    else
        var1-=1
    endif
    if FrameGE var4
        Finish
    endif
endif
Return
Return
