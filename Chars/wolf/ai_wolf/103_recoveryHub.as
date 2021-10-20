#snippet INITIALIZATION
  #const UpBXDist = 55
  #const UpBYDist = 55
  #const sideBHeight = 8
  #const sideBRange = 65
  #const tolerence = 15

  #const jumpChance = 0.3
  #const highUpBChance = 0.4
  #const highHighUpBChance = 0.2
  #const sideBChance = 0.4
  #const sideBLedgeChance = 0.7
  #const trickAngleChance = 0.6
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let sideBLedgeValue = var8
  #let highHighUpBValue = var9
  #let trickAngleValue = var10
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
  highHighUpBValue = Rnd
  sideBValue = Rnd
  sideBLedgeValue = Rnd
  trickAngleValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsClose = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  NEAREST_CLIFF(nearCliffX, nearCliffY)
  
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance
    if YDistBackEdge > calc(pt_djumpHeight - 12)
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(pt_djumpHeight + UpBYDist - 30) || globTempVar < 18
    if NumJumps > 0
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
  if sideBValue <= sideBChance && YDistBackEdge > -sideBHeight && YDistBackEdge < sideBHeight && absNCX <= sideBRange
    Button B
    ClearStick
    Stick 1
    Return
  endif
  if highUpBValue <= highUpBChance && YDistBackEdge > calc(UpBYDist - 40) && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if highHighUpBValue <= highHighUpBChance && YDistBackEdge > calc(UpBYDist - 100) && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if absNCX <= UpBXDist && YDistBackEdge > calc(UpBYDist - tolerence) && Equal hasTriedToUpB 0
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
      nearCliffX += 2
    else
      nearCliffX -= 2
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DF))
    if !(NoOneHanging) && !(Equal isBelowStage 1)
      nearCliffY -= 45
    endif

    if trickAngleValue < trickAngleChance
      immediateTempVar = Rnd * 70 + 20
      nearCliffY -= immediateTempVar
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

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif

  if sideBLedgeValue < sideBLedgeChance
    Abs nearCliffX
    if Equal CurrSubaction hex(0x1d5) && nearCliffX < 25
      Button B
    endif
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet