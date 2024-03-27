#snippet FETCH_MOVE_DATA
  $generateFetchMoveData(1)
#endsnippet

#snippet EVT_GOT_HIT 
  if Equal TRAINING_MODE_OPTION -1

    if Rnd < 0.02
      Goto shuffle_AI
    endif
    if !(True)
      label shuffle_AI
        immediateTempVar = LevelValue * 0.005
        if Rnd < immediateTempVar
          ADJUST_PERSONALITY idx_aggression -1 PT_AGGRESSION
          immediateTempVar = LevelValue * 0.005
          ADJUST_PERSONALITY idx_aggression immediateTempVar Rnd

          ADJUST_PERSONALITY idx_baitChance -1 PT_BAITCHANCE
          ADJUST_PERSONALITY idx_wall_chance -1 PT_WALL_CHANCE
          ADJUST_PERSONALITY idx_braveChance -1 PT_BRAVECHANCE
          ADJUST_PERSONALITY idx_circleCampChance -1 PT_CIRCLECAMPCHANCE

          ADJUST_PERSONALITY idx_aggression calc(pt_aggression * 3) Rnd
          ADJUST_PERSONALITY idx_baitChance calc(pt_baitChance * 2) Rnd
          ADJUST_PERSONALITY idx_wall_chance calc(pt_wall_chance * 2) Rnd
          ADJUST_PERSONALITY idx_braveChance calc(pt_braveChance * 2) Rnd
          ADJUST_PERSONALITY idx_circleCampChance calc(pt_circleCampChance * 2) Rnd

          if Rnd < 0.25
            ADJUST_PERSONALITY idx_bait_dashAwayChance -1 PT_BAIT_DASHAWAYCHANCE
            ADJUST_PERSONALITY idx_bait_dashAwayChance calc(pt_bait_dashAwayChance * 2) Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY idx_bait_wdashAwayChance -1 PT_BAIT_WDASHAWAYCHANCE
            ADJUST_PERSONALITY idx_bait_wdashAwayChance calc(pt_bait_wdashAwayChance * 2) Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY idx_jumpiness -1 PT_JUMPINESS
            ADJUST_PERSONALITY idx_jumpiness calc(pt_jumpiness * 3) Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY idx_djumpiness -1 PT_DJUMPINESS
            ADJUST_PERSONALITY idx_djumpiness calc(pt_djumpiness * 3) Rnd
          endif
          if Rnd < 0.25
            ADJUST_PERSONALITY idx_platChance -1 PT_PLATCHANCE
            ADJUST_PERSONALITY idx_platChance calc(pt_platChance * 3) Rnd
          endif
        endif

      Return
    endif
  endif
#endsnippet

