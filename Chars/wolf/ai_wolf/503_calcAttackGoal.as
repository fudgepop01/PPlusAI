#snippet ADDITIONAL_FILTERS
  $ifLastAttack(dspecialair)
    if Equal NumJumps 0
      lastAttack = -1
    endif
  $elifLastAttack(nspecial)
    lastAttack = -1
  endif
#endsnippet

#snippet COMBO_MOVES
  // $addToDice(dspecial)
  // $addToDice(fair)
  // $addToDice(uthrow)
  // $addToDice(dthrow)
#endsnippet

#snippet PANIC_MOVES
  $addToDice(1, dspecialair, 2.5)
#endsnippet

#snippet LAUNCH_MOVES
  $addToDice(1, dspecial, 2.5)
#endsnippet

#snippet PRESSURE_MOVES
  // $addToDice(nair)
  $addToDice(1, nair, 3)
  // $addToDice(dspecial)
  // $addToDice(dair)
#endsnippet

#snippet BREAKCC_MOVES
  // $addToDice(dair)
#endsnippet

#snippet BAIT_MOVES
  $addToDice(1, nspecialair, 2)
#endsnippet

#snippet SPACING_MOVES
  $addToDice(1, nspecialair, 2)
#endsnippet

#snippet CAMP_MOVES
  $addToDice(1, nspecialair, 3)
#endsnippet