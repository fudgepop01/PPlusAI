#include <Definition_AIMain.h>
id 0x8100
unk 0x0

$genPersonalityStrings()

//= XReciever

// XGoto PerFrameChecks
//= XReciever

SetAutoDefend 0
SetDisabledSwitch 1
SetDebugMode TEMP_DEBUG_TOGGLE
// SetDebugMode 1

SetDisabledMd -1

LOGSTR str("cg mainStart")
LOGVAL currGoal
PRINTLN

if TRAINING_MODE_OPTION >= 0
  XGoto PerFrameChecks
  ADJUST_PERSONALITY idx_aggression -100 1
  ADJUST_PERSONALITY idx_bait_dashAwayChance -100 1
  ADJUST_PERSONALITY idx_bait_wdashAwayChance -100 1
  ADJUST_PERSONALITY idx_baitChance -100 1
  ADJUST_PERSONALITY idx_braveChance -100 1
  ADJUST_PERSONALITY idx_circleCampChance -100 1
  // ADJUST_PERSONALITY idx_djumpiness -100 1
  // ADJUST_PERSONALITY idx_jumpiness -100 1
  // ADJUST_PERSONALITY idx_platChance -100 1
  // ADJUST_PERSONALITY idx_SDIChance  1
  ADJUST_PERSONALITY idx_wall_chance -100 1
  // ADJUST_PERSONALITY idx_reaction_time 100 1
  
  ClearStick
  if Equal TRAINING_MODE_OPTION TRAIN_ATTACK
    ADJUST_PERSONALITY idx_aggression 100 1
    ADJUST_PERSONALITY idx_braveChance 100 1
    Seek initHitPredictValues
  elif Equal TRAINING_MODE_OPTION TRAIN_RUN
    ADJUST_PERSONALITY idx_circleCampChance 100 1
    ADJUST_PERSONALITY idx_baitChance 100 1
    Seek initHitPredictValues
  elif Equal TRAINING_MODE_OPTION TRAIN_SHIELD
    Button R
  elif Equal TRAINING_MODE_OPTION TRAIN_CROUCH
    AbsStick 0 -1
  elif Equal TRAINING_MODE_OPTION TRAIN_WALK
    if Equal CurrAction hex(0x7C) || Equal CurrAction hex(0x7D)
      Stick -0.7
    else
      Stick 0.7
    endif 
  elif Equal TRAINING_MODE_OPTION TRAIN_JUMP
    if Equal AirGroundState 1 && CurrAction <= hex(0xA)
      Button X
    endif
  endif
  Return
endif

label initHitPredictValues
getCurrentPredictValue immediateTempVar man_OXHitDist
if Equal immediateTempVar 0
  trackOAction man_OXHitDist 15
  Seek initHitPredictValues
  Jump
endif

label start

DisableDebugOverlay
if Equal currGoal cg_recover && Equal YDistFloor -1
  CallI RecoveryHub
elif currGoal >= cg_edgeguard
  lastAttack = -1
  Seek navigateToGoal
  Jump
endif

XGoto PerFrameChecks
//= XReciever
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
  endif
  if !(Equal lastAttack -1)
    XGoto SetAttackGoal
    //= XReciever
    IF_AERIAL_ATTACK(var0)
    elif Equal CurrSubaction JumpSquat
      scriptVariant = sv_wavedash_in
      Call Wavedash      
    endif
  endif
  Seek initial
  Jump
elif Equal skipMainInit sm_execAttack
  label empty_0
  XGoto PerFrameChecks
  //= XReciever
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
  Goto isActionable
  Seek empty_0
  if Equal immediateTempVar 0
    Return
  endif
  skipMainInit = -100

  CallI ExecuteAttack
elif Equal currGoal cg_attack_wall && CHANCE_MUL_LE PT_WALL_CHANCE 0.45 && !(XDistLE 25) 
  if YDistFloor > 25
    currGoal = cg_nothing
    lastAttack = -1
    Seek rollTactics
    Jump
  endif
  label empty_1
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_1

  Goto isActionable
  if Equal immediateTempVar 0
    Return
  endif
  label setupWallDelay
  XGoto PerFrameChecks
  //= XReciever

  if Rnd < 0.1 && CHANCE_MUL_LE PT_WALL_CHANCE 1
    XGoto CalcAttackGoal
  elif Equal lastAttack -1 
    XGoto CalcAttackGoal
  endif
  Seek setupWallDelay
  
  #let timer = var0
  globTempVar = OTopNX - TopNX 
  immediateTempVar = OTopNY - TopNY
  Norm timer globTempVar immediateTempVar
  Abs timer
  LOGSTR_NL str("TIMER")
  LOGVAL_NL timer
  if timer > 120
    currGoal = cg_nothing
    Call MainHub
    Return
  endif
  timer *= 0.35
  label wallDelay
  XGoto PerFrameChecks 
  //= XReciever
  Seek wallDelay
  if timer <= 0
    CallI ExecuteAttack
  endif
  timer -= 1
  Return
elif Equal currGoal cg_camp_attack && CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 1.3 && CHANCE_MUL_LE PT_AGGRESSION 1
  label empty_2
  XGoto PerFrameChecks
  //= XReciever
  Seek empty_2

  Goto isActionable
  if Equal immediateTempVar 0
    Return
  endif
  Seek initial
  Jump
