#snippet ADDITIONAL_FILTERS
  $ifLastAttack(dspecialair)
    if Equal NumJumps 0
      lastAttack = -1
    elif Equal AirGroundState 1 && !(Equal CurrSubaction JumpSquat)
      $setLastAttack(dspecial)
    endif
  endif
#endsnippet

#snippet COMBO_MOVES
  // $addToDice(1, dspecial, 1)
#endsnippet

#snippet PANIC_MOVES
#endsnippet

#snippet LAUNCH_MOVES
  // $addToDice(1, dspecial, 1)
#endsnippet

#snippet PRESSURE_MOVES
  // $addToDice(1, nspecialair, 1)
  // $addToDice(1, nspecialair, 1)
  // $addToDice(1, nspecialair, 1)
  // $addToDice(1, uthrow, 1)
  // $addToDice(1, uthrow, 1)
  // $addToDice(1, uthrow, 1)
  // $addToDice(1, dthrow, 1)
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(1, dspecial, 1)
#endsnippet

#snippet BAIT_MOVES
  $addToDice(1, nspecialair, 2)
#endsnippet

#snippet CAMP_MOVES
  if !(XDistLE 15)
    DynamicDiceClear dslot0
    $addToDice(1, nspecialair, 3)
    $addToDice(1, nspecial, 0.1)
  endif
#endsnippet