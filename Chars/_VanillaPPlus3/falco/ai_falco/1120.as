#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

var0=DistFrontEdge
var1=DistBackEdge
if var0 < 25
    Stick 1
elif var1 < 25
    Stick (-1)
else
    Stick 0 1
endif
Return
