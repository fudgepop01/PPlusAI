#include <Definition_AIMain.h>
//TrueID=0x30E0
id 0x30E0

//Set Unknown
unk 0x00000

//Strings
// str "#full_f"
// str "#edge_range"

var17 = Rnd * 20

if Equal AirGroundState 1 && Rnd < 0.5
  Button X
endif
Seek
Return
label 
if Equal AirGroundState 1 && !(Equal CurrAction 10)
  Button R
elif Equal CurrAction 10
  Button X
else
  Call AIHub
endif
if FrameGE var17
  Call AIHub
endif
Return
Return

