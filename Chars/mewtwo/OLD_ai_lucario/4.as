#snippet USPECIAL_ACTIONS
  elif Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11B)
#endsnippet

#snippet USPECIAL
  if !(Equal CurrAction hex(0x114)) && !(Equal CurrAction hex(0x10))
    if Equal AirGroundState 1 || Equal CurrAction hex(0x0E) || Equal CurrAction hex(0x0F) || FramesHitstun > 0
      Call AIHub
    endif
  endif

  if Equal CurrSubaction hex(0x1D9) || Equal CurrSubaction hex(0x1DA)
    if Equal isBelowStage 1
      NEAREST_CLIFF(nearCliffX, nearCliffY)
    endif 
    
    if !(NoOneHanging)
      nearCliffY -= 25
      if nearCliffX > 0
        nearCliffX += 15
      else
        nearCliffX -= 15
      endif
    endif

    Norm globTempVar nearCliffX nearCliffY

    nearCliffX /= globTempVar
    nearCliffY /= globTempVar
    nearCliffX *= -1
    nearCliffY *= -1

    if 0.1 < nearCliffX && nearCliffX < 0.25
      AbsStick 0.3 nearCliffY
    elif -0.25 < nearCliffX && nearCliffX < -0.1
      AbsStick -0.3 nearCliffY
    else
      AbsStick nearCliffX nearCliffY
    endif
  else
    GetNearestCliff nearCliffX 
    nearCliffX = TopNX - nearCliffX
    if Equal isBelowStage 1
      nearCliffX *= -1
    endif
    AbsStick nearCliffX
  endif
#endsnippet