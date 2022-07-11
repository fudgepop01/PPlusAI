#snippet EVT_GOT_HIT
  immediateTempVar = LevelValue * 0.003
  if Rnd < immediateTempVar
    ADJUST_PERSONALITY idx_aggression -11 1
    ADJUST_PERSONALITY idx_aggression 1.1 1
    immediateTempVar = LevelValue * 0.01
    ADJUST_PERSONALITY idx_aggression immediateTempVar Rnd

    ADJUST_PERSONALITY idx_baitChance -11 1
    ADJUST_PERSONALITY idx_baitChance 1.1 1

    ADJUST_PERSONALITY idx_wall_chance -11 1
    ADJUST_PERSONALITY idx_braveChance -11 1
    ADJUST_PERSONALITY idx_circleCampChance -11 1

    ADJUST_PERSONALITY idx_aggression 2 Rnd
    ADJUST_PERSONALITY idx_baitChance 2 Rnd
    ADJUST_PERSONALITY idx_wall_chance 3 Rnd
    ADJUST_PERSONALITY idx_braveChance 3 Rnd
    ADJUST_PERSONALITY idx_circleCampChance 3 Rnd

    if Rnd < 0.25
      ADJUST_PERSONALITY idx_bait_dashAwayChance -3 1
      immediateTempVar = pt_bait_dashAwayChance * 3
      ADJUST_PERSONALITY idx_bait_dashAwayChance 1 1
      ADJUST_PERSONALITY idx_bait_dashAwayChance immediateTempVar Rnd
    endif
    if Rnd < 0.25
      ADJUST_PERSONALITY idx_bait_wdashAwayChance -3 1
      immediateTempVar = pt_bait_wdashAwayChance * 3
      ADJUST_PERSONALITY idx_bait_wdashAwayChance 1 1
      ADJUST_PERSONALITY idx_bait_wdashAwayChance immediateTempVar Rnd
    endif
    if Rnd < 0.25
      ADJUST_PERSONALITY idx_jumpiness -3 1
      immediateTempVar = pt_jumpiness * 4
      ADJUST_PERSONALITY idx_jumpiness 1 1
      ADJUST_PERSONALITY idx_jumpiness immediateTempVar Rnd
    endif
    if Rnd < 0.25
      ADJUST_PERSONALITY idx_djumpiness -3 1
      immediateTempVar = pt_djumpiness * 4
      ADJUST_PERSONALITY idx_djumpiness 1 1
      ADJUST_PERSONALITY idx_djumpiness immediateTempVar Rnd
    endif
    if Rnd < 0.25
      ADJUST_PERSONALITY idx_platChance -3 1
      immediateTempVar = pt_platChance * 4
      ADJUST_PERSONALITY idx_platChance 1 1
      ADJUST_PERSONALITY idx_platChance immediateTempVar Rnd
    endif
  endif
#endsnippet

#snippet EVT_CHR_CHECKS
  if Rnd <= 0.02 && Rnd <= 0.1
    GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    if Equal immediateTempVar 0
      immediateTempVar = (LevelValue / 35) * 0.2
      ADJUST_PERSONALITY idx_baitChance 0.004 immediateTempVar
      ADJUST_PERSONALITY idx_bait_dashAwayChance 0.002 immediateTempVar
      ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.002 immediateTempVar
      ADJUST_PERSONALITY idx_wall_chance 0.001 immediateTempVar
      ADJUST_PERSONALITY idx_circleCampChance 0.002 immediateTempVar
    endif
  elif CHANCE_MUL_LE PT_AGGRESSION 0.0001 && LevelValue >= LV7
    ADJUST_PERSONALITY idx_aggression -11 1
    ADJUST_PERSONALITY idx_baitChance 0.5 1
  elif Rnd < 0.2 && Rnd <= 0.2
    immediateTempVar = (LevelValue / 35) * 0.4
    ADJUST_PERSONALITY idx_aggression 0.015 immediateTempVar
    ADJUST_PERSONALITY idx_wall_chance 0.005 immediateTempVar
  endif
#endsnippet

#snippet EVT_RANGED_HIT
  ADJUST_PERSONALITY idx_circleCampChance 0.2 Rnd
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
    if !(Equal lastAttack -1) || Equal currGoal cg_bait_shield
    elif OEndLag >= 12
      immediateTempVar = OEndLag * 2
      // if OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
      // elif XDistLE immediateTempVar && OAttacking
      //   currGoal = cg_bait_dashawayWhenApproached
      //   if CHANCE_MUL_LE PT_AGGRESSION 0.6
      //     currGoal = cg_bait_shield
      //   endif
      // endif
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
          // immediateTempVar = (2 - Weight * 0.01) * (Damage - LevelValue * 0.65) * 0.1
          // if immediateTempVar < 0
          //   globTempVar += immediateTempVar
          // endif
          if Equal currGoal cg_inHitstun || Equal CurrAction hex(0x49)
            immediateTempVar = Damage * 0.2
            globTempVar += immediateTempVar
          endif
          // immediateTempVar = (Rnd * 12) + (1 - LevelValue / 100) * 15 + 8
          // immediateTempVar *= PT_REACTION_TIME
          if Rnd < globTempVar
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