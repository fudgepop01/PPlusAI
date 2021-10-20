#snippet INITIALIZATION
  #const UpBXDist = 50
  #const UpBYDist = 90
  #const tolerence = 6

  #const jumpChance = 0.3
  #const highUpBChance = 0.15
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsClose = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2

  GetNearestCliff nearCliffX
  DrawDebugRectOutline nearCliffX nearCliffY 10 10 color(0x00FF00DD)
  
  NEAREST_CLIFF(nearCliffX, nearCliffY)
  
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance
    if YDistBackEdge > calc(pt_djumpHeight - 6)
      Button X
      Goto handleJumpToStage
      jumpValue *= 1.25
      Return
    endif
  elif YDistBackEdge > calc(pt_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0
      Button X
      Goto handleJumpToStage
      Return
    elif Equal isBelowStage 0
      hasTriedToUpB = 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
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
  if absNCX <= UpBXDist && YDistBackEdge > calc(UpBYDist - tolerence) && Equal hasTriedToUpB 0 && Equal isBelowStage 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet USPECIAL
  ClearStick
  if Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif nearCliffX > 6 || nearCliffX < -6
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet JUMP_TO_STAGE
  ClearStick
  if Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif nearCliffX > 6 || nearCliffX < -6
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
  immediateTempVar = nearCliffX * Direction
  if immediateTempVar < 0
    Stick -1
  endif
#endsnippet