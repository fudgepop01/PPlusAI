#snippet USPECIAL_ACTIONS
  elif Equal CurrAction hex(0x114) || Equal CurrAction hex(0x11B) || Equal CurrAction hex(0x11C)
#endsnippet

#snippet LEDGE_REFRESH
  globTempVar = 4
  label 
  if globTempVar > 0
    immediateTempVar = nearCliffX * -1
    AbsStick nearCliffX
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
  if Equal IsOnStage 1
    Call USpecial
  endif

  if !(Equal CurrAction hex(0x114)) && !(Equal CurrAction hex(0x10)) && !(Equal CurrAction hex(0x11B))
    if Equal AirGroundState 1 || Equal CurrAction hex(0x0E) || Equal CurrAction hex(0x0F) || FramesHitstun > 0
      Call AIHub
    endif
  endif

  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX += 5
    else
      nearCliffX -= 5
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DC)) && !(Equal CurrSubaction hex(0x1DD))
    if !(NoOneHanging)
      LOGSTR str("hanging")
      nearCliffY -= 25
      if nearCliffX > 0
        nearCliffX += 15
      else
        nearCliffX -= 15
      endif
    else
      // nearCliffY += 10
    endif

    if Equal isBelowStage 0
        LOGSTR str("not below")
      if XSpeed < 0 && nearCliffX < 0 
        nearCliffX -= 50
        LOGSTR str("L --> R")
      elif XSpeed > 0 && nearCliffX > 0
        nearCliffX += 50
        LOGSTR str("R --> L")
      endif
    endif

    LOGSTR str("in_NCY")
    LOGVAL nearCliffY

    globTempVar = nearCliffX
    Abs globTempVar
    if globTempVar < 5 && nearCliffY > -3 && nearCliffY < 5 && YSpeed < 0
      ClearStick
    else
      #let absNCX = var4
      #let NCY = var3
      absNCX = nearCliffX
      NCY = nearCliffY

      Norm globTempVar nearCliffX nearCliffY
      nearCliffX /= globTempVar
      nearCliffY /= globTempVar
      nearCliffX *= -1
      nearCliffY *= -1

      Abs absNCX
      globTempVar = XSpeed
      Abs globTempVar
      if NCY < 0 && absNCX < 30 && globTempVar > 2
        LOGSTR str("curve_1")
        nearCliffY -= 1
      elif NCY < 20 && absNCX < 30 && YSpeed > 0
        LOGSTR str("curve_2")
        nearCliffY -= 1
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

#snippet DSPECIAL
Button A
Stick 0 (-1)
#endsnippet

#snippet INITIALIZERS
#let hasTriedToDownB = var9
#let recoveryType = var10
hasTriedToDownB = 0
recoveryType = Rnd
#endsnippet

#snippet ADDITIONAL_TRIGGERS
if nearCliffY > 15 && absNCX > 25 && Equal hasTriedToDownB 0 && recoveryType <= 0.3
  ClearStick
  globTempVar = TopNX * -1
  AbsStick globTempVar (-0.7)
  Button B
  hasTriedToDownB = 1
elif nearCliffY > 15 && absNCX > calc(maxXEdgeDist + 20) && Equal hasTriedToDownB 0
  ClearStick
  globTempVar = TopNX * -1
  AbsStick globTempVar (-0.7)
  Button B
  hasTriedToDownB = 1
elif nearCliffY > -50 && globTempVar > 15 && globTempVar < 0 && Equal hasTriedToUpB 0 && recoveryType <= 0.6
  ClearStick
  Stick 0 0.7
  Button B
  hasTriedToUpB = 1
endif
#endsnippet