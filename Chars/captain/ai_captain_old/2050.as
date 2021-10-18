#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    Stick -1
  elif Rnd < 0.2 && CanJump && ODistLE 30
    Button X
    movePart = 0
    // Call DAir
  else
    Seek Hitstun_End
    Return
  endif
#endsnippet