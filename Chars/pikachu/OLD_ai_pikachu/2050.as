#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Rnd < 0.5 || LevelValue < LV6
      Stick -1
    else
      movePart = 1
      Call DTilt
    endif
  elif Rnd < 0.2 && CanJump
    Button X
    movePart = 0
    Call DAir
  else
    Seek Hitstun_End
    Return
  endif
#endsnippet