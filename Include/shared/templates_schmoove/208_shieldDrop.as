#include <Definition_AIMain.h>
id 0x8208
unk 0x0

XReciever
if Equal IsOnPassableGround 0
  Call MainHub
endif
label setup
#let timer = var0
timer = 0
label
if CurrAction >= hex(0x1) && CurrAction <= hex(0x3)
  Goto AGSCheck
  Stick 1
  if timer < 3
    timer += 1
    Return
  endif
  timer = 13
  Seek drop
  Return
endif
label begin
XGoto PerFrameChecks
XReciever
Seek begin
Goto AGSCheck
if timer > 3
  Button R
endif
immediateTempVar = timer * 0.125
Stick immediateTempVar
if timer >= 10
  Seek drop
  Return
endif
timer += 1
Return
label drop
XGoto PerFrameChecks
XReciever
Seek drop
Goto AGSCheck
Button R
Stick 1
if timer >= 15
  immediateTempVar = timer - 15
  immediateTempVar *= -0.125
  LOGVAL immediateTempVar
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