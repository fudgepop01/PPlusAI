#snippet Jab123
  if Equal moveVariant mv_jabReset
    if frameCounter >= 15 || Idling
      Call AIHub
    endif
    Return
  endif

  if frameCounter >= 2
    if Equal CurrSubaction Attack11
      if Equal HitboxConnected 1 && frameCounter >= 7
        frameCounter = 0
        Button A
      elif frameCounter >= 15
        Call AIHub
      endif
    elif Equal CurrSubaction Attack12
      if Equal HitboxConnected 1 && frameCounter >= 8
        frameCounter = 0
        Button A
      elif frameCounter >= 18
        Call AIHub
      endif
    elif Equal CurrSubaction Attack13
      if Idling
        Call AIHub
      endif
    else
      Call AIHub
    endif
  endif
#endsnippet