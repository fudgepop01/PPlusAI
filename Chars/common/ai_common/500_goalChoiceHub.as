#include <Definition_AIMain.h>
id 0x8500
unk 0x0

XReciever
if Equal currGoal cg_circleCamp
  XGoto CircleCampGoal
  XReciever
elif Equal currGoal cg_attack
  XGoto CalcAttackGoal
  XReciever
else
  currGoal = cg_nothing
  XGoto RandomizeGoal
  XReciever
  if Rnd < pt_baitChance
    currGoal = cg_bait
  endif
endif
Return
Return