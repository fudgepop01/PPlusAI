#snippet EVT_GOT_HIT
  if CalledFrom BoardPlatform
    ADJUST_PERSONALITY idx_platChance -0.04
  elif CalledFrom ExecuteAttack
    ADJUST_PERSONALITY idx_aggression -0.005
    ADJUST_PERSONALITY idx_baitChance 0.02
  elif CalledFrom Shield 
    ADJUST_PERSONALITY idx_aggression 0.04
    ADJUST_PERSONALITY idx_braveChance 0.02
  elif CalledFrom Wavedash
    if Rnd < 0.5
      ADJUST_PERSONALITY idx_bait_wdashAwayChance -0.02
    endif
    if Rnd < 0.5
      ADJUST_PERSONALITY idx_bait_dashAwayChance 0.02
    endif
    if Equal scriptVariant sv_wavedash_in || Equal scriptVariant sv_wavedash_goal
      ADJUST_PERSONALITY idx_aggression -0.02
    elif Equal scriptVariant sv_wavedash_out
      ADJUST_PERSONALITY idx_aggression 0.02
    endif
  elif CalledFrom JumpScr
    ADJUST_PERSONALITY idx_jumpiness -0.025
    if Equal scriptVariant sv_jump_over
      ADJUST_PERSONALITY idx_aggression -0.03
      ADJUST_PERSONALITY idx_braveChance -0.03
    elif Equal scriptVariant sv_jump_away
      ADJUST_PERSONALITY idx_aggression 0.025
    endif
  elif CalledFrom AerialDrift
    ADJUST_PERSONALITY idx_djumpiness -0.01
  elif CalledFrom DashScr
    if Rnd < 0.5
      ADJUST_PERSONALITY idx_bait_dashAwayChance -0.02
    endif
    if Rnd < 0.5
      ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.02
    endif
    if Equal scriptVariant sv_dash_towards
      ADJUST_PERSONALITY idx_aggression -0.025
      ADJUST_PERSONALITY idx_braveChance -0.02
    elif Equal scriptVariant sv_dash_away
      ADJUST_PERSONALITY idx_aggression 0.025
      ADJUST_PERSONALITY idx_braveChance 0.02
    endif
  endif
#endsnippet

#snippet EVT_CHR_CHECKS
  if Rnd <= 0.01 && Rnd <= 0.1
    immediateTempVar = Rnd * 0.006
    ADJUST_PERSONALITY idx_platChance immediateTempVar
    immediateTempVar = Rnd * 0.004
    ADJUST_PERSONALITY idx_aggression immediateTempVar
    immediateTempVar = Rnd * 0.002
    ADJUST_PERSONALITY idx_braveChance immediateTempVar
    immediateTempVar = Rnd * 0.0005
    ADJUST_PERSONALITY idx_jumpiness immediateTempVar
    immediateTempVar = Rnd * 0.0003
    ADJUST_PERSONALITY idx_djumpiness immediateTempVar
    immediateTempVar = Rnd * 0.004
    ADJUST_PERSONALITY idx_baitChance immediateTempVar
  endif
#endsnippet

#snippet EVT_RANGED_HIT
  ADJUST_PERSONALITY idx_circleCampChance 0.01
#endsnippet