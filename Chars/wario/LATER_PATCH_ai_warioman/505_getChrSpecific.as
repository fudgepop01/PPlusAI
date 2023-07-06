#snippet FETCH_MOVE_DATA
  $generateFetchMoveData(0)
#endsnippet

#snippet EVT_GOT_HIT 
#endsnippet

#snippet EVT_CHR_CHECKS
#endsnippet

#snippet EVT_RANGED_HIT
#endsnippet

#snippet EVT_CHECK_DEFEND
  if currGoal < cg_edgeguard && !(Equal currGoal cg_attack_reversal)
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
            if Rnd < globTempVar && Rnd < 0.7
              CallI DefendHub
            endif
          endif
        endif
      endif
    endif
  endif
#endsnippet