#snippet EVT_CHR_CHECKS
  if !(Equal DEBUG_VALUE 0) && currGoal < cg_edgeguard
    currGoal = cg_attack
  endif 
  if Equal TRAINING_MODE_OPTION -1

    globTempVar = (LevelValue / 35) * 0.05
    ADJUST_PERSONALITY idx_aggression 0.003 globTempVar

    PredictOMov immediateTempVar mov_attack
    if Rnd < globTempVar
      PredictOMov anotherTempVar mov_shield
      immediateTempVar -= anotherTempVar
      if immediateTempVar > 0.1
        immediateTempVar *= 5
        // if PT_AGGRESSION > 1.5
        //   ADJUST_PERSONALITY idx_aggression -0.025 immediateTempVar
        // endif
        ADJUST_PERSONALITY idx_wall_chance 0.045 immediateTempVar
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
      if immediateTempVar >= 0.35
        ADJUST_PERSONALITY idx_aggression 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_wall_chance -0.025 immediateTempVar
        ADJUST_PERSONALITY idx_baitChance 0.025 immediateTempVar
        ADJUST_PERSONALITY idx_bait_dashAwayChance 0.005 immediateTempVar
        ADJUST_PERSONALITY idx_braveChance 0.01 immediateTempVar
      endif
      PredictOMov immediateTempVar mov_attack
      PredictOMov anotherTempVar mov_shield
      anotherTempVar -= immediateTempVar
      if anotherTempVar >= 0.075
        anotherTempVar *= 5
        ADJUST_PERSONALITY idx_baitChance 0.05 anotherTempVar
        ADJUST_PERSONALITY idx_wall_chance -0.05 anotherTempVar
        ADJUST_PERSONALITY idx_aggression 0.05 anotherTempVar
        ADJUST_PERSONALITY idx_braveChance 0.05 anotherTempVar
        ADJUST_PERSONALITY idx_djumpiness 0.02 anotherTempVar
      endif
    endif

    GET_CHAR_TRAIT(anotherTempVar, chr_chk_OInCombo)
    if Rnd <= 0.02
      if Equal anotherTempVar 0
        immediateTempVar = (LevelValue / 35) * 0.1
        ADJUST_PERSONALITY idx_baitChance 0.002 immediateTempVar
        ADJUST_PERSONALITY idx_bait_dashAwayChance 0.001 immediateTempVar
        ADJUST_PERSONALITY idx_bait_wdashAwayChance 0.001 immediateTempVar
        ADJUST_PERSONALITY idx_wall_chance 0.004 immediateTempVar
        ADJUST_PERSONALITY idx_circleCampChance 0.005 immediateTempVar
      endif
    elif CHANCE_MUL_LE PT_AGGRESSION 0.001 && LevelValue >= LV7 && Equal anotherTempVar 0 && immediateTempVar < 0.08
      ADJUST_PERSONALITY idx_aggression -11 1
      ADJUST_PERSONALITY idx_aggression 1.65 1
      ADJUST_PERSONALITY idx_baitChance 0.4 1
      ADJUST_PERSONALITY idx_wall_chance 1.2 1
    elif Rnd < calc(0.2 ** 2)
      immediateTempVar = (LevelValue / 35) * 0.4
      ADJUST_PERSONALITY idx_wall_chance 0.015 immediateTempVar
      ADJUST_PERSONALITY idx_circleCampChance 0.015 immediateTempVar
    elif Rnd < calc(0.2 ** 2) && FramesHitstun > 0
      Goto shuffle_AI
    endif
  endif
#endsnippet

#snippet EVT_RANGED_HIT
  ADJUST_PERSONALITY idx_circleCampChance 0.025 Rnd
#endsnippet

