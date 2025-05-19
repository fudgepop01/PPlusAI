#include <Definition_AIMain.h>
id 0x8209
unk 0x0

//= XReciever
label setup
#let timer = var0
timer = 0
label begin
XGoto PerFrameChecks
//= XReciever
Seek begin
currGoal = cg_lying

if CurrAction <= hex(0x20) || Equal CanCancelAttack 1
  if ODistLE 30
    CallI DefendHub
  endif
  CallI MainHub
endif

if !(Equal CurrAction hex(0x4D)) && CurrAction < hex(0x89)
  Return
endif

if TRAINING_MODE_OPTION >= 0
  immediateTempVar = Rnd * 4 - 2
  if immediateTempVar > 1
    Button R
    if immediateTempVar > 2
      Button A
    endif
  else
    immediateTempVar *= 5
    Stick immediateTempVar
  endif 
endif

// react to/read the opponent's attack patterns
immediateTempVar = (1 - (LevelValue / 100)) * 12
immediateTempVar *= PT_REACTION_TIME
MOD immediateTempVar GameTimer immediateTempVar
if immediateTempVar <= 1
  predictAverage immediateTempVar man_OXHitDist
  immediateTempVar += 35
  if XDistLE immediateTempVar
    Goto smartRoll
    Seek begin
  endif
endif

if {timer >= 1 && Rnd <= 0.1} && {CurrAction >= hex(0x89) || Equal CurrAction hex(0x4D)}
  Goto smartRoll
  Seek begin
  Return
endif
timer += 1
Return
label smartRoll
if XDistLE 30 && Rnd < 0.2
  Button A
else
  GetCommitPredictChance immediateTempVar
  PredictOMov anotherTempVar mov_shield
  if XDistLE 25 && anotherTempVar < 0.12 && Rnd < 0.3
    if Rnd < 0.5 || immediateTempVar > 0.25 && Rnd < 0.2
      Button A
    endif
    Button R
    Return
  endif
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