#snippet INITIALIZATION
  #const UpBXDist = 90
  #const UpBYDist = 95
  #const sideBHeight = 8
  #const sideBRange = 100
  #const tolerence = 15

  #const jumpChance = 0.3
  #const highUpBChance = 0.6
  #const highHighUpBChance = 0.3
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
  #const NCXOffs = 9
  #const NCXOffsNear = 4
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

  if !(NoOneHanging) && !(Equal isBelowStage 1)
    nearCliffY -= 25
  endif
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance
    if YDistBackEdge > calc(pt_djumpHeight - 12) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(pt_djumpHeight + UpBYDist - 30) || globTempVar < 18
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
  if YDistBackEdge > -sideBHeight && YDistBackEdge < sideBHeight && absNCX <= sideBRange
    if sideBValue <= sideBChance || trickAngleValue > trickAngleChance && highUpBValue > highUpBChance
      Button B
      ClearStick
      Stick 1
      Return
    endif
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
      nearCliffX += 4
    else
      nearCliffX -= 4
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DF))
    if !(NoOneHanging) && !(Equal isBelowStage 1)
      nearCliffY -= 45
    endif

    if trickAngleValue < trickAngleChance && !(Equal isBelowStage 1)
      immediateTempVar = Rnd * 70 + 20
      nearCliffY += YDistBackEdge
      nearCliffY -= immediateTempVar
    endif

    if highHighUpBValue <= highHighUpBChance || highUpBValue < highUpBChance
      if TopNX > 0
        nearCliffX -= 50
      else
        nearCliffX += 50
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

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif

  if sideBLedgeValue < sideBLedgeChance
    Abs nearCliffX
    if Equal CurrSubaction hex(0x1d1) && nearCliffX < 60
      Button B
    endif
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet