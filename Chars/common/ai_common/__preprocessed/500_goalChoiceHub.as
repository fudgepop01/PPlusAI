#include <Definition_AIMain.h>
id 0x8500
unk 0x0

XReciever
if var21 >= 7 && var21 < 8
  XGoto CircleCampGoal
  XReciever
elif var21 >= 16 && var21 < 17
  XGoto CalcAttackGoal
  XReciever
elif var21 >= 10 && var21 < 11
  Return
else
  var21 = 0
  XGoto RandomizeGoal
  XReciever
  if Rnd < 0.85
    var21 = 10
  endif
endif
Return
Return
