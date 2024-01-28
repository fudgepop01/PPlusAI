#include <Definition_AIMain.h>
id 0x8206
unk 0x0

//= XReciever
label setup
var0 = Rnd * 80 + 45
label execution

XGoto PerFrameChecks
//= XReciever
if !(Equal var20 -1) 
  STACK_PUSH var0 0
  STACK_PUSH var16 0
  XGoto SetAttackGoal
  XGoto CheckAttackWillHit
  var16 = STACK_POP
  var0 = STACK_POP
endif
Seek execution
// LOGSTR_NL str("exec")

if Equal var16 1
  AbsStick OPos
elif Equal var16 2
  var22 = OPos * -1
  AbsStick var22
elif Equal var16 3
  var22 = OPos * -1
  AbsStick var22
  var22 = TopNY - OTopNY
  PredictOMov var23 14
  if var23 >= 0.15 && var22 < 25
    Button X
  endif
endif

if Equal IsOnStage 0
  ClearStick
  var23 = TopNX * -1
  AbsStick var23
endif

if var0 <= 0 || !(Equal AirGroundState 2)
  Call MainHub
endif
var0 -= 1
Return
Return