#snippet EVT_CHECK_DEFEND
  if !(CalledFrom AttackedHub)
    anotherTempVar = LevelValue + 2
    immediateTempVar = Rnd * anotherTempVar
    if currGoal < cg_edgeguard && TRAINING_MODE_OPTION <= 1 && !(CalledFrom RecoveryHub) && !(Equal skipMainInit sm_execAttack) && immediateTempVar > 1

      $tempVar(OEndLag,globTempVar)
      GET_CHAR_TRAIT(OEndLag, chr_get_OEndlagSafe)
      if OEndLag < 3
        GET_CHAR_TRAIT(immediateTempVar, chr_chk_OInCombo)
        if Equal immediateTempVar 0 && !(Equal currGoal cg_inHitstun)
          // react to/read the opponent's attack patterns
          immediateTempVar = (1 - (LevelValue / 100)) * 40 + 5
          immediateTempVar *= PT_REACTION_TIME
          MOD globTempVar GameTimer immediateTempVar

          anotherTempVar = OAnimFrame + 2
          MOD anotherTempVar anotherTempVar immediateTempVar
          LOGSTR str("atv;gtv")
          LOGVAL globTempVar
          LOGVAL anotherTempVar
          PRINTLN
          if globTempVar > 1 && anotherTempVar >= 1
          elif Equal OCurrAction hex(0x4D) && OAnimFrame > 25
          elif Equal currGoal cg_attack_shieldPunish || Equal currGoal cg_bait_shield
          elif !(Equal currGoal cg_defend) && OFramesHitstun <= 0 && !(CalledFrom Shield) && !(Equal currGoal cg_bait_shield)
            // LOGSTR_NL str("defending")
            if OCurrAction >= hex(0x3) && OCurrAction <= hex(0xF) && OAnimFrame > 5
              GetCommitPredictChance globTempVar
              if globTempVar >= 0.15
                // LOGSTR_NL str("wall prio")
                predictAverage immediateTempVar man_OXHitDist
                immediateTempVar -= 10
                anotherTempVar = immediateTempVar
                anotherTempVar += 20
                globTempVar = TopNX - OTopNX
                Abs globTempVar
                if globTempVar > immediateTempVar && globTempVar < anotherTempVar
                  currGoal = cg_attack_wall
                  Return
                endif
              endif
            elif !(Equal currGoal cg_bait_dashawayWhenApproached)
              if OCurrAction < hex(0x42) || OCurrAction >= hex(0x48) || OAnimFrame > 15
                // LOGSTR_NL str("defendChance")
                predictAverage immediateTempVar man_OXHitDist
                // LOGSTR str("hitDist")
                // LOGVAL immediateTempVar
                immediateTempVar += 35
                globTempVar = OPos * immediateTempVar
                GetYDistFloorOffset globTempVar globTempVar 10 1
                anotherTempVar = OTopNX - TopNX
                Abs anotherTempVar
                anotherTempVar -= 40
                if anotherTempVar > 0 && anotherTempVar < immediateTempVar && globTempVar > 0
                  LOGSTR_NL str("defendChance")
                  GetCommitPredictChance globTempVar
                  globTempVar *= 1.75
                  // if Equal currGoal cg_bait_dashdance
                  //   globTempVar *= 0.06 * PT_BAITCHANCE
                  // endif

                  immediateTempVar = 0.13
                  if currGoal >= cg_attack
                    immediateTempVar = 0.15
                  endif
                  PredictOMov anotherTempVar mov_shield
                  anotherTempVar *= 0.5
                  globTempVar -= anotherTempVar
                  PredictOMov anotherTempVar mov_dash
                  anotherTempVar *= 0.5
                  globTempVar -= anotherTempVar
                  if globTempVar > immediateTempVar && Rnd < 0.7
                    // LOGSTR_NL str("defNorm")
                    CallI DefendHub
                  endif
                  if Equal AirGroundState 1
                    // LOGSTR_NL str("defGrnd")
                    PredictOMov immediateTempVar mov_attack
                    PredictOMov anotherTempVar mov_grab
                    PredictOMov globTempVar mov_shield
                    immediateTempVar -= anotherTempVar
                    globTempVar -= anotherTempVar
                    immediateTempVar -= globTempVar
                    Abs immediateTempVar
                    if immediateTempVar < 0.1 && Rnd < 0.5
                      currGoal = cg_bait_shield
                    endif
                    PredictOMov immediateTempVar mov_attack
                    PredictOMov anotherTempVar mov_grab
                    PredictOMov globTempVar mov_dash
                    anotherTempVar -= immediateTempVar
                    globTempVar -= immediateTempVar
                    if anotherTempVar < -0.1 && globTempVar < 0.1
                      currGoal = cg_bait_dashdance
                    endif
                  endif
                endif
              endif
            endif
          endif
        endif
      endif

      anotherTempVar = LevelValue + 2
      immediateTempVar = Rnd * anotherTempVar
      if immediateTempVar > 1
        if !(Equal currGoal cg_attack_shieldPunish) && !(Equal currGoal cg_attack_inCombo) && !(Equal currGoal cg_defend) && !(Equal currGoal cg_bait_shield)
          immediateTempVar = (1 - (LevelValue / 100)) * 80 + 10
          immediateTempVar *= PT_REACTION_TIME
          GetCommitPredictChance anotherTempVar
          anotherTempVar = 1.1 - anotherTempVar
          anotherTempVar *= 0.25
          immediateTempVar *= anotherTempVar
          MOD immediateTempVar GameTimer immediateTempVar
          // LOGSTR str("immTV GCS")
          // LOGVAL immediateTempVar
          // PRINTLN
          if immediateTempVar <= 1 || Equal currGoal cg_bait_wait
            $tempVar(OEndLag,globTempVar)
            GET_CHAR_TRAIT(OEndLag, chr_get_OEndlagSafe)
            // LOGSTR str("OEndL")
            // LOGVAL OEndLag
            // PRINTLN
            if !(Equal lastAttack -1) && !(Equal currGoal cg_attack_wall)
            elif OEndLag >= 3
              GetAttribute anotherTempVar attr_dashInitVel 0
              immediateTempVar = OEndLag * anotherTempVar * 0.6
              if OCurrAction >= hex(0x4A) && OCurrAction <= hex(0x65)
              elif !(XDistLE immediateTempVar) && OAttacking && OEndLag <= 13
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
    endif
  endif
