#include <Definition_AIMain.h>
//TrueID=0x2060
id 0x2060

//Set Unknown
unk 0x0

//Strings

var0=Rnd
if XDistFrontEdge >= 0
    var20=1
elif XDistFrontEdge <= 0
    var20=-1
endif
if var0 < 0.2
    Button X
    Finish
elif var0 < 0.4
    Button A
    Finish
elif var0 < 0.6
    Stick 1
    Finish
elif var0 < 0.8
    Stick (-1)
    Finish
else
    Button R
    Stick var20 (-0.5)
    Finish
endif
Return
