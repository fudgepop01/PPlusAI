#snippet EDGEGUARD_RADIUS
  #const rw = 50
  #const rh = 25
#endsnippet

#snippet BACKWARD_MOVES
  if Rnd < 0.3
    Call BAir
  else
    Call DAir
  endif
#endsnippet

#snippet FORWARD_MOVES
  if Rnd < 0.3
    Call DAir
  elif Rnd < 0.8
    Call FAir
  else
    Call NAir
  endif
#endsnippet

#snippet STAY_MOVES
  if OYDistBackEdge < 0
    Call FTilt
  elif Rnd < 0.4
    Call DTilt
  elif Rnd < 0.6
    Call DSmash
  else
    Call FSmash
  endif
#endsnippet

#snippet O_ABOVE_MOVES
  if Rnd < 0.8
    Call NAir
  elif Rnd < 0.4
    Call BAir
  elif Rnd < 0.6
    Call FAir
  else
    Call DAir
  endif
#endsnippet

#snippet DEFAULT_MOVES
  Button X
  approachType = at_edgeguard
  movePart = 0
  tempVar = OTopNY - TopNY
  if tempVar > 30 && tempVar < 120 && !(XDistLE 30)
    Call NAir
  elif tempVar > 40 && tempVar < 120
    Call FAir
  else
    Call DAir
  endif
#endsnippet