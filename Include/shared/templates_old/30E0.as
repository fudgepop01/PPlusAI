#include <Definition_AIMain.h>
//TrueID=0x30E0
id 0x30E0

//Set Unknown
unk 0x00000

//Strings
// str "#full_f"
// str "#edge_range"

globTempVar = Rnd * 20

if Equal AirGroundState 1 && Rnd < 0.5
  Button X
endif
Seek
Return
label 
if Equal AirGroundState 1 && !(Equal CurrAction hex(0x0A))
  Button R
elif Equal CurrAction hex(0x0A)
  Button X
else
  Call AIHub
endif
if FrameGE globTempVar
  Call AIHub
endif
Return
Return
