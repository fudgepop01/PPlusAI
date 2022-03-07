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
baitChance = PT_BAITCHANCE

immediateTempVar = aggression * 0.2
PredictOMov globTempVar mov_grab LevelValue
globTempVar *= 1.75
if !(CalledFrom AttackedHub)
  if Rnd < immediateTempVar || Rnd < globTempVar
    immediateTempVar *= 2
    if !(Equal lastAttack -1) && Rnd < immediateTempVar
      skipMainInit = mainInitSkip
      CallI MainHub
    elif Rnd < immediateTempVar && Rnd < immediateTempVar && Rnd < 0.45
      XGoto CalcAttackGoal
      XReciever
      skipMainInit = mainInitSkip
      CallI MainHub
    endif 
  endif
endif

if Equal AirGroundState 1
  predictOOption immediateTempVar man_ODefendOption LevelValue
  predictionConfidence globTempVar man_ODefendOption LevelValue
  globTempVar *= 2
  if CHANCE_MUL_GE PT_AGGRESSION 0.35 && Rnd < globTempVar && Equal immediateTempVar op_defend_attack
    PredictOMov immediateTempVar mov_grab LevelValue
    immediateTempVar *= 2.5
    if immediateTempVar < 0.20
      CallI Shield
    endif
  endif

  immediateTempVar = aggression * 0.2
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

  #let OXHitDist = var2
  predictAverage OXHitDist man_OXHitDist LevelValue
  anotherTempVar = OXHitDist + 15

  #let dashAwayChance = var3
  dashAwayChance = PT_BAIT_DASHAWAYCHANCE

  GetAttribute immediateTempVar attr_dashInitVel 0

  if Equal IsOnPassableGround 1 && Rnd <= 0.20 && LevelValue >= LV7
    CallI Shield
  elif immediateTempVar > 0.7 && CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.8 && LevelValue >= LV5 && Rnd < 0.85 && ODistLE anotherTempVar
    scriptVariant = sv_dash_away_defense
    CallI DashScr
  endif

  immediateTempVar = OTopNX * TopNX
  if immediateTempVar >= 0
    immediateTempVar = TopNX
    globTempVar = OTopNX
    Abs immediateTempVar
    Abs globTempVar
    if immediateTempVar < globTempVar && Rnd < 0.1
      if Rnd < 0.1
        scriptVariant = sv_roll_through
        CallI Roll
      endif
      GetAttribute immediateTempVar attr_dashInitVel 0
      immediateTempVar *= 8
      if Rnd < 0.1 && immediateTempVar > OXHitDist
        scriptVariant = sv_dash_through
        CallI DashScr
      endif
    elif Rnd < 0.2 && NumJumps > 0
      #let djumpiness = var0
      djumpiness = PT_DJUMPINESS
      if Rnd < 0.2
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
  endif

  #let wdashAwayChance = var0
  wdashAwayChance = PT_BAIT_WDASHAWAYCHANCE
  wdashAwayChance *= 0.75

  GetAttribute immediateTempVar attr_jumpSquatFrames 0
  immediateTempVar *= 0.1
  immediateTempVar = 0.7 - immediateTempVar
  if Rnd < immediateTempVar && Rnd < wdashAwayChance
    scriptVariant = sv_wavedash_out
    CallI Wavedash
  endif

  #let dashAwayChance = var0
  dashAwayChance = PT_BAIT_DASHAWAYCHANCE
  dashAwayChance *= 0.75

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
  if NumJumps > 0 && Rnd < 0.4
    scriptVariant = sv_jump_over
    scriptVariant += svp_jump_fullhop
    CallI JumpScr
  elif NumJumps > 0 && Rnd < 0.1
    scriptVariant = sv_jump_away
    scriptVariant += svp_jump_fullhop
    CallI JumpScr
  elif CalledFrom AttackedHub && NumJumps > 0 && OTopNY < TopNY
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