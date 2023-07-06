#include <Definition_AIMain.h>
id 0x8500
unk 0x0

XReciever
if Equal currGoal cg_circleCamp && Rnd < pt_circleCampChance
  XGoto CircleCampGoal
  XReciever
else
  currGoal = cg_nothing
  XGoto RandomizeGoal
  XReciever
endif
Return
Return