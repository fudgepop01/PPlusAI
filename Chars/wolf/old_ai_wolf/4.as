#snippet USPECIAL_ACTIONS
  elif Equal CurrAction hex(0x114)
#endsnippet

#snippet LEDGE_REFRESH
  globTempVar = 10
  label 
  if globTempVar >= 5
    ClearStick
    Stick 0 (-0.7)
    Button B
  elif globTempVar >= 3
    Button X
  else
    approachType = 0
    ClearStick
    Stick 0 0.7
    Button B
    hasTriedToUpB = 1
    Seek _main
  endif
  globTempVar -= 1
  Return
#endsnippet

#snippet USPECIAL
  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX += 2
    else
      nearCliffX -= 2
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DF))
    if !(NoOneHanging) && !(Equal isBelowStage 1)
      LOGSTR str("hanging")
      nearCliffY -= 25
      if nearCliffX > 0
        nearCliffX += 15
      else
        nearCliffX -= 15
      endif
    endif

    #let absNCX = var4
    #let NCY = var3
    absNCX = nearCliffX
    NCY = nearCliffY

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
    globTempVar = TopNX * -1
    AbsStick globTempVar
  endif
#endsnippet