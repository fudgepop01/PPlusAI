// DOUBLE JUMP
#include <Definition_AIMain.h>
id 0x8F01

unk 0x0

#let tempVar = var0

Button X
tempVar = Rnd - 0.5
Stick tempVar
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
Call ApproachHub
Return
Return