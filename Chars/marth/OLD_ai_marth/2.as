#snippet DEBUG_START
#endsnippet

#snippet MOVE_SPECIFIC_COMBOS
  if OFramesHitstun > 10 && Rnd < 0.5 && YDistBackEdge > -10 && OYDistBackEdge > -15
    Call Grab
  endif
#endsnippet

#snippet COMBO_PHASES
  if phase <= 3
    moveType = mt_kill
    Goto killOptions
  elif Rnd <= 0.1 && OYDistBackEdge > -20 && !(Equal OAirGroundState 1)
    moveType = mt_downward
    Goto downwardOptions
  else
    moveType = mt_combo
    Goto comboOptions
  endif
#endsnippet

#snippet JUGGLE_PHASES
  if phase <= 3
    moveType = mt_kill
    Goto killOptions
  elif Rnd <= 0.1 && OYDistBackEdge > -25 && !(Equal OAirGroundState 1)
    moveType = mt_downward
    Goto downwardOptions
  else
    moveType = mt_juggle
    Goto juggleOptions
  endif
#endsnippet

#snippet GLOB_FILTERS
  $excludeMovesOrigin(USpecial|USpecialAir)
#endsnippet

#snippet EDGEGUARD_OPTIONS
  $pickRandMove(fair|bair|dair|ftilt|dtilt|dsmash, Goto)
#endsnippet