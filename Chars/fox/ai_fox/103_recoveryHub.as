#snippet INITIALIZATION
  #const UpBRadius = 85
  #const sideBHeight = 3
  #const sideBRange = 90
  #const tolerence = 20

  #const jumpChance = 0.5
  #const highUpBChance = 0.7
  #const highHighUpBChance = 0.5
  #const sideBChance = 0.7
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
  if nearCliffY > UpBRadius || nearCliffX > sideBRange
    jumpValue = 0
  endif
  highUpBValue = Rnd
  highHighUpBValue = Rnd
  sideBValue = Rnd
  if nearCliffX > sideBRange
    sideBValue = 0
  endif
  sideBLedgeValue = Rnd
  trickAngleValue = Rnd
  if nearCliffX > calc(UpBRadius * 0.5)
    trickAngleValue = 1
  endif
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 1
  #const NCXOffsNear = 1
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  #let distFromEdge = var3

  NEAREST_CLIFF(nearCliffX, nearCliffY)

  Norm distFromEdge nearCliffX nearCliffY
  Abs distFromEdge

  if Equal isBelowStage 0
    if highUpBValue < highUpBChance
      distFromEdge += 15
    endif
    if highHighUpBValue < highHighUpBChance
      distFromEdge += 15
    endif
  endif
  
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}
  if sideBValue <= sideBChance && YDistBackEdge > -sideBHeight && YDistBackEdge < sideBHeight && absNCX <= sideBRange
    Button B
    ClearStick
    Stick 1
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
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBRadius - 20) || globTempVar < 18
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
#endsnippet

#snippet USPECIAL
  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX += 3
    else
      nearCliffX -= 3
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
#endsnippet

#snippet NSPECIAL
#endsnippet