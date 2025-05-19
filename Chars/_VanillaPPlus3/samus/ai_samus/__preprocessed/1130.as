#include <Definition_AIMain.h>
//TrueID=0x1130
id 0x1130

//Set Unknown
unk 0x00000

//Strings

SetTimeout 0
Random var0
if var0 < 0.1
    var0=20
elif var0 < 0.2
    var0=-20
else
    var0=5
endif
//____________________
label
if LevelValue >= 40
    var0=(YSpeed*20+ExactOYCoord)-YCoord
endif
if var0 > 10
    Stick 0 1
elif var0 < 0
    Stick 0 (-1)
endif
Return
Return