#endsnippet

#snippet EST_OWN_RECOVERY
  // up to var6 is free
  #let GX = var0
  #let GY = var1
  #let framesAhead = var2

  if OCurrAction >= hex(0x100)
    #let REC_KIND = var3
    #let REC_ARG1 = var4
    #let REC_ARG2 = var5
    #let REC_ARG3 = var6

    $tempVar(REC_ACTION, immediateTempVar)
    immediateTempVar = OCurrAction + hex(0x100)
    RetrieveFullATKD REC_KIND REC_ARG1 REC_ARG2 REC_ARG3 immediateTempVar immediateTempVar immediateTempVar REC_ACTION 1
    if Equal REC_KIND -1
      SeekNoCommit esc_recovery
    endif
    // move_lastHitFrame += 6
    GX = OTopNX
    GY = OTopNY
    if Equal REC_KIND RECOVERY_IDLE
    elif Equal REC_KIND RECOVERY_HORIZONTAL
      $tempVar(punish_frame, REC_ARG1)
      $tempVar(distTolerence, REC_ARG2)
      $tempVar(punishDist, REC_ARG3)

      immediateTempVar = punish_frame - framesAhead
      if XDistLE distTolerence || OActionTimer > punish_frame
      else
        punishDist *= ODirection
        GX += punishDist
      endif
    elif Equal REC_KIND RECOVERY_VERTICAL
      $tempVar(punish_frame, REC_ARG1)
      $tempVar(distTolerence, REC_ARG2)
      $tempVar(punishDist, REC_ARG3)

      immediateTempVar = punish_frame - framesAhead
      if XDistLE distTolerence || OActionTimer > punish_frame
      else
        GY += punishDist
      endif
    elif Equal REC_KIND RECOVERY_AIM
      $tempVar(movementStart, REC_ARG1)
      $tempVar(movementEnd, REC_ARG2)
      $tempVar(totalDistance, REC_ARG3)
      
      Norm immediateTempVar OXSpeed OYSpeed
      Abs immediateTempVar
      if Equal immediateTempVar 0
        SeekNoCommit esc_recovery
      endif 
      anotherTempVar = immediateTempVar
      immediateTempVar = 1 / anotherTempVar
      globTempVar = OXSpeed * immediateTempVar
      immediateTempVar = OYSpeed * immediateTempVar

      globTempVar *= totalDistance
      immediateTempVar *= totalDistance
      
      anotherTempVar = framesAhead + OActionTimer
      if anotherTempVar > movementStart
        // mult totalDist by (OActionTimer + framesAhead) / totalTime
        movementEnd -= movementStart
        if anotherTempVar > movementEnd
          anotherTempVar = movementEnd
        endif
        // anotherTempVar = movementEnd - anotherTempVar
        anotherTempVar -= OActionTimer
        anotherTempVar /= movementEnd
        globTempVar *= anotherTempVar
        immediateTempVar *= anotherTempVar
        GX += globTempVar
        GY += immediateTempVar
      endif
    endif
  else
    SeekNoCommit esc_recovery
  endif
  if !(True)
    label esc_recovery
    EstOXCoord GX framesAhead
    EstOYCoord GY framesAhead
  endif
#endsnippet