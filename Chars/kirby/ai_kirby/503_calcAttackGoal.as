#snippet KILL_MOVES
  // if YDistBackEdge < -45 && TopNY > OTopNY
  //   $addToDice(dspecialair)
  // endif
#endsnippet

#snippet COMBO_MOVES
  $addToDice(uspecial)
#endsnippet

#snippet PANIC_MOVES
  $addToDice(dspecialair)
#endsnippet

#snippet LAUNCH_MOVES
#endsnippet

#snippet PRESSURE_MOVES
  $addToDice(dspecial)
  $addToDice(dair)
#endsnippet