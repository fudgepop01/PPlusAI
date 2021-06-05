#snippet DEBUG_START
#endsnippet

#snippet MOVE_SPECIFIC_COMBOS

  // if Equal lastAttack valGrab
  //   if Equal moveVariant mv_uthrow
  //     // if ODmgXWeight > 50
  //     //   if XDistLE 20
  //     //     Call FAir
  //     //   else
  //     //     Call UAir
  //     //   endif
  //     // elif OYDistSelf > 25
  //     //   Call UAir
  //     // else
  //     //   Call NAir
  //     // endif
  //   elif Equal moveVariant mv_dthrow
  //     if ODmgXWeight > 50 && OYDistSelf > 25
  //       Call FAir
  //     elif OYDistSelf > 25 && OYSpeed > 0.15
  //       Call UAir
  //     endif
  //     var0 = Rnd * 3
  //     if ODmgXWeight > 40 && var0 < 2
  //       Call DAir
  //     else
  //       moveVariant = mv_techChase
  //       Call Grab
  //     endif
  //   endif
  // endif

  if !(Equal isImmediateCombo immediate) && Equal HitboxConnected 1
    #let trueLastAttack = var4
    #let frameCounter = var6
    frameCounter = -1
    trueLastAttack = lastAttack
    
    label _begin_immediates
    frameCounter += 1
    
    #let incrementor = var7
    #let rndChoice = var17
    movePart = 1
    if Equal trueLastAttack valJab123 || Equal trueLastAttack valDashAttack
      incrementor = 8
      label _tilts
      rndChoice = Rnd * 6
      LOGSTR str("tilts")

      if rndChoice < 1
        Goto dtilt
      elif rndChoice < 2
        Goto ftilt
      elif rndChoice < 3
        Goto utilt
      else
        Goto clear
      endif
      Goto analyze
      incrementor -= 1
      if incrementor <= 0
        Seek _smEntry
      else
        Seek _tilts
      endif
      Jump
    endif
    if trueLastAttack >= valFTilt && trueLastAttack <= valDTilt
      label _smEntry
      incrementor = 8
      if ODmgXWeight > 90
        incrementor = 15
      endif
      label _smashes
      movePart = 2
      LOGSTR str("smashes")
      rndChoice = Rnd * 6
      if rndChoice < 1
        Goto fsmash
      elif rndChoice < 2
        Goto dsmash
      elif rndChoice < 3
        Goto usmash
        if Rnd < 0.7 && ODmgXWeight < 80
          moveVariant = mv_usmash_cancel
        endif
      else
        Goto clear
      endif
      Goto analyze
      incrementor -= 1
      if incrementor <= 0
        Seek _spEntry
      else
        Seek _smashes
      endif
      Jump
    endif
    if trueLastAttack >= valNAir && trueLastAttack <= valDAir
      Seek _spEntry
      Jump
    endif
    if trueLastAttack >= valFSmash && trueLastAttack <= valDSmash
      label _spEntry
      incrementor = 10
      LOGSTR str("specials")
      label _specials
      movePart = 1
      moveVariant = 0
      rndChoice = Rnd * 18
      if rndChoice < 1
        Goto nspecial      
      elif rndChoice < 5 && XDistFrontEdge > edgeRange
        if Equal Direction 1 && OKBXSpeed > 0.7
          Call DSpecial
        elif Equal Direction -1 && OKBXSpeed < -0.7
          Call DSpecial
        else
          Goto clear
        endif
      elif rndChoice < 11
        Goto sspecial
        if ODmgXWeight > 80 && Equal AirGroundState 1
          moveVariant = mv_sspecial_power
        elif ODmgXWeight > 40 && Equal AirGroundState 2 && Equal OIsOnStage 0
          moveVariant = mv_sspecial_spike
        endif
      elif rndChoice < 14 && OKBSpeed > 2.95 && OKBYSpeed > 0 && OKBXSpeed >= -2 && OKBXSpeed <= 2 && !(Equal OXDistBackEdge OXDistFrontEdge)
        Call USpecial
      elif rndChoice < 16 && Equal trueLastAttack valUSmash && AnimFrame >= 15
        Button X
        Call AIHub
      else
        Goto clear
      endif
      Goto analyze
      incrementor -= 1
      if incrementor <= 0
        if LevelValue >= LV6 && Rnd < 0.1 && !(Equal trueLastAttack valJab123) && !(Equal trueLastAttack valDTilt)
          moveVariant = mv_ASC
          Goto nspecial
          Call NSpecial
        elif LevelValue >= LV5 && frameCounter >= 5 && !(Equal trueLastAttack valJab123) && !(Equal trueLastAttack valDTilt)
          moveVariant = mv_ASC
          Goto nspecial
          Call NSpecial
        endif
        LOGSTR str("FCounter")
        LOGVAL frameCounter
        if frameCounter < 5
          Seek _begin_immediates
          Return
        elif Equal trueLastAttack valUSmash && AnimFrame >= 15
          Button X
          Seek _end
          Return
        else
          Seek _end
        endif
      else
        Seek _specials
      endif
      Jump
    endif
  endif
  label _end
  LOGSTR str("end")
  movePart = 0

  if Equal isImmediateCombo immediate
    #let testLimit = var6
    testLimit = 15
    movePart = 1
    Seek contCombo
    Jump
  endif

#endsnippet

#snippet COMBO_OPTIONS
  $refreshMoves()
  $filterMoveEndlag(30)
  $excludeMovesNotOrigin(bair|uair|fair|dashattack|dtilt|utilt|usmash)
  $output(Goto)
#endsnippet

#snippet KILL_OPTIONS
  $refreshMoves()
  $output(Goto)
#endsnippet

#snippet JUGGLE_OPTIONS
  $refreshMoves()
  $excludeMovesNotOrigin(uair|usmash|utilt)
  $output(Goto)
#endsnippet

#snippet EDGEGUARD_OPTIONS
  $pickRandMove(nair|fair|dair|bair|dtilt|utilt|dsmash|sspecial, Goto)
#endsnippet

#snippet MOVE_GENERATION
  $generateAllMovesGoto()
#endsnippet

#snippet EXTRA_ANALYSIS
if Equal movePart 1 
  frameToCalc = move_hitFrame + 3
  Goto CTD
endif
#endsnippet