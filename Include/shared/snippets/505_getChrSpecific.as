#snippet EVT_GOT_HIT
  immediateTempVar = LevelValue * 0.0015
  if Rnd < immediateTempVar
    ADJUST_PERSONALITY idx_aggression -3 1
    ADJUST_PERSONALITY idx_aggression 1.35 1
    ADJUST_PERSONALITY idx_baitChance -3 1
    ADJUST_PERSONALITY idx_wall_chance -3 1
    ADJUST_PERSONALITY idx_braveChance -3 1
    ADJUST_PERSONALITY idx_circleCampChance -3 1

    ADJUST_PERSONALITY idx_aggression 3 Rnd
    ADJUST_PERSONALITY idx_baitChance 3 Rnd
    ADJUST_PERSONALITY idx_wall_chance 3 Rnd
    ADJUST_PERSONALITY idx_braveChance 3 Rnd
    ADJUST_PERSONALITY idx_circleCampChance 3 Rnd
  else
    immediateTempVar = (1 - (LevelValue / 50)) * 0.6

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
    if CalledFrom BoardPlatform
      ADJUST_PERSONALITY idx_platChance -0.04 immediateTempVar
    elif CalledFrom ExecuteAttack
      // if PT_AGGRESSION < 0.2 && LevelValue >= LV7
      //   ADJUST_PERSONALITY idx_aggression 1.5 1
      //   ADJUST_PERSONALITY idx_baitChance -0.75 1
      // endif

      ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
      ADJUST_PERSONALITY idx_baitChance 0.002 immediateTempVar
    elif CalledFrom Shield 
      ADJUST_PERSONALITY idx_aggression -0.002 immediateTempVar
      ADJUST_PERSONALITY idx_braveChance 0.002 immediateTempVar
    elif CalledFrom Wavedash
      if Rnd < 0.5
        ADJUST_PERSONALITY idx_bait_wdashAwayChance -0.02 immediateTempVar
      endif
      if Rnd < 0.5
        ADJUST_PERSONALITY idx_bait_dashAwayChance 0.02 immediateTempVar
      endif
      if Equal scriptVariant sv_wavedash_in || Equal scriptVariant sv_wavedash_goal
        ADJUST_PERSONALITY idx_aggression -0.004 immediateTempVar
      elif Equal scriptVariant sv_wavedash_out
        ADJUST_PERSONALITY idx_aggression 0.002 immediateTempVar
      endif
    elif CalledFrom DashScr
      if Rnd < 0.5
        ADJUST_PERSONALITY idx_bait_dashAwayChance -0.002 immediateTempVar
      endif
      if Rnd < 0.5
        ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.002 immediateTempVar
      endif
      if Equal scriptVariant sv_dash_towards
        ADJUST_PERSONALITY idx_aggression -0.0025 immediateTempVar
        ADJUST_PERSONALITY idx_braveChance -0.002 immediateTempVar
      elif Equal scriptVariant sv_dash_away
        ADJUST_PERSONALITY idx_aggression 0.0025 immediateTempVar
        ADJUST_PERSONALITY idx_braveChance 0.002 immediateTempVar
      endif
    endif
  endif
#endsnippet

#snippet EVT_CHR_CHECKS
  if Rnd <= 0.02 && Rnd <= 0.1
    GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    if Equal immediateTempVar 0
      immediateTempVar = (1 - (LevelValue / 50)) * 0.6
      ADJUST_PERSONALITY idx_baitChance 0.004 immediateTempVar
      ADJUST_PERSONALITY idx_bait_dashAwayChance 0.002 immediateTempVar
      ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.002 immediateTempVar
      ADJUST_PERSONALITY idx_wall_chance 0.001 immediateTempVar
      ADJUST_PERSONALITY idx_circleCampChance 0.002 immediateTempVar
    endif
  endif
#endsnippet

#snippet EVT_RANGED_HIT
  ADJUST_PERSONALITY idx_circleCampChance 0.025 1
#endsnippet

#snippet EVT_CHECK_DEFEND

  immediateTempVar = (1 - (LevelValue / 100)) * 60 + 10
  immediateTempVar *= PT_REACTION_TIME
  GetCommitPredictChance anotherTempVar LevelValue
  anotherTempVar = 1.1 - anotherTempVar
  anotherTempVar *= 0.5
  immediateTempVar *= anotherTempVar
  anotherTempVar = AnimFrame
  MOD immediateTempVar anotherTempVar immediateTempVar
  if immediateTempVar <= 1 || Equal currGoal cg_bait_wait
    $tempVar(OEndLag,anotherTempVar)
    GET_CHAR_TRAIT(OEndLag, chr_get_OEndlagSafe)
    if Equal currGoal cg_attack_reversal || Equal currGoal cg_bait_shield
    elif OEndLag >= 12
      immediateTempVar = OEndLag * 2
      if OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
      elif XDistLE immediateTempVar && OAttacking
        currGoal = cg_bait_dashawayWhenApproached
        if CHANCE_MUL_LE PT_AGGRESSION 0.6
          currGoal = cg_bait_shield
        endif
      endif
      predictAverage immediateTempVar man_OXHitDist LevelValue
      immediateTempVar *= 1
      immediateTempVar += OEndLag + 20
      if XDistLE immediateTempVar
        RetrieveFullATKD immediateTempVar anotherTempVar globTempVar anotherTempVar anotherTempVar anotherTempVar anotherTempVar OCurrSubaction 1
        if Equal immediateTempVar 0
          immediateTempVar = OEndFrame
        endif 
        if OAnimFrame >= globTempVar || Equal OHitboxConnected 1
          OEndLag = immediateTempVar - OAnimFrame
        else
          OEndLag = -1
        endif
        if OEndLag > 0
          currGoal =  cg_attack_reversal
        endif
      endif
    endif
  endif

  GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
  if Equal immediateTempVar 0
    // react to/read the opponent's attack patterns
    immediateTempVar = (1 - (LevelValue / 100)) * 30 + 4
    immediateTempVar *= PT_REACTION_TIME
    anotherTempVar = AnimFrame + 10
    MOD globTempVar anotherTempVar immediateTempVar
    anotherTempVar = OAnimFrame + 10
    MOD anotherTempVar anotherTempVar immediateTempVar
    if globTempVar > 1 && anotherTempVar > 1
    elif Equal OCurrAction hex(0x4D) && OAnimFrame > 25
    elif currGoal >= cg_attack && currGoal < calc(cg_attack + 1) && ODistLE 30
    elif Equal currGoal cg_attack_reversal || Equal currGoal cg_bait_shield || Equal currGoal cg_bait_dashawayWhenApproached
    elif currGoal >= cg_edgeguard
    elif !(Equal currGoal cg_defend) && OFramesHitstun <= 0 && !(CalledFrom Shield) && !(Equal currGoal cg_bait_shield)
      if OCurrAction < hex(0x42) || OCurrAction >= hex(0x48)
        predictAverage immediateTempVar man_OXHitDist LevelValue
        immediateTempVar += 15
        if Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
          immediateTempVar += 14
        endif
        if ODistLE immediateTempVar
          GetCommitPredictChance globTempVar LevelValue
          if Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
            immediateTempVar = Damage * 0.2
            globTempVar += immediateTempVar
          endif
          // immediateTempVar = (Rnd * 12) + (1 - LevelValue / 100) * 15 + 8
          // immediateTempVar *= PT_REACTION_TIME
          if Rnd < globTempVar && Rnd < globTempVar
            if Rnd < 0.7
              CallI DefendHub
            elif Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
              CallI DefendHub
            endif
          endif
        endif
      endif
    endif
  endif
#endsnippet