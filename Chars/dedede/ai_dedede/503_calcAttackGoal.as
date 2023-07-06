#snippet COMBO_MOVES
#endsnippet

#snippet LAUNCH_MOVES
  $addToDice(1, sspecial, 1)
#endsnippet

#snippet TECHCHASE_MOVES
  $addToDice(1, sspecial, 1)
#endsnippet

#snippet ESCAPE_MOVES
  if !(ODistLE 10)
    $addToDice(1, sspecial, 1)
    $addToDice(1, sspecialair, 1)
  endif
#endsnippet

#snippet SPACING_MOVES
  if !(ODistLE 10)
    $addToDice(1, sspecial, 1)
    $addToDice(1, sspecialair, 1)
  endif
  $addToDice(1, fair, 2)
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(1, sspecial, 1)
  $addToDice(1, fair, 2)
#endsnippet

#snippet BREAKCC_MOVES
  $addToDice(1, sspecial, 1)
#endsnippet

#snippet BAIT_MOVES
  if !(ODistLE 10)
    $addToDice(1, sspecial, 1)
    $addToDice(1, sspecialair, 1)
  endif
  $addToDice(1, fair, 2)
#endsnippet

#snippet CAMP_MOVES
  $addToDice(1, sspecial, 1)
  $addToDice(1, sspecialair, 1)
#endsnippet