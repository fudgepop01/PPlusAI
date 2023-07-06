#snippet EDGEGUARD_RADIUS
  #const rw = 50
  #const rh = 25
#endsnippet

#snippet BACKWARD_MOVES
  if Rnd < 0.3
    Call BAir
  elif Rnd < 0.3
    Call DAir
  else
    Call UAir
  endif
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
    Call FTilt
  elif Rnd < 0.3
    Call DSmash
  elif Rnd < 0.2
    Call DTilt
  else
    Call FSmash
  endif
#endsnippet

#snippet O_ABOVE_MOVES
  if Equal AirGroundState 1
      Call DAir
    elif !(Equal OPos Direction)
      Call BAir
    elif OTopNY > TopNY
      Call NAir
    elif YSpeed > 0.15
      Call DAir
    else
      Call UAir
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
    Call UAir
  else
    Call UAir
  endif
#endsnippet