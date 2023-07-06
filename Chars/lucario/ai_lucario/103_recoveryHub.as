#snippet INITIALIZATION
  #const UpBRadius = 64
  #const tolerence = 35

  #const jumpChance = 0.65
  #const highUpBChance = 0.15
  #const downBChance = 0.75
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let downBValue = var7
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
  downBValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet
Equal CurrAction hex(0x115)
#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  #let distFromEdge = var3

  NEAREST_CLIFF(nearCliffX, nearCliffY)
  Norm distFromEdge nearCliffX nearCliffY
  Abs distFromEdge
  
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBRadius - 20) || globTempVar < 18
    if NumJumps > 0 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    else
      hasTriedToUpB = 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif
  if YDistBackEdge < 10 && absNCX > 20 && Rnd < 0.2
    Button A
    ClearStick
    AbsStick 0 (-0.7)
    Return
  endif
  if YDistBackEdge < 30 && absNCX > 35 && downBValue < downBChance
    Button B
    ClearStick
    AbsStick 0 (-0.7)
    Return
  endif
  if highUpBValue <= highUpBChance && distFromEdge < UpBRadius && YDistBackEdge < 20 && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if distFromEdge > calc(UpBRadius - tolerence) && distFromEdge < UpBRadius && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
#endsnippet

#snippet USPECIAL
  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX += 5
    else
      nearCliffX -= 5
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DC)) && !(Equal CurrSubaction hex(0x1DD))
    if !(NoOneHanging)
      nearCliffY -= 25
      if nearCliffX > 0
        nearCliffX += 15
      else
        nearCliffX -= 15
      endif
    endif

    if Equal isBelowStage 0
      if XSpeed < 0 && nearCliffX < 0 
        nearCliffX -= 50
      elif XSpeed > 0 && nearCliffX > 0
        nearCliffX += 50
      endif
    endif

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
        nearCliffY -= 1
      elif NCY < 20 && absNCX < 30 && YSpeed > 0
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