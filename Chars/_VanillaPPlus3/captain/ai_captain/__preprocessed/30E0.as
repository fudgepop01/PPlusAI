#include <Definition_AIMain.h>
//TrueID=0x30E0
id 0xE0E0

//Set Unknown
unk 0x00000

//Strings
str "#full_f"
str "#edge_range"

var0 = LevelValue
var0 *= 0.01
if var0 > 0.75
  var0 = 0.75
endif
if InAir && NumJumps > 0
  Button X
elif Rnd < var0
  if Rnd < 0.5
    Call Unk3020
  else
    Button R
  endif
endif
Finish
Return

