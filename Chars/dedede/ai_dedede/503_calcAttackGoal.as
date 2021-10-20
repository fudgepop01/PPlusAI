#snippet COMBO_MOVES
#endsnippet

#snippet LAUNCH_MOVES
  $addToDice(sspecial)
#endsnippet

#snippet TECHCHASE_MOVES
  $addToDice(sspecial)
#endsnippet

#snippet ESCAPE_MOVES
  if !(ODistLE 10)
    $addToDice(sspecial)
    $addToDice(sspecialair)
  endif
#endsnippet

#snippet SPACING_MOVES
  if !(ODistLE 10)
    $addToDice(sspecial)
    $addToDice(sspecialair)
  endif
  $addToDice(fair)
  $addToDice(fair)
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(sspecial)
  $addToDice(fair)
  $addToDice(fair)
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(sspecial)
#endsnippet

#snippet BAIT_MOVES
  if !(ODistLE 10)
    $addToDice(sspecial)
    $addToDice(sspecialair)
  endif
  $addToDice(fair)
  $addToDice(fair)
#endsnippet

#snippet CAMP_MOVES
  $addToDice(sspecial)
  $addToDice(sspecialair)
#endsnippet