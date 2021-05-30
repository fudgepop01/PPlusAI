// "LYING DOWN" ROUTINE
// the AI is FORCED into this routine when in a knockdown state
#include <Definition_AIMain.h>
//TrueID=0x2070
id 0x2080

//Set Unknown
unk 0x00000

//Strings

if NoOpponent
    Return
endif
Call AIHub
Return

