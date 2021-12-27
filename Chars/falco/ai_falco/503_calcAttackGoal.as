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
  $addToDice(dair)
  $addToDice(nspecialair)
#endsnippet

#snippet PANIC_MOVES
  $addToDice(dspecialair)
#endsnippet

#snippet LAUNCH_MOVES
  if Equal AirGroundState 1
    $addToDice(dspecial)
  else
    $addToDice(dspecialair)
  endif
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(dair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet

#snippet SPACING_MOVES
  $addToDice(nair)
  $addToDice(utilt)
  $addToDice(bair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(dair)
  $addToDice(dair)
  $addToDice(dspecial)
#endsnippet

#snippet BAIT_MOVES
  $addToDice(nspecialair)
  $addToDice(nspecialair)
  $addToDice(nspecialair)
#endsnippet

#snippet CAMP_MOVES
  $addToDice(nspecialair)
#endsnippet