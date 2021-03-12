#include <Definition_AIMain.h>
//TrueID=0x7002
id 0x7002

//Set Unknown
unk 0x60000

//Strings
str "#wait_f"

if DistFrontEdge < 5
    Finish
elif DistBackEdge < 5
    Finish
endif
var0=OXCoord
var1=OXCoord
var2=OYCoord
var3=OYCoord
var0+=-3.5
var1+=3.5
var2+=-3.5
var3+=3.5
if ExactXCoord < var0 || ExactXCoord > var1 || ExactYCoord < var2 || ExactYCoord > var3
else
    Stick 0 (-1)
    Button B
endif
Return
