#include <Definition_AIMain.h>
id 0x8500
unk 0x0

XReciever
if currGoal >= cg_circleCamp && currGoal < calc(cg_circleCamp + 1)
  XGoto CircleCampGoal
  XReciever
elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1)
  XGoto CalcAttackGoal
  XReciever
  XGoto SetAttackGoal
  XReciever
elif currGoal >= cg_bait && currGoal < calc(cg_bait + 1)
  Return
else
  currGoal = cg_nothing
  XGoto RandomizeGoal
  XReciever
  if CHANCE_MUL_LE pt_baitChance 1
    currGoal = cg_bait
  endif
endif
Return
Return