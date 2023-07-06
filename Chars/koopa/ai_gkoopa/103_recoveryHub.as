#snippet INITIALIZATION
  #const UpBXDist = 100
  #const UpBYDist = 50
  #const tolerence = 15

  #const jumpChance = 0.4
  #const highUpBChance = 0.25
  #const sideBChance = 0.5
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let hasUsedSideB = var8
  hasTriedToUpB = 0
  hasUsedSideB = 0
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
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  endif
  if YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 45) || globTempVar < 18
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
  if XSpeed > 1 || XSpeed < -1
    if sideBValue <= sideBChance && YDistBackEdge < 20 && Rnd < 0.2 && Equal hasUsedSideB 0
      Button B
      ClearStick
      Stick 1
      Return
    endif
  endif
  if highUpBValue <= highUpBChance && YDistBackEdge < calc(UpBYDist - 40) && Equal hasTriedToUpB 0
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

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet