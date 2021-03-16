#include <Definition_AIMain.h>
id 0x603C

unk 0x0

if Equal AirGroundState 1 && CurrAction <= hex(0x09)
  Button A|R
else
  Finish
endif
Return
Return