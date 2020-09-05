// DOUBLE JUMP
#include <Definition_AIMain.h>
id 0x8F01

unk 0x0


Button X
var0 = Rnd - 0.5
Stick var0
Seek waitForFalling
Return

label waitForFalling
Seek executed
// if Equal IsOnStage 0 || Equal AirGroundState 1
//   Call AIHub
// endif
// if YSpeed < -0.15
//   if Rnd < 0.3
//     Stick 0 (-1)
//   endif
//   Seek executed
// endif
Return

label executed
if Equal var21 32769
  Call ApproachHub
endif
Return
Return
