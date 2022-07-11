#include <Definition_AIMain.h>
id 0x8102
unk 0x0

XReciever
EnableDebugOverlay 
SetDebugOverlayColor color(0xDDDD0088)
currGoal = cg_defend
label begin
XGoto PerFrameChecks
XReciever

#let aggression = var0
aggression = PT_AGGRESSION

#let baitChance = var1
baitChance = pt_baitChance

// immediateTempVar = aggression * 0.08
// globTempVar *= 1.75
// if !(CalledFrom AttackedHub)
//   GetCommitPredictChance anotherTempVar LevelValue
//   if anotherTempVar > 0.45 && Rnd < anotherTempVar && CHANCE_MUL_LE immediateTempVar 1
//     scriptVariant = sv_fastAttack
//     XGoto CalcAttackGoal
//     XReciever
//     skipMainInit = mainInitSkip
//     CallI MainHub
//   endif
// endif

if CHANCE_MUL_LE PT_AGGRESSION 0.65
  currGoal = cg_attack_reversal
endif

if Equal AirGroundState 1
  predictOOption immediateTempVar man_ODefendOption LevelValue
  predictionConfidence globTempVar man_ODefendOption LevelValue
  globTempVar *= 2
  if CHANCE_MUL_GE PT_AGGRESSION 0.65 && Rnd < globTempVar && Equal immediateTempVar op_defend_attack
    PredictOMov immediateTempVar mov_grab LevelValue
    immediateTempVar *= 2.5
    if immediateTempVar < 0.25
      CallI Shield
    endif
  endif

  #let OXHitDist = var2
  predictAverage OXHitDist man_OXHitDist LevelValue

  immediateTempVar = TopNX
  globTempVar = OTopNX
  Abs immediateTempVar
  Abs globTempVar
  if immediateTempVar > globTempVar && Rnd < 0.2
    if Rnd < 0.3
      scriptVariant = sv_roll_through
      CallI Roll
    endif
    GetAttribute immediateTempVar attr_dashInitVel 0
    immediateTempVar *= 8
    if Rnd < 0.1 && immediateTempVar > OXHitDist
      scriptVariant = sv_dash_through
      CallI DashScr
    endif
  elif immediateTempVar < globTempVar && Rnd < 0.2
    if Rnd < 0.3
      scriptVariant = sv_roll_away
      CallI Roll
    endif
    scriptVariant = sv_dash_away
    CallI DashScr
  elif Rnd < 0.05 && NumJumps > 0
    #let djumpiness = var3
    djumpiness = PT_DJUMPINESS
    if Rnd < 0.05
      scriptVariant = sv_roll_through
      CallI Roll
    elif Rnd < 0.4 && Rnd < djumpiness
      scriptVariant = sv_jump_over
      scriptVariant += svp_jump_fullhop
      CallI JumpScr
    endif
    GetAttribute immediateTempVar attr_dashInitVel 0
    immediateTempVar *= 8
    if Rnd < 0.2 && immediateTempVar > OXHitDist
      scriptVariant = sv_dash_through
      CallI DashScr
    endif
  endif

  immediateTempVar = aggression * 0.08
  if Rnd < 0.5
    currGoal = cg_bait
  else
    currGoal = cg_bait_dashdance
  endif
  skipMainInit = mainInitSkip
  if Rnd < immediateTempVar && Rnd < immediateTempVar
    currGoal = cg_attack_reversal
    skipMainInit = mainInitSkip
  endif

  anotherTempVar = OXHitDist + 15

  #let dashAwayChance = var3
  dashAwayChance = PT_BAIT_DASHAWAYCHANCE

  GetAttribute immediateTempVar attr_dashInitVel 0

  if Equal IsOnPassableGround 1 && Rnd <= 0.20 && LevelValue >= LV7
    CallI Shield
  elif immediateTempVar > 0.7 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.4 && LevelValue >= LV5 && Rnd < 0.85 && ODistLE anotherTempVar && CHANCE_MUL_LE PT_AGGRESSION 1.5
    scriptVariant = sv_dash_away_defense
    CallI DashScr
  endif

  #let wdashAwayChance = var0
  wdashAwayChance = PT_BAIT_WDASHAWAYCHANCE
  wdashAwayChance *= 0.3

  GetAttribute immediateTempVar attr_jumpSquatFrames 0
  immediateTempVar *= 0.1
  immediateTempVar = 0.7 - immediateTempVar
  if Rnd < immediateTempVar && Rnd < wdashAwayChance
    scriptVariant = sv_wavedash_out
    CallI Wavedash
  endif

  #let dashAwayChance = var0
  dashAwayChance = PT_BAIT_DASHAWAYCHANCE
  dashAwayChance *= 0.35

  GetAttribute immediateTempVar attr_dashInitVel 0
  immediateTempVar *= 5
  globTempVar = OTopNX - TopNX
  Abs globTempVar
  immediateTempVar += globTempVar

  if OXHitDist < immediateTempVar && Rnd < dashAwayChance && Rnd < 0.6
    scriptVariant = sv_dash_away
    CallI DashScr
  endif
endif

// maybe make driftAway based on air mobility?
#let OXHitDist = var0
predictAverage OXHitDist man_OXHitDist LevelValue
OXHitDist += 25
PredictOMov immediateTempVar mov_attack LevelValue
if ODistLE OXHitDist && CHANCE_MUL_LE immediateTempVar 4
  if CalledFrom AttackedHub && CHANCE_MUL_LE PT_AGGRESSION 0.75
    scriptVariant = sv_fastAttack
    XGoto CalcAttackGoal
    XReciever
    skipMainInit = mainInitSkip
    CallI MainHub
  endif 
  if NumJumps > 0 && Rnd < 0.2
    scriptVariant = sv_jump_over
    scriptVariant += svp_jump_fullhop
    CallI JumpScr
  elif NumJumps > 0 && Rnd < 0.1
    scriptVariant = sv_jump_away
    scriptVariant += svp_jump_fullhop
    CallI JumpScr
  elif CalledFrom AttackedHub && NumJumps > 0 && OTopNY < TopNY && CHANCE_MUL_LE PT_AGGRESSION 0.8
    scriptVariant = sv_jump_away
    scriptVariant += svp_jump_fullhop
    skipMainInit = mainInitSkip
    currGoal = cg_attack_reversal
    CallI JumpScr
  elif Rnd < 0.4 && YDistFloor > 25
    scriptVariant = sv_aerialdrift_away
    CallI AerialDrift
  endif
endif

PredictOMov immediateTempVar mov_grab LevelValue
immediateTempVar *= 2
if immediateTempVar < 0.30 && Rnd > immediateTempVar && Equal AirGroundState 1
  CallI Shield
endif
if !(Equal lastAttack -1)
  skipMainInit = mainInitSkip
  CallI MainHub
else
  XGoto CalcAttackGoal
  XReciever
  skipMainInit = mainInitSkip
  CallI MainHub
endif 
Return
Return