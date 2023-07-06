#snippet EDGEGUARD_RADIUS
  #const rw = 50
  #const rh = 25
#endsnippet

#snippet BACKWARD_MOVES
  Call BAir
#endsnippet

#snippet FORWARD_MOVES
  if Rnd < 0.5
    Call DAir
  else
    Call FAir
  endif
#endsnippet

#snippet STAY_MOVES
  if OYDistBackEdge < 0
    Call UTilt
  elif Rnd < 0.3
    Call DTilt
  elif Rnd < 0.2
    Call UTilt
  elif Rnd < 0.3
    Call SSpecial
  else
    Call FSmash
  endif
#endsnippet

#snippet O_ABOVE_MOVES
  if Equal AirGroundState 1
    Call FAir
  elif !(Equal OPos Direction)
    Call BAir
  elif OTopNY > TopNY
    if Rnd < 0.3
      Call SSpecial
    else
      Call FAir
    endif
  elif YSpeed > 0.15
    if Rnd < 0.3
      Call SSpecial
    else
      Call FAir
    endif
  else
    Call FAir
  endif
#endsnippet

#snippet DEFAULT_MOVES
  Button X
  approachType = at_edgeguard
  movePart = 0
  tempVar = OTopNY - TopNY
  if tempVar > 30 && tempVar < 120 && !(XDistLE 30)
    Call FAir
  elif tempVar > 40 && tempVar < 120
    Call BAir
  else
    if Rnd < 0.5
      Call FAir
    else
      Call BAir
    endif
  endif
#endsnippet