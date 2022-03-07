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
  DynamicDiceClear dslot0
  $addToDice(1, nspecialair, 3)
#endsnippet

#snippet COMBO_ROUTINES
  // if OFramesHitstun > 0 || OFramesHitlag > 0
  //   $ifLastOrigin(dair, false)
  //     DynamicDiceClear dslot0
  //     $addToDice(0, jab123, 1)
  //     $addToDice(0, utilt, 1)
  //     $addToDice(0, dspecial, 1)
  //     $addToDice(0, dair, 1)
  //     $addToDice(0, nair, 1)
  //   $ifLastOrigin(dspecial, true)
  //     DynamicDiceClear dslot0
  //     $addToDice(0, uair, 1)
  //     $addToDice(0, sspecial, 1)
  //     $addToDice(0, sspecialair, 1)
  //     $addToDice(0, dair, 1)
  //     $addToDice(0, nair, 1)
  //   $elifLastAttack(uthrow)
  //     $addToDice(1, sspecialair, 80)
  //   $elifLastAttack(bthrow)
  //     $addToDice(1, sspecialair, 80)
  //   endif
  // endif
#endsnippet