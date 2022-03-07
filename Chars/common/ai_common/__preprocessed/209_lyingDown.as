#include <Definition_AIMain.h>
id 0x8209
unk 0x0

XReciever
label setup
var0 = 0
label begin
XGoto PerFrameChecks
XReciever
Seek begin
var21 = 17

if CurrAction <= 32 || Equal CanCancelAttack 1
  if ODistLE 30
    CallI DefendHub
  endif
  CallI MainHub
endif

// react to/read the opponent's attack patterns
var22 = (1 - (LevelValue / 100)) * 12
var22 *= PT_REACTION_TIME
MOD var22 AnimFrame var22
if Equal var22 0
  predictAverage var22 10 LevelValue
  var22 += 35
  if ODistLE var22
    GetCommitPredictChance var17 LevelValue
    var17 *= 0.5
    var22 = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < var17
      Goto smartRoll
      Return
    elif OAnimFrame >= var22 && OAttacking
      Goto smartRoll
      Return
    endif
  endif
endif

if var0 >= 10 && Rnd <= 0.1 && Equal CurrAction 77
  Goto smartRoll
  Return
endif
var0 += 1
Return
label smartRoll
if ODistLE 50 && Rnd < 0.25
  Button A
else
  var22 = OPos * -30
  GetYDistFloorOffset var22 var22 5 0
  if Equal var22 -1 && Rnd < 0.45
    var22 = OPos
  else 
    var22 = Rnd * 3 - 1
    if var22 > 1
      var22 = OPos * -1
    endif
  endif 
  AbsStick var22 var17
endif
Return
Return
