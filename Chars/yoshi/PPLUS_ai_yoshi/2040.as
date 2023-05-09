#include <Definition_AIMain.h>
//TrueID=0x2040
id 0x2040

//Set Unknown
unk 0xC0000

//Strings

if XDistFrontEdge >= 0
    var20=1
elif XDistFrontEdge <= 0
    var20=-1
endif
Stick var20
Return
