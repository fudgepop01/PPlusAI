#include <Definition_AIMain.h>
//TrueID=0x6039
id 0x6039

//Set Unknown
unk 0x70000

//Strings
str "#wait_f"

var0=2
Random var1
var2=(LevelValue-20)*0.0166*30
if var2 < 0
    var2=0
elif var2 > 30
    var2=30
endif
var3=(OYSpeed*var2+ExactOYCoord)-ExactYCoord
Abs var3
if var3 > 20
    var1-=0.4
else
    var1+=0.2
endif
if var1 > 0.5
    var4=2
    var5=1
else
    var4=10
    var5=0.7
endif
var6=var4+4
//____________________
label
if var1 > 0.5
    Seek _0
else
    Seek
endif
Jump
Return
//____________________
label
if FrameGE var0
    Seek
endif
Return
//____________________
label _0
var3=var5
if !(FrameGE var4)
    var3*=NumFrames
    var3/=var4
endif
var3*=OPos
AbsStick var3
if FrameGE var4
    Button B
    if FrameGE var6
        Finish
    endif
endif
Return
Return

