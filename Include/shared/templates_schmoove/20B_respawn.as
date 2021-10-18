#include <Definition_AIMain.h>
id 0x820B
unk 0x0

XReciever
label begin
if !(Equal CurrAction hex(0xBE))
  CallI MainHub
endif
if Rnd <= 0.03
  Stick 1
endif
Return
Return