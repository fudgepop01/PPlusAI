#snippet DEBUG_START
#endsnippet

#snippet MOVE_SPECIFIC_COMBOS
#endsnippet

#snippet COMBO_OPTIONS
  globTempVar = Rnd * 9
  if globTempVar < 1
    Goto dtilt
  elif globTempVar < 2
    Goto utilt
  elif globTempVar < 3
    Goto fair
  elif globTempVar < 4
    Goto uair
  elif globTempVar < 5
    Goto nair
  elif globTempVar < 6
    Goto ftilt
  elif globTempVar < 7
    Goto usmash
  elif globTempVar < 8
    Goto dair
  elif globTempVar < 9
    Goto grab
  endif
#endsnippet

#snippet KILL_OPTIONS
  globTempVar = Rnd * 4
  if globTempVar < 1
    Goto fsmash
  elif globTempVar < 2
    Goto dsmash
  elif globTempVar < 3
    Goto usmash
  elif globTempVar < 4
    Goto fair
  endif
#endsnippet

#snippet EDGEGUARD_OPTIONS
  globTempVar = Rnd * 6
  if globTempVar < 1
    Goto ftilt
  elif globTempVar < 2
    Goto fsmash
  elif globTempVar < 3
    Goto dsmash
  elif globTempVar < 4
    if Equal Direction OPos
      Goto nair
    else
      Goto bair
    endif
  elif globTempVar < 5
    Goto uair
  elif globTempVar < 6
    Goto dair
  endif
#endsnippet

#snippet JUGGLE_OPTIONS
  globTempVar = Rnd * 4
  if globTempVar < 1
    Goto uair
  elif globTempVar < 2
    Goto utilt
  elif globTempVar < 3
    Goto fair
  elif globTempVar < 4
    Goto usmash
  endif
#endsnippet