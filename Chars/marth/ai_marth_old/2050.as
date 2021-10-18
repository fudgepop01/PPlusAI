#snippet HITSTUN_ENDS
  if Equal AirGroundState 1
    if Rnd < 0.5 || LevelValue < LV6
      Stick -1
    elif Rnd < 0.7
      movePart = 1
      Call DTilt
    else
      movePart = 1
      Call DSmash
    endif
  elif Rnd < 0.2 && CanJump
    movePart = 0
    Call NAir
  else
    Seek Hitstun_End
    Return
  endif
#endsnippet