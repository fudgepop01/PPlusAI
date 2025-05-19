#include <Definition_AIMain.h>
//TrueID=0x1120
id 0x1120

//Set Unknown
unk 0x0

//Strings

if Equal var20 (-1) && CurrAction >= 52 && CurrAction <= 53
    XGoto 0x8503    //Corrupted?
    Call ExecuteAttack
endif
Return
Return
Return
