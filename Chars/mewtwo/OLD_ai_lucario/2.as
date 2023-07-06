#snippet DEBUG_START
#endsnippet

#snippet MOVE_SPECIFIC_COMBOS
  if Equal lastAttack valBAir
    Goto bair
    approachType = at_hover
    Goto analyze
  endif
#endsnippet

#snippet COMBO_OPTIONS
  $refreshMoves()
  $filterMoveEndlag(20)
  $output(Goto)
  if YDistBackEdge < -15
    approachType = at_hover
  elif YDistBackEdge > -10
    approachType = at_hover
    moveVariant = mv_hc
  endif
#endsnippet

#snippet JUGGLE_OPTIONS
  $refreshMoves()
  $output(Goto)
  if YDistBackEdge < -15
    approachType = at_hover
  elif YDistBackEdge > -10
    approachType = at_hover
    moveVariant = mv_hc
  endif
#endsnippet

#snippet KILL_OPTIONS
  $refreshMoves()
  $output(Goto)
  if YDistBackEdge < -15
    approachType = at_hover
  elif YDistBackEdge > -10
    approachType = at_hover
    moveVariant = mv_hc
  endif
#endsnippet

// #snippet COMBO_OPTIONS
//   globTempVar = Rnd * 9
//   if globTempVar < 1
//     Goto dtilt
//   elif globTempVar < 2
//     Goto utilt
//   elif globTempVar < 3
//     Goto fair
//   elif globTempVar < 4
//     Goto uair
//   elif globTempVar < 5
//     Goto nair
//   elif globTempVar < 6
//     Goto ftilt
//   elif globTempVar < 7
//     Goto usmash
//   elif globTempVar < 8
//     Goto dair
//   elif globTempVar < 9
//     Goto grab
//   endif
//   if YDistBackEdge < -15
//     approachType = at_hover
//   endif
// #endsnippet

// #snippet KILL_OPTIONS
//   globTempVar = Rnd * 4
//   if globTempVar < 1
//     Goto fsmash
//   elif globTempVar < 2
//     Goto dsmash
//   elif globTempVar < 3
//     Goto usmash
//   elif globTempVar < 4
//     Goto fair
//   endif
//   if YDistBackEdge < -15
//     approachType = at_hover
//   endif
// #endsnippet

// #snippet JUGGLE_OPTIONS
//   globTempVar = Rnd * 4
//   if globTempVar < 1
//     Goto uair
//   elif globTempVar < 2
//     Goto utilt
//   elif globTempVar < 3
//     Goto fair
//   elif globTempVar < 4
//     Goto usmash
//   endif
//   if YDistBackEdge < -15
//     approachType = at_hover
//   endif
// #endsnippet

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
  if YDistBackEdge < -15
    approachType = at_hover
  endif
#endsnippet