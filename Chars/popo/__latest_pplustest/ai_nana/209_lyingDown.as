#include <Definition_AIMain.h>
id 0x8209
unk 0x0

//= XReciever
label setup
#let timer = var0
timer = 0
label begin
XGoto PerFrameChecks
//= XReciever
Seek begin
currGoal = cg_lying

if CurrAction <= hex(0x20) || Equal CanCancelAttack 1
  if ODistLE 30
    CallI DefendHub
  endif
  CallI MainHub
endif

if !(Equal CurrAction hex(0x4D)) && CurrAction < hex(0x89)
  Return
endif

immediateTempVar = Rnd * 4 - 2
if immediateTempVar > 1
  Button R
  if immediateTempVar > 2
    Button A
  endif
else
  immediateTempVar *= 5
  Stick immediateTempVar
endif 

Return
Return