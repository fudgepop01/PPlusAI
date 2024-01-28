#snippet ADDITIONAL_FILTERS
  // $ifLastAttack(nspecialair) && YDistBackEdge > -18 && YSpeed >= -0.1
  //   skipMainInit = sm_execAttack
  //   CallI ExecuteAttack
  // endif
  if currGoal >= cg_edgeguard
    $ifLastList(uspecial;uspecialair,if)
      lastAttack = -1
    $elifLastAttack(sspecial)
      lastAttack = -1
    $elifLastAttack(sspecialair)
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet COMBO_MOVES
  // $addToDice(1, dspecial, 1)
  // $addToDice(1, dair, 2)
  // $addToDice(1, nspecialair, 1)
#endsnippet

#snippet PANIC_MOVES
  // $addToDice(1, dspecialair, 1)
#endsnippet

#snippet LAUNCH_MOVES
#endsnippet

#snippet PRESSURE_MOVES
  // $addToDice(1, dair, 1)
  $addToDice(1, nspecial, 2)
  $addToDice(1, nspecialair, 2)
#endsnippet

#snippet SPACING_MOVES
  // $addToDice(1, nair, 1)
  // $addToDice(1, utilt, 1)
  // $addToDice(1, bair, 1)
  $addToDice(1, nspecial, 2)
  $addToDice(1, nspecialair, 2)
#endsnippet

#snippet BREAKCC_MOVES
  // $addToDice(1, dair, 2)
  // $addToDice(1, dspecial, 1)
#endsnippet

#snippet BAIT_MOVES
  $addToDice(1, nspecialair, 1)
  $addToDice(1, nspecial, 1)
#endsnippet

#snippet CAMP_MOVES
  $addToDice(1, nspecialair, 1.25)
  $addToDice(1, nspecial, 3)
  // $addToDice(1, dspecial, 1)
  // GetRaBit immediateTempVar hex(0x2) 0
  // if Equal immediateTempVar 0
  //   $addToDice(1, dspecialair, 1)
  //   $addToDice(1, dspecial, 1)
  // endif
#endsnippet