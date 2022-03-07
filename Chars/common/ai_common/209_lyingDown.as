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
  if ODistLE 30
    CallI DefendHub
  endif
  CallI MainHub
endif

// react to/read the opponent's attack patterns
immediateTempVar = (1 - (LevelValue / 100)) * 12
immediateTempVar *= PT_REACTION_TIME
MOD immediateTempVar AnimFrame immediateTempVar
if Equal immediateTempVar 0
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar += 35
  if ODistLE immediateTempVar
    GetCommitPredictChance globTempVar LevelValue
    globTempVar *= 0.5
    immediateTempVar = (Rnd * 4) + 14 + (1 - LevelValue / 100) * 15
    if Rnd < globTempVar
      Goto smartRoll
      Return
    elif OAnimFrame >= immediateTempVar && OAttacking
      Goto smartRoll
      Return
    endif
  endif
endif

if timer >= 10 && Rnd <= 0.1 && Equal CurrAction hex(0x4D)
  Goto smartRoll
  Return
endif
timer += 1
Return
label smartRoll
if ODistLE 50 && Rnd < 0.25
  Button A
else
  immediateTempVar = OPos * -30
  GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
  if Equal immediateTempVar -1 && Rnd < 0.45
    immediateTempVar = OPos
  else 
    immediateTempVar = Rnd * 3 - 1
    if immediateTempVar > 1
      immediateTempVar = OPos * -1
    endif
  endif 
  AbsStick immediateTempVar globTempVar
endif
Return
Return