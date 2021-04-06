// #snippet USPECIAL_ACTIONS
//   elif Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11B)
// #endsnippet

#snippet USPECIAL
if !(Equal CurrAction hex(0x114)) && !(Equal CurrAction hex(0x10))
  if Equal AirGroundState 1 || Equal CurrAction hex(0x0E) || Equal CurrAction hex(0x0F) || FramesHitstun > 0
    Call AIHub
  endif
endif

GetReturnGoal nearCliffX
nearCliffX = TopNX - nearCliffX
nearCliffX *= -1
nearCliffY = nearCliffY - TopNY * -1

if !(Equal CurrSubaction hex(0x1DC)) && !(Equal CurrSubaction hex(0x1DD))
  if !(NoOneHanging)
    nearCliffY -= 25
    if nearCliffX > 0
      nearCliffX += 15
    else
      nearCliffX -= 15
    endif
  elif nearCliffY > -3
    nearCliffY += 20
  endif

  globTempVar = nearCliffX
  Abs globTempVar
  if globTempVar < 5 && nearCliffY > -3 && nearCliffY < 5 && YSpeed < 0
    ClearStick
  else
    Norm globTempVar nearCliffX nearCliffY

    #let absNCX = var4
    #let NCY = var3
    absNCX = nearCliffX
    NCY = nearCliffY
    nearCliffX /= globTempVar
    nearCliffY /= globTempVar
    nearCliffX *= -1
    nearCliffY *= -1

    Abs absNCX
    if NCY < 0 && absNCX < 10
      nearCliffY -= 0.5
    endif

    if 0.1 < nearCliffX && nearCliffX < 0.25
      AbsStick 0.3 nearCliffY
    elif -0.25 < nearCliffX && nearCliffX < -0.1
      AbsStick -0.3 nearCliffY
    else
      AbsStick nearCliffX nearCliffY
    endif
  endif
else
  globTempVar = TopNX * -1
  AbsStick globTempVar
endif
#endsnippet