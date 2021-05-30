#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Equal LevelValue LV9
      movePart = 1
      Call DTilt
    else
      Stick -1
    endif
  elif Rnd < 0.5
    movePart = 0
    if Rnd < 0.4 && CanJump
      Button X
      Stick 0 (-1)
      Call NAir
    else
      Call NAir
    endif    
  else
    Seek Hitstun_End
    Return  
  endif
#endsnippet