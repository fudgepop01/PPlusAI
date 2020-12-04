// DOUBLE JUMP
#include <Definition_AIMain.h>
id 0x8F01

unk 0x0

lastScript = hex(0x8F01)

#let tempVar = var0
if Equal IsOnStage 1
  Button X
  tempVar = Rnd - 0.5
  Stick tempVar
endif
Call ApproachHub
Return
Return