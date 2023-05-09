#snippet INITIALIZATION
  $genActions(SFALL, 10|e|1de)
  $genActions(NSPECIAL, 112|118|119|11a|11b)
  $genActions(SSPECIAL, 113|11e|11f)
  $genActions(USPECIAL, 114|11d|123)
  $genActions(DSPECIAL, 115|11e|120|122|124)

  #const UpBXDist = 70
  #const UpBYDist = 80
  #const tolerence = 6

  #const jumpChance = 0.1
  #const highUpBChance = 0.45
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
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
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0 && Equal hasTriedToUpB 1
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
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet