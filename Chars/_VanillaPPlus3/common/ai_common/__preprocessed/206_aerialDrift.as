#include <Definition_AIMain.h>
id 0x8206
unk 0x0

//= XReciever
label setup
var0 = Rnd * 80 + 20
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
  if Rnd < 0.01
    var20 = -1
  endif
endif
Seek execution
// LOGSTR_NL str("exec")

EstOXCoord var22 15
var22 -= TopNX
PredictOMov var23 14
if Equal var16 1
  AbsStick var22
elif Equal var16 2
  var22 *= -1
  AbsStick var22
elif var16 >= 3
  var22 *= -1
  if Equal var16 4
    var22 = TopNX * -1
  endif
  AbsStick var22
  var22 = TopNY - OTopNY
  if var23 >= 0.15 && var22 < 25
    Button X
  endif
endif

if YDistBackEdge > -20 && XDistBackEdge > -15 && !(ODistLE 15)
  var16 = 4
endif

if var0 <= 0 || !(Equal AirGroundState 2)
  Call MainHub
endif
var0 -= 1
Return
Return
