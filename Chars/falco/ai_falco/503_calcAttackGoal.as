#snippet ADDITIONAL_FILTERS
  // $setLastAttack(dspecialair)
  $ifLastAttack(dspecialair)
    if NumJumps < 1
      lastAttack = -1
    endif
    if !(Equal CurrSubaction JumpSquat) && YDistFloor < 10 && Equal OFramesHitstun 0 && OYDistFloor > 0 && YDistFloor > 0
      $setLastAttack(dspecial)
    endif
  $elifLastAttack(nspecial)
    if Rnd < 0.9
      $setLastAttack(nspecialair)
    endif
  endif
  $ifLastAttack(nspecialair)
    if Equal AirGroundState 2
      lastAttack = -1
    endif
  endif
  if currGoal >= cg_edgeguard
    $ifLastList(uspecial;uspecialair;nspecial;nspecialair;sspecialair,if)
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet FILTER_CHECKS
  $ifLastOrigin(sspecialair,false)
    move_IASA += OYDistFloor
  endif
#endsnippet

// #snippet COMBO_MOVES
//   // $addToDice(1, dspecial, 1)
//   // $addToDice(1, dair, 2)
//   // $addToDice(1, nspecialair, 1)
//   $addToDice(1, nspecialair, 60)
// #endsnippet

// #snippet PANIC_MOVES
//   $addToDice(1, dspecialair, 1)
// #endsnippet

// #snippet LAUNCH_MOVES
//   if Equal AirGroundState 1
//     $addToDice(1, dspecial, 180)
//   else
//     $addToDice(1, dspecialair, 140)
//   endif
// #endsnippet

// #snippet PRESSURE_MOVES
//   // $addToDice(1, dair, 1)
//   // $addToDice(1, nspecialair, 2)
//   $addToDice(1, nspecialair, 150)
// #endsnippet

// #snippet SPACING_MOVES
//   // $addToDice(1, nair, 1)
//   // $addToDice(1, utilt, 1)
//   // $addToDice(1, bair, 1)
//   $addToDice(1, nspecialair, 150)
// #endsnippet

// #snippet BREAKCC_MOVES
//   $addToDice(1, nspecialair, 150)
// #endsnippet

// #snippet BAIT_MOVES
//   $addToDice(1, nspecialair, 150)
// #endsnippet

// #snippet CAMP_MOVES
//   if !(XDistLE 10)
//     DynamicDiceClear dslot0
//     $addToDice(1, nspecialair, 4)
//     $addToDice(1, nspecial, 0.1)
//   endif
// #endsnippet