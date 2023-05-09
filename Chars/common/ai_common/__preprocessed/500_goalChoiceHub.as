#include <Definition_AIMain.h>
id 0x8500
unk 0x0

//= XReciever
if var21 >= 7 && var21 < 8
  XGoto CircleCampGoal
  //= XReciever
elif var21 >= 16 && var21 < 17
  
  XGoto CalcAttackGoal
  //= XReciever
  XGoto SetAttackGoal
  //= XReciever
elif var21 >= 10 && var21 < 11
  Return
else
  var21 = 0
  XGoto RandomizeGoal
  //= XReciever
  if CHANCE_MUL_LE 0.65 0.8
    var21 = 10
  endif
endif
Return
Return
