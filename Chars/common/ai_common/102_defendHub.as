#include <Definition_AIMain.h>
id 0x8102
unk 0x0

XReciever
EnableDebugOverlay 
SetDebugOverlayColor color(0xDDDD0088)
if Equal currGoal cg_recover
  scriptVariant = sv_aerialdrift_away
  CallI AerialDrift
  Return
endif
currGoal = cg_defend
label begin
XGoto PerFrameChecks
XReciever

if Equal AirGroundState 1
  #let aggression = var0
  GET_CHAR_TRAIT(aggression, chr_pt_aggression)

  predictOOption immediateTempVar man_ODefendOption LevelValue
  predictionConfidence globTempVar man_ODefendOption LevelValue
  aggression *= 0.8
  globTempVar *= 2
  if Rnd > aggression && Rnd < globTempVar && Equal immediateTempVar op_defend_attack
    CallI Shield
  endif

  #let OXHitDist = var0
  predictAverage OXHitDist man_OXHitDist LevelValue
  anotherTempVar = OXHitDist + 5

  GetAttribute immediateTempVar attr_dashInitVel 0

  #let dashAwayChance = var0
  GET_CHAR_TRAIT(dashAwayChance, chr_pt_bait_dashAwayChance)
  if Equal IsOnPassableGround 1 && Rnd <= 0.20 && LevelValue >= LV7
    CallI Shield
  elif immediateTempVar > 0.8 && Rnd < dashAwayChance && Rnd < dashAwayChance && LevelValue >= LV5 && Rnd < 0.65 && !(ODistLE anotherTempVar)
    scriptVariant = sv_dash_away
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
    elif Rnd < 0.45
      #let djumpiness = var0
      GET_CHAR_TRAIT(djumpiness, chr_pt_djumpiness)
      if Rnd < 0.5
        scriptVariant = sv_roll_through
        CallI Roll
      elif Rnd < 0.8 && Rnd < djumpiness
        scriptVariant = sv_jump_over
        CallI JumpScr
      endif
      GetAttribute immediateTempVar attr_dashInitVel 0
      immediateTempVar *= 8
      if Rnd < 0.6 && immediateTempVar > OXHitDist
        scriptVariant = sv_dash_through
        CallI DashScr
      endif
    endif
  endif

  GetAttribute immediateTempVar attr_jumpSquatFrames 0
  immediateTempVar *= 0.1
  immediateTempVar = 0.8 - immediateTempVar
  #let wdashAwayChance = var0
  GET_CHAR_TRAIT(wdashAwayChance, chr_pt_bait_wdashAwayChance)
  if Rnd < immediateTempVar && Rnd < wdashAwayChance
    scriptVariant = sv_wavedash_out
    CallI Wavedash
  endif

  GetAttribute immediateTempVar attr_dashInitVel 0
  immediateTempVar *= 5
  globTempVar = OTopNX - TopNX
  Abs globTempVar
  immediateTempVar += globTempVar
  #let dashAwayChance = var0
  GET_CHAR_TRAIT(dashAwayChance, chr_pt_bait_dashAwayChance)

  if OXHitDist < immediateTempVar && Rnd < dashAwayChance && Rnd < 0.6
    scriptVariant = sv_dash_away
    CallI DashScr
  endif

  CallI Shield
endif

// maybe make driftAway based on air mobility?
#let OXHitDist = var0
predictAverage OXHitDist man_OXHitDist LevelValue
OXHitDist += 15
if Rnd < 0.1 && !(ODistLE OXHitDist)
  if NumJumps > 0 && Rnd < 0.4
    scriptVariant = sv_jump_over
    CallI JumpScr
  elif NumJumps > 0 && Rnd < 0.4
    scriptVariant = sv_jump_away
    CallI JumpScr
  elif Rnd < 0.4 && !(OutOfStage) 
    scriptVariant = sv_aerialdrift_away
    CallI AerialDrift
  endif
endif

CallI FastAerial

Return
Return