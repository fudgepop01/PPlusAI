#include <Definition_AIMain.h>
id 0x8208
unk 0x0

//= XReciever
if Equal IsOnPassableGround 0
  Call MainHub
endif
label setup
#let timer = var0
timer = 0
label drop
XGoto PerFrameChecks
//= XReciever
Goto AGSCheck
Seek drop
Button R
if timer >= 2
  immediateTempVar = timer - 1
  MOD immediateTempVar immediateTempVar 8
  immediateTempVar *= -0.125
  // LOGVAL immediateTempVar
  Stick 0 immediateTempVar
endif
timer += 1
Return
label AGSCheck
if Equal AirGroundState 2
  Call MainHub
endif
Return
Return