#include <Definition_AIMain.h>
//TrueID=0x7002
id 0x7002

//Set Unknown
unk 0x0

//Strings

//____________________
label _0
if XDistLE 15
    Finish
endif
if OPos > 0
    var1=-1
    var2=1
elif OPos < 0
    var1=1
    var2=-1
endif
var0=(Rnd+7)*2
if FrameGE var0
    Finish
endif
if FrameGE 4
    AbsStick var1
endif
if FrameGE 12
    Seek _1
endif
Return
//____________________
label _1
if XDistLE 10
    Finish
endif
if OPos > 0
    var1=-1
    var2=1
elif OPos < 0
    var1=1
    var2=-1
endif
var0=(Rnd+5)*2
if FrameGE var0
    Finish
endif
if FrameGE 4
    AbsStick var2
endif
if FrameGE 12
    Seek _0
endif
Return
