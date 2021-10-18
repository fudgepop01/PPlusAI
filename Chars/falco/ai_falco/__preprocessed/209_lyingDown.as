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

if CurrAction <= 32
  CallI MainHub
endif

// react to/read the opponent's attack patterns
var22 = (1 - (LevelValue / 100)) * 30 + 7
MOD var22 AnimFrame var22
if Equal var22 0 && !(Equal var21 13)
  predictAverage var22 10 LevelValue
  var22 += 8
  if ODistLE var22
    GetCommitPredictChance var17 LevelValue
    var17 *= 1.5
    var22 = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < var17
      if ODistLE 10 && Rnd < 0.4
        Button A
      else
        var22 = Rnd * 2 - 1
        var17 = Rnd * 1
        AbsStick var22 var17
      endif
      Return
    elif OAnimFrame >= var22 && OAttacking
      if ODistLE 10 && Rnd < 0.4
        Button A
      else
        var22 = Rnd * 2 - 1
        var17 = Rnd * 1
        AbsStick var22 var17
      endif
      Return
    endif
  endif
endif

if var0 >= 35 && Rnd <= 0.05 && Equal CurrAction 77
  if Rnd < 0.4
    Button A
  else
    var22 = Rnd * 2 - 1
    var17 = Rnd * 1
    AbsStick var22 var17
  endif
  Return
endif
var0 += 1
Return
Return
