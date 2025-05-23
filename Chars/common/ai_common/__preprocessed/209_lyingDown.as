#include <Definition_AIMain.h>
id 0x8209
unk 0x0

//= XReciever
label setup
var0 = 0
label begin
XGoto PerFrameChecks
//= XReciever
Seek begin
var21 = 17

if CurrAction <= 32 || Equal CanCancelAttack 1
  if ODistLE 30
    CallI DefendHub
  endif
  CallI MainHub
endif

if !(Equal CurrAction 77) && CurrAction < 137
  Return
endif

if TRAINING_MODE_OPTION >= 0
  var22 = Rnd * 4 - 2
  if var22 > 1
    Button R
    if var22 > 2
      Button A
    endif
  else
    var22 *= 5
    Stick var22
  endif 
endif

// react to/read the opponent's attack patterns
var22 = (1 - (LevelValue / 100)) * 12
var22 *= PT_REACTION_TIME
MOD var22 GameTimer var22
if var22 <= 1
  predictAverage var22 10
  var22 += 35
  if XDistLE var22
    Goto smartRoll
    Seek begin
  endif
endif

if var0 >= 1 && Rnd <= 0.1 && CurrAction >= 137 || Equal CurrAction 77
  Goto smartRoll
  Seek begin
  Return
endif
var0 += 1
Return
label smartRoll
if XDistLE 30 && Rnd < 0.2
  Button A
else
  GetCommitPredictChance var22
  PredictOMov var23 10
  if XDistLE 25 && var23 < 0.12 && Rnd < 0.3
    if Rnd < 0.5 || var22 > 0.25 && Rnd < 0.2
      Button A
    endif
    Button R
    Return
  endif
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
