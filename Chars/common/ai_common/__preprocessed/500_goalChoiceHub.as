#include <Definition_AIMain.h>
id 0x8500
unk 0x0

XReciever
if Equal var21 7
  XGoto CircleCampGoal
  XReciever
elif Equal var21 16
  XGoto CalcAttackGoal
  XReciever
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
