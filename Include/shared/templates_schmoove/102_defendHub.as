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
  #let OXHitDist = var0
  predictAverage OXHitDist man_OXHitDist LevelValue

  GetAttribute immediateTempVar attr_dashInitVel 0
  if Equal IsOnPassableGround 1 && Rnd <= 0.35 && LevelValue >= LV7
    CallI Shield
  elif immediateTempVar > 0.8 && Rnd < pt_bait_dashAwayChance && Rnd < pt_bait_dashAwayChance
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
    elif Rnd < 0.8
      if Rnd < 0.4
        scriptVariant = sv_roll_through
        CallI Roll
      elif Rnd < 0.6
        scriptVariant = sv_jump_over
        CallI JumpScr
      endif
      GetAttribute immediateTempVar attr_dashInitVel 0
      immediateTempVar *= 8
      if Rnd < 0.7 && immediateTempVar > OXHitDist
        scriptVariant = sv_dash_through
        CallI DashScr
      endif
    endif
  endif

  GetAttribute immediateTempVar attr_jumpSquatFrames 0
  immediateTempVar *= 0.1
  immediateTempVar = 0.8 - immediateTempVar
  if Rnd < immediateTempVar
    scriptVariant = sv_wavedash_out
    CallI Wavedash
  endif

  GetAttribute immediateTempVar attr_dashInitVel 0
  immediateTempVar *= 5
  globTempVar = OTopNX - TopNX
  Abs globTempVar
  immediateTempVar += globTempVar
  if OXHitDist < immediateTempVar
    scriptVariant = sv_dash_away
    CallI DashScr
  endif

  CallI Shield
endif

// maybe make driftAway based on air mobility?
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

// CallI FastAerial

Return
Return