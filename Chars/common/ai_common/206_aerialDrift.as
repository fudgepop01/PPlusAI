#include <Definition_AIMain.h>
id 0x8206
unk 0x0

//= XReciever
label setup
#let timer = var0
timer = Rnd * 80 + 45
label execution

XGoto PerFrameChecks
//= XReciever
if !(Equal lastAttack -1) 
  STACK_PUSH timer st_function
  XGoto SetAttackGoal
  XGoto CheckAttackWillHit
  timer = STACK_POP
endif
Seek execution
// LOGSTR_NL str("exec")

if Equal scriptVariant sv_aerialdrift_towards
  AbsStick OPos
elif Equal scriptVariant sv_aerialdrift_away
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
elif Equal scriptVariant sv_aerialdrift_away_withJump
  immediateTempVar = OPos * -1
  AbsStick immediateTempVar
  immediateTempVar = TopNY - OTopNY
  PredictOMov anotherTempVar mov_attack LevelValue
  if anotherTempVar >= 0.15 && immediateTempVar < 25
    Button X
  endif
endif

if Equal IsOnStage 0
  ClearStick
  anotherTempVar = TopNX * -1
  AbsStick anotherTempVar
endif

if timer <= 0 || !(Equal AirGroundState 2)
  Call MainHub
endif
timer -= 1
Return
Return