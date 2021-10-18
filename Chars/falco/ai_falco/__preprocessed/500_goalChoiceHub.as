#include <Definition_AIMain.h>
id 0x8500
unk 0x0

XReciever
if Equal var21 7 && Rnd < 0.4
  XGoto CircleCampGoal
  XReciever
else
  var21 = 0
  XGoto RandomizeGoal
  XReciever
endif
Return
Return
