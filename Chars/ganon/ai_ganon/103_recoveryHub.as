#snippet INITIALIZATION
  #const UpBXDist = 60
  #const UpBYDist = 58
  #const sideBHeight = 10
  #const sideBRange = 20
  #const tolerence = 6

  #const downBIfAbove = -60
  #const jumpChance = 0.3
  #const highUpBChance = 0.15
  #const sideBChance = 0.4
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
  sideBValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
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
  {PRE_CONDITIONS}
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
  if absNCX <= UpBXDist && YDistBackEdge > calc(UpBYDist - tolerence) && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
  if NumJumps > 0 && YDistBackEdge < calc(downBIfAbove + 12)
    Button X
    Goto handleJumpToStage
    Return
  elif YDistBackEdge < downBIfAbove
    Button B
    ClearStick
    AbsStick 0 (-1)
    Return
  elif Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
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
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet DSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet