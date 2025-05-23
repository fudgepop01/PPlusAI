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
    #let incrementor = var7
    #let rndChoice = var1
    movePart = 1
    if Equal lastAttack valJab123 || Equal lastAttack valDA
      incrementor = 8
      label _tilts
      rndChoice = Rnd * 10
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
    if lastAttack >= valFTilt && lastAttack <= valDTilt
      label _smEntry
      incrementor = 8
      label _smashes
      rndChoice = Rnd * 10
      if rndChoice < 1
        Goto fsmash
      elif rndChoice < 2
        Goto dsmash
      elif rndChoice < 3
        Goto usmash
        if Rnd < 0.7
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
    if lastAttack >= valNAir && lastAttack <= valDAir
      Seek _spEntry
      Jump
    endif
    if lastAttack >= valFSmash && lastAttack <= valDSmash
      label _spEntry
      incrementor = 10
      label _specials
      moveVariant = 0
      rndChoice = Rnd * 9
      if rndChoice < 1
        Goto nspecial      
      elif rndChoice < 3
        if Equal Direction 1 && OKBXSpeed > 1.5
          Goto dspecial
        elif Equal Direction -1 && OKBXSpeed < -1.5
          Goto dspecial
        else
          Goto clear
        endif
      elif rndChoice < 5
        Goto sspecial
        if ODmgXWeight > 80 && Equal AirGroundState 1
          moveVariant = mv_sspecial_power
        elif ODmgXWeight > 40 && Equal AirGroundState 2 && Equal OIsOnStage 0
          moveVariant = mv_sspecial_spike
        endif
      elif rndChoice < 7 && OKBSpeed > 2.95 && OKBYSpeed > 0 && OKBXSpeed >= -2 && OKBXSpeed <= 2 && !(Equal OXDistBackEdge OXDistFrontEdge)
        Call USpecial
      else
        Goto clear
      endif
      Goto analyze
      incrementor -= 1
      if incrementor <= 0
        if LevelValue >= LV6
          moveVariant = mv_ASC
          Goto nspecial
          Call NSpecial
        endif
        Seek _end
      else
        Seek _specials
      endif
      Jump
    endif
  endif
  label _end
  movePart = 0

  if Equal isImmediateCombo immediate
    #let testLimit = var6
    testLimit = 15
    movePart = 1
    if ODmgXWeight > 70
      Seek kill
    else
      Seek combo
    endif
    Jump
  endif

#endsnippet

#snippet COMBO_OPTIONS
  globTempVar = Rnd * 6
  if globTempVar < 1
    Goto dtilt
  elif globTempVar < 2
    Goto fair
  elif globTempVar < 3
    Goto uair
  elif globTempVar < 4
    Goto grab
  elif globTempVar < 5
    Goto dashattack
  elif globTempVar < 6
    Goto usmash
    moveVariant = mv_usmash_cancel
  elif globTempVar < 6
    Goto sspecial
  endif
#endsnippet

#snippet KILL_OPTIONS
  globTempVar = Rnd * 6
  if globTempVar < 1
    Goto fsmash
  elif globTempVar < 2
    Goto bair
  elif globTempVar < 3
    Goto nair
  elif globTempVar < 4
    Goto dsmash
  elif globTempVar < 5
    Goto usmash
  elif globTempVar < 6
    Goto sspecial
    moveVariant = mv_sspecial_power
  endif
#endsnippet

#snippet EDGEGUARD_OPTIONS
  globTempVar = Rnd * 7
  if globTempVar < 1
    Goto fair
  elif globTempVar < 2
    Goto dtilt
  elif globTempVar < 3
    Goto fsmash
  elif globTempVar < 4
    Goto dsmash
  elif globTempVar < 5
    Goto bair
  elif globTempVar < 6
    Goto dair
  elif globTempVar < 7
    Goto sspecial
    moveVariant = mv_sspecial_spike
  endif
#endsnippet

#snippet JUGGLE_OPTIONS
  globTempVar = Rnd * 3
  if globTempVar < 1
    Goto uair
  elif globTempVar < 2
    Goto usmash
  elif globTempVar < 2
    Goto utilt
  endif
#endsnippet