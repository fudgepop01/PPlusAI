#include <Definition_AIMain.h>
//TrueID=0x6100
id 0x6100

//Set Unknown
unk 0x0

//Strings

if var6 < 0 || var6 > 3
    var6 = 0
    var7 = 0
endif

Stick 0 0
if FrameGE 0.5
    Seek
endif
Return
//____________________
label _0
var0=DistFrontEdge
var1=DistBackEdge

if var0 > var7
    var6 = 0
endif

ClearStick
if var0 < 30
    Stick 1
    var6 = var6 + 1
    if var6 >= 3
        ClearStick
        Stick 0 1
        var6 = 0
    endif
elif var1 < 30
    Stick (-1)
    var6 = var6 + 1
    if var6 >= 3
        ClearStick
        Stick 0 1
        var6 = 0
    endif
else
    var6 = 0
    Stick 0 1
endif

var7 = var0 + 2

if FrameGE 5
    Finish
endif
Return

