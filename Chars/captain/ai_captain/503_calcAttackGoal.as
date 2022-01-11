#snippet FILTER_CHECKS
  $ifLastAttack(dair_spike)
    if Equal OIsOnStage 1 && OYDistBackEdge > -20 
      Return
    endif
  endif
#endsnippet

#snippet COMBO_MOVES
#endsnippet

#snippet LAUNCH_MOVES
#endsnippet

#snippet TECHCHASE_MOVES
  // $addToDice(1, dthrow, 1)
  // $addToDice(1, dair, 1)
#endsnippet

#snippet ESCAPE_MOVES
#endsnippet

#snippet SPACING_MOVES
  $addToDice(1, nair, 2)
#endsnippet

#snippet PRESSURE_MOVES
  // $addToDice(1, nair, 1)
  // $addToDice(1, nair, 1)
  // $addToDice(1, fair, 1)
#endsnippet

#snippet BREAKCC_MOVES
  // $addToDice(1, dair, 1)
#endsnippet

#snippet BAIT_MOVES
  // $addToDice(1, fair, 1)
  $addToDice(1, nair, 1)
  // $addToDice(1, uair, 1)
#endsnippet

#snippet CAMP_MOVES
#endsnippet