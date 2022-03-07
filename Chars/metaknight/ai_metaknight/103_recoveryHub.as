#snippet INITIALIZATION
  #const UpBXDist = 10
  #const UpBYDist = 58
  #const sideBHeight = 20
  #const sideBRange = 60
  #const downBRadius = 45
  #const tolerence = 25

  #const jumpChance = 0.4
  #const sideBChance = 0.75
  #const downBChance = 0.6
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let sideBValue = var7
  #let downBValue = var8
  hasTriedToUpB = 0
  jumpValue = Rnd
  sideBValue = Rnd
  downBValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

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
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0
      Button X
      Goto handleJumpToStage
      Return
    endif
  endif
  if downBValue <= downBChance && distFromEdge < downBRadius
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (-0.7)
    Return
  endif
  if sideBValue <= sideBChance && YDistBackEdge > -sideBHeight && YDistBackEdge < sideBHeight && absNCX <= sideBRange
    Button B
    ClearStick
    Stick 1
    Return
  endif
  if absNCX <= UpBXDist && YDistBackEdge > 10 && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
    if nearCliffY > 0
      Stick 0 (-1)
    else
      Stick 0 1
    endif
  endif
#endsnippet

#snippet USPECIAL
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  NEAREST_CLIFF(nearCliffX, nearCliffY)

  if AnimFrame > 2 && AnimFrame < 5
    if nearCliffX < 10 && nearCliffX > -10 && YDistBackEdge > 10
      immediateTempVar = TopNX
      AbsStick immediateTempVar
    elif Equal isBelowStage 1
      immediateTempVar = TopNX
      AbsStick immediateTempVar
    endif
  else
    Abs nearCliffX
    if nearCliffX < 10 && nearCliffY < 15
      Stick 0 1
      Button B
    elif Equal isBelowStage 1
      Stick 0 1
      Button B
    endif
  endif
#endsnippet

#snippet DSPECIAL
  if Equal CurrAction hex(0x11c)
    immediateTempVar = nearCliffX * -1
    ClearStick
    AbsStick immediateTempVar
  else
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
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet