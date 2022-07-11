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

label initHitPredictValues
getCurrentPredictValue immediateTempVar man_OXHitDist
if Equal immediateTempVar 0
  trackOAction man_OXHitDist 25
  Seek initHitPredictValues
  Jump
endif

#let loopCount = var0
label start

DisableDebugOverlay
if Equal currGoal cg_recover
  CallI RecoveryHub
elif currGoal >= cg_edgeguard
  lastAttack = -1
  Seek navigateToGoal
  Jump
endif

XGoto PerFrameChecks
XReciever
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
    currGoal = cg_attack_reversal
  elif CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.8 && !(Equal currGoal cg_attack_reversal) && OFramesHitstun <= 0 && Equal AirGroundState 1
    currGoal = cg_bait_dashdance
  elif Equal currGoal cg_defend
    currGoal = cg_attack
  endif
  Seek initial
  Jump
elif Equal skipMainInit sm_execAttack
  label empty_0
  XGoto PerFrameChecks
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
elif Equal currGoal cg_attack_wall && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 && !(XDistLE 25)
  label empty_1
  XGoto PerFrameChecks
  XReciever
  Seek empty_1

  ACTIONABLE_ON_GROUND
  label setupWallDelay
  XGoto PerFrameChecks
  XReciever

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
    XReciever
  endif
  Seek setupWallDelay
  
  #let timer = var0
  globTempVar = OTopNX - TopNX 
  immediateTempVar = OTopNY - TopNY
  Norm timer globTempVar immediateTempVar
  Abs timer
  LOGSTR_NL str("TIMER")
  LOGVAL_NL timer
  if timer > 100
    Return
  endif
  timer *= Rnd * 0.2
  label wallDelay
  XGoto PerFrameChecks 
  XReciever
  Seek wallDelay
  if timer <= 0
    CallI ExecuteAttack
  endif
  timer -= 1
  Return
elif Equal currGoal cg_camp_attack && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  XGoto PerFrameChecks
  XReciever
  Seek empty_2

  ACTIONABLE_ON_GROUND
  Seek initial
  Jump
elif Equal currGoal cg_bait_wait
  Seek waitSetup
  Jump
endif

XGoto PerFrameChecks
XReciever

scriptVariant = sv_none
lastAttack = -1

DynamicDiceClear dslot0
if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1
  DynamicDiceAdd dslot0 cg_circleCamp 2
endif

immediateTempVar = PT_BAITCHANCE * 6
DynamicDiceAdd dslot0 cg_bait immediateTempVar
immediateTempVar = PT_BAIT_DASHAWAYCHANCE * 10
DynamicDiceAdd dslot0 cg_bait_dashdance immediateTempVar

if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.3
  SeekNoCommit attack_roll
elif CHANCE_MUL_LE PT_AGGRESSION 0.6
  SeekNoCommit attack_roll
elif Equal HitboxConnected 1
  if !(True)
    label attack_roll
  endif
  immediateTempVar = PT_BAIT_DASHAWAYCHANCE * 2
  DynamicDiceAdd dslot0 cg_bait_dashdance immediateTempVar
  predictionConfidence immediateTempVar man_OBaitOption LevelValue
  if immediateTempVar > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd dslot0 cg_attack 2
  endif
  immediateTempVar = PT_AGGRESSION * 4
  DynamicDiceAdd dslot0 cg_attack immediateTempVar
  GetCommitPredictChance immediateTempVar LevelValue
  immediateTempVar *= 5
  DynamicDiceAdd dslot0 cg_attack_wall immediateTempVar
  immediateTempVar = 5 - immediateTempVar
  DynamicDiceAdd dslot0 cg_attack_reversal immediateTempVar
endif

DynamicDiceRoll dslot0 currGoal 0

GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
if Equal teamCloser 1
  currGoal = cg_circleCamp
elif Equal HitboxConnected 1 || Equal PrevAction hex(0x3C)
  currGoal = cg_attack_reversal
elif Equal immediateTempVar 1
  currGoal = cg_attack_reversal
endif
goalY = BBoundary
if Equal currGoal -1
  Call MainHub
elif Equal currGoal cg_attack
  goalY = BBoundary
endif

label initial
XGoto PerFrameChecks
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
XGoto PerFrameChecks
XReciever
Seek tskillWait
if Rnd < techSkill
  Seek selectGoal
  Return
endif
LOGSTR str("waiting")
Return
label selectGoal
XGoto PerFrameChecks
XReciever
Cmd30
XGoto UpdateGoal
XReciever

if Equal currGoal cg_bait_wait
  label waitSetup
  #let timer = var4
  timer = Rnd * 55 + 5
  label baitWait
  XGoto PerFrameChecks
  XReciever
  XGoto UpdateGoal
  XReciever
  Seek baitWait
  timer -= 1
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar *= 0.5
  if XDistLE immediateTempVar && Rnd <= 0.02
    CallI DefendHub
  endif
  if LevelValue >= LV8
    Stick 0 -1
  endif
  // if Rnd < pt_wall_chance && Rnd < pt_braveChance
  //   Seek setupWallDelay
  //   Jump
  // endif
  if timer <= 0 || !(Equal currGoal cg_bait_wait)
    currGoal = cg_nothing
    skipMainInit = -100
    Call MainHub
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
XGoto PerFrameChecks
XReciever
Seek selectGoal
ACTIONABLE_ON_GROUND

XGoto MoveToGoal
XReciever
Seek selectGoal
Return
Return