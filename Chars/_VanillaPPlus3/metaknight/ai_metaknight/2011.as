#include <Definition_AIMain.h>
//TrueID=0x2011
id 0x2011

//Set Unknown
unk 0x00000

//Strings

var0=YDistFrontEdge
var1=XDistFrontEdge
var3=DistFrontEdge
//____________________
label _0
var0=YDistFrontEdge
var1=XDistFrontEdge
var3=DistFrontEdge
var10=0
var11=0
if XDistFrontEdge > 0
    var4=1
elif XDistFrontEdge <= 0
    var4=-1
endif
Stick var4 0
if NumJumps > 0.5
    var11=3338
    if var0 > 30
        Button X
        Seek _1
    endif
elif !(FramesHitstun > 0)
    Seek _2
endif
Return
//____________________
label _1
Seek _0
Return
//____________________
label _2
Call EdgeRecover
Finish
