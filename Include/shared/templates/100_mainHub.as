#include <Definition_AIMain.h>
id 0x8100
unk 0x0

$genPersonalityStrings()

XReciever
SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE

if ODistLE 180
  SetDisabledMd 6
else
  SetDisabledMd -1
endif

#let loopCount = var0
label start

DisableDebugOverlay
if Equal currGoal cg_recover
  CallI RecoveryHub
elif Equal currGoal cg_edgeguard
  Seek navigateToGoal
  Jump
endif

// JUMP_HEIGHT_TEST

Goto PFC
Seek start

#let teamCloser = var3
GetIsTeammateCloser teamCloser
if Equal teamCloser 1
  skipMainInit = -100
endif

if Equal skipMainInit mainInitSkip
  skipMainInit = -100
  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 1
    currGoal = cg_attack
  elif Rnd < 0.45 && !(Equal currGoal cg_attack_reversal) && OFramesHitstun <= 0
    currGoal = cg_bait_dashdance
  endif
  Seek initial
  Jump
elif Equal skipMainInit sm_execAttack
  label empty_0
  Goto PFC
  XReciever
  Seek empty_0

  if Equal CurrAction hex(0x3) || Equal CurrAction hex(0x4)
    $ifLastOrigin(dashattack, false)
    elif True
      if Equal currGoal cg_defend
        scriptVariant = sv_wavedash_out
      endif
      scriptVariant = sv_wavedash_neutral
      CallI Wavedash 
    endif
  endif
  ACTIONABLE_ON_GROUND
  skipMainInit = -100

  CallI ExecuteAttack
elif Equal currGoal cg_attack_wall && CHANCE_MUL_LE PT_WALL_CHANCE 1.4 && CHANCE_MUL_GE PT_BRAVECHANCE 0.35 && OCurrAction <= hex(0x15)
  label empty_1
  Goto PFC
  XReciever
  Seek empty_1

  ACTIONABLE_ON_GROUND
  label setupWallDelay
  Goto PFC
  XReciever
  Seek setupWallDelay

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
    XReciever
  endif
  
  #let timer = var0
  globTempVar = OTopNX - TopNX 
  immediateTempVar = OTopNY - TopNY
  Norm timer globTempVar immediateTempVar
  if timer > 55
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
elif Equal currGoal cg_camp_attack && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  Goto PFC
  XReciever
  Seek empty_2

  ACTIONABLE_ON_GROUND
  Seek initial
  Jump
elif Equal currGoal cg_bait_wait
  Seek waitSetup
  Jump
endif

Goto PFC
XReciever

scriptVariant = sv_none
lastAttack = -1

DynamicDiceClear dslot0
if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1
  DynamicDiceAdd dslot0 cg_circleCamp 1
endif
if CHANCE_MUL_LE PT_BAITCHANCE 1
  DynamicDiceAdd dslot0 cg_bait 1.75
  DynamicDiceAdd dslot0 cg_bait_dashdance 3
endif
if CHANCE_MUL_LE PT_AGGRESSION 1
  predictionConfidence immediateTempVar man_OBaitOption LevelValue
  if immediateTempVar > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd dslot0 cg_attack 2
  endif
endif
DynamicDiceRoll dslot0 currGoal 0

GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
if Equal teamCloser 1
  currGoal = cg_circleCamp
elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  currGoal = cg_attack
elif Equal immediateTempVar 1
  currGoal = cg_attack
endif
goalY = BBoundary
if Equal currGoal -1
  Call MainHub
elif Equal currGoal cg_attack
  goalY = BBoundary
endif

label initial
Goto PFC
XReciever
Seek initial
if Equal goalX 0 && Equal goalY 0
  XGoto GoalChoiceHub
  XReciever
  Seek initial
endif

#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0
  techSkill = 0.05
endif
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
XReciever
XGoto UpdateGoal
XReciever

if Equal currGoal cg_bait_wait
  label waitSetup
  #let timer = var4
  timer = Rnd * 55 + 5
  label baitWait
  Goto PFC
  XReciever
  XGoto UpdateGoal
  XReciever
  Seek baitWait
  timer -= 1
  // if Rnd < pt_wall_chance && Rnd < pt_braveChance
  //   Seek setupWallDelay
  //   Jump
  // endif
  if timer <= 0 || !(Equal currGoal cg_bait_wait)
    currGoal = cg_attack
    Seek selectGoal
  endif
  Return
elif Equal goalY BBoundary
  Seek selectGoal
  if Rnd < 0.1
    currGoal = cg_bait_dashdance
  endif
  Return
elif Equal currGoal cg_attack && Equal lastAttack -1
  Seek selectGoal
  Return
endif
label navigateToGoal
Goto PFC
XReciever
Seek selectGoal
ACTIONABLE_ON_GROUND

Goto PFC
XReciever
XGoto MoveToGoal
XReciever
Seek selectGoal
Return
label PFC
XGoto PerFrameChecks
XReciever
Return
Return