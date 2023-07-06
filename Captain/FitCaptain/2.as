#snippet DEBUG_START
#endsnippet

#snippet MOVE_SPECIFIC_COMBOS
  if Equal lastAttack valGrab
    // LOGSTR str("grbCmbo")
    if Equal moveVariant mv_uthrow
      if ODmgXWeight > 50
        if XDistLE 20
          Call FAir
        else
          Call UAir
        endif
      elif OYDistSelf > 25
        Call UAir
      else
        Call NAir
      endif
    elif Equal moveVariant mv_dthrow
      if ODmgXWeight > 50 && OYDistSelf > 25
        Call FAir
      elif OYDistSelf > 25 && OYSpeed > 0.15
        Call UAir
      endif
      var0 = Rnd * 3
      if ODmgXWeight > 40 && var0 < 2
        Call DAir
      else
        moveVariant = mv_techChase
        Call Grab
      endif
    endif
  endif
  if hit_knockback < 4
    Goto grab
    comboLeniency = 8
    if OYDistBackEdge < -5
      moveVariant = mv_techChase
    endif
    Goto analyze
  endif
  if ODmgXWeight > 50
    Goto fair
    comboLeniency = 2
  else
    Goto dair
    comboLeniency = 2
  endif
  Goto analyze
#endsnippet

#snippet COMBO_OPTIONS
  globTempVar = Rnd * 6
  if globTempVar < 1
    Goto dtilt
    comboLeniency = 5
  elif globTempVar < 2
    Goto uair
    comboLeniency = 10
  elif globTempVar < 3
    Goto nair
  elif globTempVar < 4
    Goto dair
  elif globTempVar < 5
    Goto usmash
  elif globTempVar < 6
    Goto grab
  endif
#endsnippet

#snippet KILL_OPTIONS
  globTempVar = Rnd * 4
  if globTempVar < 1
    Goto fsmash
  elif globTempVar < 2
    Goto fair
  elif globTempVar < 3
    Goto usmash
  elif globTempVar < 4
    Goto dair
  endif
#endsnippet

#snippet EDGEGUARD_OPTIONS
  globTempVar = Rnd * 8
  if globTempVar < 1
    Goto ftilt
  elif globTempVar < 2
    Goto utilt
  elif globTempVar < 3
    Goto fsmash
  elif globTempVar < 4
    Goto dtilt
  elif globTempVar < 5
    Goto nair
  elif globTempVar < 6
    Goto fair
    comboLeniency = 5
  elif globTempVar < 7
    Goto uair
    comboLeniency = 10
  elif globTempVar < 8
    Goto dair
  endif
#endsnippet

#snippet JUGGLE_OPTIONS
  globTempVar = Rnd * 3
  if globTempVar < 1
    Goto uair
  elif globTempVar < 2
    Goto fair
  elif globTempVar < 3
    Goto usmash
  endif
#endsnippet