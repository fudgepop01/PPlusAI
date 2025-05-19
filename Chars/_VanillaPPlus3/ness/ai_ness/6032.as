#include <Definition_AIMain.h>
//TrueID=0x6032
id 0x6032

//Set Unknown
unk 0x00000

//Strings
str "#wait_f"

var0=OXCoord
var1=OXCoord
var2=OYCoord
var3=OYCoord
var0+=-15.5
var1+=15.5
var2+=-15.5
var3+=15.5
if ExactXCoord < var0 || ExactXCoord > var1 || ExactYCoord < var2 || ExactYCoord > var3
    Call 0x7004
else
    Call slot1
endif
Return
