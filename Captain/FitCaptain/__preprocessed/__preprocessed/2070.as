// "LYING DOWN" ROUTINE
// the AI is FORCED into this routine when in a knockdown state
#include <Definition_AIMain.h>
//TrueID=0x2070
id 0x2070

//Set Unknown
unk 0x00000

//Strings

if InAir || FramesHitstun > 0 || CurrAction <= 32
    Call AIHub
endif

var0=Rnd
var10=0
if var10 > 0
    var10=0
    Return
endif
//____________________
label _0
if var0 < 0.5 && fXClose
    Button A
    Finish
elif var0 < 0.25 && !(var0 >= 0.25)
    Stick 0 1
    Finish
elif var0 > 0.25 && !(var0 >= 0.5)
    Stick 1
    Finish
elif var0 > 0.5 && !(var0 >= 0.75)
    Stick (-1)
    Finish
elif var0 > 0.75
    Seek _0
    Finish
endif
Return


