#snippet EVT_GOT_HIT
  immediateTempVar = (1 - (LevelValue / 50)) * 0.6

  if PT_AGGRESSION >= 1.8 && Rnd <= 0.35
    immediateTempVar = Rnd * -1
    ADJUST_PERSONALITY idx_aggression immediateTempVar Rnd
  endif

  if CHANCE_MUL_LE PT_BAITCHANCE 0.3
    ADJUST_PERSONALITY idx_baitChance -0.004 immediateTempVar
  elif CHANCE_MUL_GE PT_BAITCHANCE 0.8
    ADJUST_PERSONALITY idx_baitChance 0.008 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_BAIT_DASHAWAYCHANCE 0.2
    ADJUST_PERSONALITY idx_bait_dashAwayChance -0.002 immediateTempVar
  elif CHANCE_MUL_GE PT_BAIT_DASHAWAYCHANCE 0.6
    ADJUST_PERSONALITY idx_bait_dashAwayChance 0.003 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_BAIT_WDASHAWAYCHANCE 0.2
    ADJUST_PERSONALITY idx_bait_wdashAwayChance -0.002 immediateTempVar
  elif CHANCE_MUL_GE PT_BAIT_WDASHAWAYCHANCE 0.6
    ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.003 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_WALL_CHANCE 0.3 || Equal currGoal cg_attack_wall
    ADJUST_PERSONALITY idx_wall_chance -0.002 immediateTempVar
  elif CHANCE_MUL_GE PT_WALL_CHANCE 0.3
    ADJUST_PERSONALITY idx_wall_chance 0.003 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_BRAVECHANCE 0.4
    ADJUST_PERSONALITY idx_braveChance -0.004 immediateTempVar
  elif CHANCE_MUL_GE PT_BRAVECHANCE 0.7
    ADJUST_PERSONALITY idx_braveChance 0.003 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_CIRCLECAMPCHANCE 0.3 || Equal currGoal cg_circleCamp
    ADJUST_PERSONALITY idx_circleCampChance -0.008 immediateTempVar
  elif CHANCE_MUL_GE PT_CIRCLECAMPCHANCE 0.6
    ADJUST_PERSONALITY idx_circleCampChance 0.002 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_JUMPINESS calc(1 - pt_jumpiness)
    ADJUST_PERSONALITY idx_jumpiness -0.003 immediateTempVar
  elif CHANCE_MUL_GE PT_JUMPINESS calc(1 - pt_jumpiness)
    ADJUST_PERSONALITY idx_jumpiness 0.004 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_DJUMPINESS calc(1 - pt_djumpiness)
    ADJUST_PERSONALITY idx_djumpiness -0.003 immediateTempVar
  elif CHANCE_MUL_GE PT_DJUMPINESS calc(1 - pt_djumpiness)
    ADJUST_PERSONALITY idx_djumpiness 0.004 immediateTempVar
  endif

  if CHANCE_MUL_LE PT_PLATCHANCE 0.7
    ADJUST_PERSONALITY idx_platChance -0.003 immediateTempVar
  elif CHANCE_MUL_GE PT_PLATCHANCE 0.7
    ADJUST_PERSONALITY idx_platChance 0.002 immediateTempVar
  endif
  
  immediateTempVar = (1 - (LevelValue / 50))
  if CalledFrom ExecuteAttack
    // if PT_AGGRESSION < 0.2 && LevelValue >= LV7
    //   ADJUST_PERSONALITY idx_aggression -1.5 1
    //   ADJUST_PERSONALITY idx_baitChance -0.75 1
    // endif

    ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
    ADJUST_PERSONALITY idx_baitChance 0.002 immediateTempVar
  elif CalledFrom Shield 
    ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
    ADJUST_PERSONALITY idx_braveChance 0.002 immediateTempVar
  endif
#endsnippet

#snippet EVT_CHR_CHECKS
#endsnippet

#snippet EVT_RANGED_HIT
#endsnippet