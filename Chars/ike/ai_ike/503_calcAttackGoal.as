#snippet ADDITIONAL_FILTERS
#endsnippet

#snippet COMBO_MOVES
#endsnippet

#snippet PANIC_MOVES
  $addToDice(1, dspecialair, 1)
  $addToDice(1, dspecial, 1)
#endsnippet

#snippet LAUNCH_MOVES
#endsnippet

#snippet PRESSURE_MOVES
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(1, dtilt, 1)
  $addToDice(1, dair, 1)
#endsnippet

#snippet BAIT_MOVES
  // $addToDice(1, nspecialair, 2)
#endsnippet

#snippet CAMP_MOVES
  if !(XDistLE 35) && Rnd < 0.2
    $addToDice(1, sspecial, 2)
  endif
#endsnippet

#snippet COMBO_ROUTINES
  $ifLastAttack(uthrow)
    DynamicDiceClear dslot0
    $addOriginToDice(0, uair, 1)
    $addOriginToDice(0, fair, 1)
    $addOriginToDice(0, fsmash, 1)
    $addToDice(0, uthrow, 1)
  $ifLastOrigin(SSpecial, true)
    DynamicDiceClear dslot0
    $addOriginToDice(0, nair, 1)
    $addOriginToDice(0, fair, 1)
    $addOriginToDice(0, bair, 1)
    $addOriginToDice(0, dair, 1)
    $addOriginToDice(0, grab, 1)
  endif
#endsnippet