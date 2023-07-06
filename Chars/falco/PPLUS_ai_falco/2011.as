#include <Definition_AIMain.h>
//TrueID=0x2011
id 0x2011

//Set Unknown
unk 0x0

//Strings

var0=Rnd
if !(Back) && var0 < 0.6
    Call JumpOnStage2
elif !(Back) && var0 >= 0.6
    Call JumpOnStage4
elif Back && var0 < 0.6
    Call JumpOnStage3
elif Back && var0 >= 0.6
    Call JumpOnStage2
endif
Return
