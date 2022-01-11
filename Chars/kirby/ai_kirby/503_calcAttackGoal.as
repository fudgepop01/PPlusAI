#snippet KILL_MOVES
  // if YDistBackEdge < -45 && TopNY > OTopNY
  //   $addToDice(1, dspecialair, 1)
  // endif
#endsnippet

#snippet COMBO_MOVES
  $addToDice(1, uspecial, 1)
#endsnippet

#snippet PANIC_MOVES
  $addToDice(1, dspecialair, 1)
#endsnippet

#snippet LAUNCH_MOVES
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(1, dspecial, 1)
  $addToDice(1, dair, 1)
#endsnippet