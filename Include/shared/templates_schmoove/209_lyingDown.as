#include <Definition_AIMain.h>
id 0x8209
unk 0x0

XReciever
label setup
#let timer = var0
timer = 0
label begin
XGoto PerFrameChecks
XReciever
Seek begin

if CurrAction <= hex(0x20)
  CallI MainHub
endif

// react to/read the opponent's attack patterns
immediateTempVar = (1 - (LevelValue / 100)) * 30 + 7
MOD immediateTempVar AnimFrame immediateTempVar
if Equal immediateTempVar 0 && !(Equal currGoal cg_defend)
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 8
  if ODistLE immediateTempVar
    GetCommitPredictChance globTempVar LevelValue
    globTempVar *= 1.5
    immediateTempVar = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < globTempVar
      if ODistLE 10 && Rnd < 0.4
        Button A
      else
        immediateTempVar = Rnd * 2 - 1
        globTempVar = Rnd * 1
        AbsStick immediateTempVar globTempVar
      endif
      Return
    elif OAnimFrame >= immediateTempVar && OAttacking
      if ODistLE 10 && Rnd < 0.4
        Button A
      else
        immediateTempVar = Rnd * 2 - 1
        globTempVar = Rnd * 1
        AbsStick immediateTempVar globTempVar
      endif
      Return
    endif
  endif
endif

if timer >= 35 && Rnd <= 0.05 && Equal CurrAction hex(0x4D)
  if Rnd < 0.4
    Button A
  else
    immediateTempVar = Rnd * 2 - 1
    globTempVar = Rnd * 1
    AbsStick immediateTempVar globTempVar
  endif
  Return
endif
timer += 1
Return
Return