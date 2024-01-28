#snippet FETCH_MOVE_DATA
  $generateFetchMoveData(0)
#endsnippet

#snippet EVT_GOT_HIT 
  if Equal TRAINING_MODE_OPTION -1

    Goto shuffle_AI
    if !(True)
      label shuffle_AI
        immediateTempVar = LevelValue * 0.005
        if Rnd < immediateTempVar
          ADJUST_PERSONALITY idx_aggression -11 1
          ADJUST_PERSONALITY idx_aggression 1.25 1
          immediateTempVar = LevelValue * 0.02
          ADJUST_PERSONALITY idx_aggression immediateTempVar Rnd

          ADJUST_PERSONALITY idx_baitChance -11 1
          ADJUST_PERSONALITY idx_baitChance 1 1

          ADJUST_PERSONALITY idx_wall_chance -11 1
          ADJUST_PERSONALITY idx_wall_chance 1.25 1

          ADJUST_PERSONALITY idx_braveChance -11 1
          ADJUST_PERSONALITY idx_braveChance 1.25 1
          ADJUST_PERSONALITY idx_circleCampChance -11 1

          ADJUST_PERSONALITY idx_aggression 3 Rnd
          ADJUST_PERSONALITY idx_baitChance 2.5 Rnd
          ADJUST_PERSONALITY idx_wall_chance 6 Rnd
          ADJUST_PERSONALITY idx_braveChance 3.5 Rnd
          ADJUST_PERSONALITY idx_circleCampChance 4 Rnd

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

      Return
    endif
  endif
#endsnippet

#snippet EVT_CHR_CHECKS
  if Equal TRAINING_MODE_OPTION -1
    immediateTempVar = (LevelValue / 35) * 0.05
    if Rnd < immediateTempVar
      GET_CHAR_TRAIT(immediateTempVar, chr_calc_certainty)
      PredictOMov immediateTempVar mov_attack
      if immediateTempVar > 0.2
        ADJUST_PERSONALITY idx_aggression -0.025 immediateTempVar
        ADJUST_PERSONALITY idx_wall_chance 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_bait_dashAwayChance 0.001 immediateTempVar
        ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.005 immediateTempVar
        ADJUST_PERSONALITY idx_jumpiness 0.01 immediateTempVar
        ADJUST_PERSONALITY idx_djumpiness 0.01 immediateTempVar
      endif
      PredictOMov immediateTempVar mov_dash
      PredictOMov anotherTempVar mov_idle
      if anotherTempVar > immediateTempVar
        immediateTempVar = anotherTempVar
      endif
      if immediateTempVar >= 0.2
        ADJUST_PERSONALITY idx_wall_chance 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_baitChance 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_bait_dashAwayChance 0.005 immediateTempVar
        ADJUST_PERSONALITY idx_braveChance 0.01 immediateTempVar
      endif
      PredictOMov anotherTempVar mov_shield
      if immediateTempVar >= 0.2
        ADJUST_PERSONALITY idx_baitChance -0.025 immediateTempVar
        ADJUST_PERSONALITY idx_wall_chance -0.025 immediateTempVar
        ADJUST_PERSONALITY idx_aggression 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_braveChance 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_djumpiness 0.01 immediateTempVar
      endif
    endif

    PredictOMov anotherTempVar mov_shield
    if Rnd <= 0.02
      GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
      if Equal immediateTempVar 0
        immediateTempVar = (LevelValue / 35) * 0.1
        ADJUST_PERSONALITY idx_baitChance 0.002 immediateTempVar
        ADJUST_PERSONALITY idx_bait_dashAwayChance 0.001 immediateTempVar
        ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.001 immediateTempVar
        ADJUST_PERSONALITY idx_wall_chance 0.005 immediateTempVar
        ADJUST_PERSONALITY idx_circleCampChance 0.002 immediateTempVar
      endif
    elif CHANCE_MUL_LE PT_AGGRESSION 0.001 && LevelValue >= LV7 && immediateTempVar < 0.3
      ADJUST_PERSONALITY idx_aggression -11 1
      ADJUST_PERSONALITY idx_aggression 1.7 1
      ADJUST_PERSONALITY idx_baitChance 0.4 1
      ADJUST_PERSONALITY idx_wall_chance 1.2 1
    elif Rnd < calc(0.2 ** 2)
      immediateTempVar = (LevelValue / 35) * 0.4
      ADJUST_PERSONALITY idx_aggression 0.005 immediateTempVar
      ADJUST_PERSONALITY idx_wall_chance 0.015 immediateTempVar
    elif Rnd < calc(0.2 ** 2) && FramesHitstun > 0
      Goto shuffle_AI
    endif
  endif
