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

#snippet NSpecial
  #let timer = var1
  timer = 10 + Rnd * 70

  label NSpecialExec
  Goto checks

  #let loopTempVar = var0
  loopTempVar = 20

  if Equal movePart 2
    Seek 
    Jump
  endif
  if !(True)
    label _chk
    #let targetXDist = var5
    #let targetYDist = var6

    Goto CTD

    if targetXDist <= move_xRange && targetYDist <= move_yRange
      Button B
    endif

    loopTempVar -= 5
    if loopTempVar <= 0
      Seek
      Jump
    else
      Seek _chk
      Jump
    endif
    Return
  endif
  label

  if ODistLE 30
    if Rnd < 0.8 && Equal Direction OPos
      Button B
    elif Rnd < 0.2
      Button R
    elif Rnd < 0.4
      Stick 1 0
    else
      Stick -1 0
    endif
  endif
  timer -= 1
  if timer <= 0 && Equal movePart 2
    Button R
    Call AIHub
  elif timer <= 0
    movePart = 2
    timer = 50 + Rnd * 100
  endif
  Seek NSpecialExec
  Return
#endsnippet