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
currGoal = cg_lying

if CurrAction <= hex(0x20) || Equal CanCancelAttack 1
  if ODistLE 60
    CallI DefendHub
  endif
  CallI MainHub
endif

// react to/read the opponent's attack patterns
immediateTempVar = (1 - (LevelValue / 100)) * 30
immediateTempVar *= PT_REACTION_TIME
MOD immediateTempVar AnimFrame immediateTempVar
if Equal immediateTempVar 0
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 35
  if ODistLE immediateTempVar
    GetCommitPredictChance globTempVar LevelValue
    globTempVar *= 0.9
    immediateTempVar = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < globTempVar
      if ODistLE 50 && Rnd < 0.25
        Button A
      else
        immediateTempVar = Rnd * 2 - 1
        globTempVar = Rnd * 1
        AbsStick immediateTempVar globTempVar
      endif
      Return
    elif OAnimFrame >= immediateTempVar && OAttacking
      if ODistLE 35 && Rnd < 0.35
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

if timer >= 10 && Rnd <= 0.1 && Equal CurrAction hex(0x4D)
  if Rnd < 0.2
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