#snippet ADDITIONAL_FILTERS
  $ifLastAttack(dspecialair)
    if Equal NumJumps 0
      lastAttack = -1
    endif 
  $elifLastAttack(nspecialair) && YDistBackEdge > -18 && YSpeed >= -0.1
    skipMainInit = sm_execAttack
    CallI ExecuteAttack
  endif
#endsnippet

#snippet COMBO_MOVES
  $addToDice(dspecial)
  $addToDice(dair)
  $addToDice(nspecialair)
#endsnippet

#snippet PANIC_MOVES
  $addToDice(dspecialair)
#endsnippet

#snippet LAUNCH_MOVES
  $addToDice(dspecial)
  $addToDice(dspecialair)
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(dair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet

#snippet WALL_MOVES
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(dspecial)
#endsnippet

#snippet BAIT_MOVES
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet

#snippet CAMP_MOVES
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet