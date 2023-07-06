#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Equal LevelValue LV9 && Damage < 50
      movePart = 1
      Call DTilt
    endif
    Stick -1
  elif Rnd < 0.3 && CanJump
    if Rnd < 0.6
      movePart = 0
      Call DAir
    else
      Button X
      Call FAir
    endif
  else
    Seek Hitstun_End
    Return
  endif
#endsnippet