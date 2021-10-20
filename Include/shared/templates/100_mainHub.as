#include <Definition_AIMain.h>
id 0x8100
unk 0x0

XReciever
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode 0

if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif

label start

DisableDebugOverlay
if Equal currGoal cg_recover
  CallI RecoveryHub
endif

// JUMP_HEIGHT_TEST

Goto PFC
Seek start

if Equal skipMainInit mainInitSkip
  skipMainInit = -100
  if Rnd < 0.45 && !(Equal currGoal cg_attack_reversal) && OFramesHitstun <= 0
    currGoal = cg_bait
  endif
  Seek initial
  Jump
elif Equal skipMainInit sm_execAttack
  label empty_0
  Goto PFC
  Seek empty_0

  ACTIONABLE_ON_GROUND
  skipMainInit = -100

  CallI ExecuteAttack
elif Equal currGoal cg_attack_wall && Rnd < calc(pt_wall_chance * 2) && Rnd > calc(pt_braveChance) && OCurrAction <= hex(0x15)
  label empty_1
  Goto PFC
  Seek empty_1

  ACTIONABLE_ON_GROUND
  label setupWallDelay
  Goto PFC
  XReciever
  Seek setupWallDelay

  if Rnd < 0.1 && Rnd < pt_wall_chance
    XGoto CalcAttackGoal
    XReciever
  endif
  
  #let timer = var0
  globTempVar = OTopNX - TopNX 
  immediateTempVar = OTopNY - TopNY
  Norm timer globTempVar immediateTempVar
  if timer > 45
    Return
  endif
  timer *= Rnd * 0.2
  label wallDelay
  Goto PFC 
  XReciever
  Seek wallDelay
  if timer <= 0
    CallI ExecuteAttack
  endif
  timer -= 1
  Return
elif Equal currGoal cg_camp_attack && Rnd < calc(pt_circleCampChance * 2) && Rnd < pt_aggression
  label empty_2
  Goto PFC
  Seek empty_2

  ACTIONABLE_ON_GROUND
  Seek initial
  Jump
endif

Goto PFC
XReciever


scriptVariant = sv_none
lastAttack = -1

DynamicDiceClear
if Rnd < pt_circleCampChance
  DynamicDiceAdd cg_circleCamp
endif
if Rnd < pt_baitChance
  DynamicDiceAdd cg_bait
endif
if Rnd < pt_aggression
  predictionConfidence immediateTempVar man_OBaitOption LevelValue
  if immediateTempVar > 0.4 || Rnd < pt_aggression
    DynamicDiceAdd cg_attack
  endif
endif
DynamicDiceRoll currGoal
if OFramesHitstun > 5 || ODistLE OHurtboxSize || Equal OCurrAction hex(0x49) || Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  currGoal = cg_attack
elif OCurrAction >= hex(0x4D) && OCurrAction <= hex(0x59)
  currGoal = cg_attack
endif
if Equal currGoal -1
  Call MainHub
elif Equal currGoal cg_attack
  goalY = BBoundary
endif

label initial
Goto PFC
Seek initial
if Equal goalX 0 && Equal goalY 0
  XGoto GoalChoiceHub
  XReciever
endif

#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0
  techSkill = 0.05
endif
LOGSTR str("TSkill")
LOGVAL techSkill
label tskillWait
Goto PFC
XReciever
Seek tskillWait
if Rnd < techSkill
  Seek selectGoal
  Return
endif
LOGSTR str("waiting")
Return
label selectGoal
Goto PFC
XGoto UpdateGoal
XReciever
if Equal goalY BBoundary
  Seek selectGoal
  if Rnd < 0.5
    currGoal = cg_attack
  endif
  Return
elif Equal currGoal cg_attack && Equal lastAttack -1
  Seek selectGoal
  if Rnd < 0.5
    currGoal = cg_attack
  endif
  Return
endif
LOGSTR str("selected")
label navigateToGoal
Goto PFC
XReciever
Seek selectGoal
ACTIONABLE_ON_GROUND
XGoto MoveToGoal
XReciever
Seek selectGoal

Return
label PFC
XGoto PerFrameChecks
XReciever
Return
Return