#endsnippet

#snippet EVT_RANGED_HIT
  ADJUST_PERSONALITY idx_circleCampChance 0.5 Rnd
#endsnippet

#snippet EVT_CHECK_DEFEND
  if currGoal < cg_edgeguard && TRAINING_MODE_OPTION <= 1 && !(Equal currGoal cg_attack_reversal)
    GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
    if Equal immediateTempVar 0 && !(Equal currGoal cg_inHitstun)
      // react to/read the opponent's attack patterns
      immediateTempVar = (1 - (LevelValue / 100)) * 30 + 4
      immediateTempVar *= PT_REACTION_TIME
      anotherTempVar = AnimFrame + 10
      MOD globTempVar anotherTempVar immediateTempVar
      anotherTempVar = OAnimFrame + 10
      MOD anotherTempVar anotherTempVar immediateTempVar
      if globTempVar > 1 && anotherTempVar > 1
      elif Equal OCurrAction hex(0x4D) && OAnimFrame > 25
      // elif Equal AirGroundState 2 && currGoal > cg_attack
      elif currGoal >= cg_bait && currGoal <= cg_bait_dashawayWhenApproached
      elif Equal currGoal cg_attack_wall || Equal currGoal cg_bait_shield || Equal currGoal cg_bait_dashawayWhenApproached
      elif !(Equal currGoal cg_defend) && OFramesHitstun <= 0 && !(CalledFrom Shield) && !(Equal currGoal cg_bait_shield)
        if OCurrAction < hex(0x42) || OCurrAction >= hex(0x48)
          predictAverage immediateTempVar man_OXHitDist
          immediateTempVar += 15
          globTempVar = OPos * immediateTempVar
          GetYDistFloorOffset globTempVar globTempVar 10 1
          if XDistLE immediateTempVar && globTempVar > 0
            GetCommitPredictChance globTempVar
            // if Equal currGoal cg_bait_dashdance
            //   globTempVar *= 0.06 * PT_BAITCHANCE
            // endif
            if CHANCE_MUL_LE globTempVar 0.1 && Rnd < 0.7
              if CHANCE_MUL_LE PT_AGGRESSION 0.35
                currGoal = cg_attack_reversal
                Return
              endif
              CallI DefendHub
            endif
          endif
        endif
      endif
    endif

    if !(Equal currGoal cg_attack_inCombo) && !(Equal currGoal cg_defend)
      immediateTempVar = (1 - (LevelValue / 100)) * 60 + 10
      immediateTempVar *= PT_REACTION_TIME
      GetCommitPredictChance anotherTempVar
      anotherTempVar = 1.1 - anotherTempVar
      anotherTempVar *= 0.5
      immediateTempVar *= anotherTempVar
      anotherTempVar = AnimFrame
      MOD immediateTempVar anotherTempVar immediateTempVar
      if immediateTempVar <= 1 || Equal currGoal cg_bait_wait
        $tempVar(OEndLag,anotherTempVar)
        GET_CHAR_TRAIT(OEndLag, chr_get_OEndlagSafe)
        if !(Equal lastAttack -1) || Equal currGoal cg_bait_shield
        elif OEndLag >= 4
          immediateTempVar = OEndLag * 0.9
          if OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
          elif !(XDistLE immediateTempVar) && OAttacking && OEndLag <= 7
            if CHANCE_MUL_LE PT_BAITCHANCE 0.2
              currGoal = cg_bait
              if CHANCE_MUL_LE PT_AGGRESSION 0.3 && CHANCE_MUL_LE PT_BRAVECHANCE 0.4
                currGoal = cg_bait_shield
                if CHANCE_MUL_LE PT_AGGRESSION 0.25
                  currGoal = cg_attack
                endif
              endif
            endif
          else
            predictAverage immediateTempVar man_OXHitDist
            immediateTempVar *= 1
            immediateTempVar += OEndLag + 5
            globTempVar = immediateTempVar * 0.3
            if OAttacking
              globTempVar += 5
            endif
            anotherTempVar = OTopNY + 5
            DrawDebugRectOutline OTopNX anotherTempVar globTempVar 1 color(0xFF0000DD)
            anotherTempVar += 5
            DrawDebugRectOutline OTopNX anotherTempVar immediateTempVar 1 color(0xFFFF00DD)
            if XDistLE globTempVar
              currGoal = cg_attack_reversal
            elif XDistLE immediateTempVar
              currGoal = cg_attack
            endif
          endif
        endif
      endif
    endif
  endif
#endsnippet