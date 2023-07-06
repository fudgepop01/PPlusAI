#include <Definition_AIMain.h>
//TrueID=0x2011
id 0x2011

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if XDistFrontEdge > 0
    var15=1
elif XDistBackEdge > 0
    var15=-1
endif
if YDistFrontEdge > 11 && !(YDistFrontEdge > 16) && XDistFrontEdge <= 80 || YDistBackEdge > 11 && !(YDistBackEdge > 16) && XDistBackEdge <= 80
    Stick var15
    Button B
else
    Finish
endif
Return