elif Equal currGoal cg_bait_wait
  Seek waitSetup
  Jump
endif

label rollTactics

XGoto PerFrameChecks
//= XReciever

scriptVariant = sv_none
lastAttack = -1

DynamicDiceClear dslot0
anotherTempVar = TopNX - OTopNX
Abs anotherTempVar
immediateTempVar = PT_CIRCLECAMPCHANCE * anotherTempVar * 0.025
DynamicDiceAdd dslot0 cg_bait_attack immediateTempVar
immediateTempVar *= 2
DynamicDiceAdd dslot0 cg_circleCamp immediateTempVar

// Functions = things that give a value
// Requirements = stuff that go in an if condition
// Commands = controls logic flow and interacts with game itself

immediateTempVar = PT_BAITCHANCE
DynamicDiceAdd dslot0 cg_bait immediateTempVar
immediateTempVar += PT_AGGRESSION
DynamicDiceAdd dslot0 cg_bait_attack immediateTempVar
immediateTempVar = PT_BAIT_DASHAWAYCHANCE * 2
DynamicDiceAdd dslot0 cg_bait_dashdance immediateTempVar

anotherTempVar = LevelValue * 0.0075
if Equal HitboxConnected 0 && CHANCE_MUL_LE PT_AGGRESSION 0.2
  SeekNoCommit attack_roll
elif CHANCE_MUL_LE PT_AGGRESSION anotherTempVar
  SeekNoCommit attack_roll
endif
immediateTempVar = LevelValue * 0.0075
anotherTempVar = 1 - immediateTempVar
PredictOMov immediateTempVar mov_attack LevelValue
immediateTempVar *= anotherTempVar
if immediateTempVar < 0.05
  SeekNoCommit attack_roll
elif Equal HitboxConnected 1
  if !(True)
    label attack_roll
  endif
  immediateTempVar = PT_BAIT_DASHAWAYCHANCE
  DynamicDiceAdd dslot0 cg_bait_dashdance immediateTempVar
  predictionConfidence immediateTempVar man_OBaitOption LevelValue
  if immediateTempVar > 0.4 || CHANCE_MUL_LE PT_AGGRESSION 0.35
    DynamicDiceAdd dslot0 cg_attack 2
  endif
  immediateTempVar = PT_AGGRESSION * 4
  DynamicDiceAdd dslot0 cg_attack immediateTempVar
  GetCommitPredictChance immediateTempVar LevelValue
  if YDistFloor < 25
    immediateTempVar *= 2.5 * PT_WALL_CHANCE
    DynamicDiceAdd dslot0 cg_attack_wall immediateTempVar
  endif
  immediateTempVar = 5 - immediateTempVar
  DynamicDiceAdd dslot0 cg_attack_reversal immediateTempVar
endif

DynamicDiceRoll dslot0 currGoal 0

LOGSTR str("goal")
LOGVAL currGoal
PRINTLN

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
//= XReciever
Seek initial
// if Equal goalX 0 && Equal goalY 0
//   XGoto GoalChoiceHub
//   //= XReciever
//   Seek initial
// endif
Goto isActionable
if Equal immediateTempVar 0
  Seek initial
  Return
endif

#let techSkill = var0
techSkill = LevelValue * 0.01
if techSkill < 0
  techSkill = 0.01
endif
label tskillWait
XGoto PerFrameChecks
Seek tskillWait
if Rnd < techSkill
  Seek selectGoal
  Return
endif
Return
label selectGoal
XGoto PerFrameChecks
Cmd30
// if TEMP_DEBUG_TOGGLE > 0
//   lastAttack = Damage
//   currGoal = cg_attack_reversal
//   CALL_EVENT(chr_cs_moveName)
//   PRINTLN
//   XGoto SetAttackGoal
//   XGoto CheckAttackWillHit
// else
  XGoto UpdateGoal
  LOGSTR str("cg-post UpD")
  LOGVAL currGoal
// endif
PRINTLN

if Equal currGoal cg_bait_wait
  label waitSetup
  #let timer = var4
  timer = Rnd * 55 + 5
  label baitWait
  LOGSTR_NL str("BAIT_WAIT")
  STACK_PUSH timer st_function
  XGoto PerFrameChecks
  //= XReciever
  XGoto UpdateGoal
  //= XReciever
  if Equal CurrAction hex(0x49)
    XGoto AttackedHub
  endif
  timer = STACK_POP
  Seek baitWait
  timer -= 1
  predictAverage immediateTempVar man_OXHitDist LevelValue
  immediateTempVar *= 0.5
  if XDistLE immediateTempVar && Rnd <= 0.02
    CallI DefendHub
  endif
  immediateTempVar *= 3
  if XDistLE immediateTempVar && CHANCE_MUL_LE PT_AGGRESSION 0.05
    lastAttack = -1
    currGoal = cg_attack_wall
    Seek selectGoal
    Jump
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
  Return
elif Equal currGoal cg_attack && Equal lastAttack -1
  Seek selectGoal
  Return
endif
label navigateToGoal
XGoto PerFrameChecks
Goto isActionable
Seek selectGoal
if Equal immediateTempVar 0
  Return
endif

XGoto MoveToGoal
Seek selectGoal
Return
label isActionable
immediateTempVar = 0
ACTIONABLE_ON_GROUND
immediateTempVar = 1
Return
Return