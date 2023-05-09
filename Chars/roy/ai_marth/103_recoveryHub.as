#snippet INITIALIZATION
  #const UpBXDist = 25
  #const UpBYDist = 40
  #const sideBHeight = 80
  #const sideBRange = 50
  #const tolerence = 6

  #const jumpChance = 0.3
  #const highUpBChance = 0.1
  #const sideBChance = 0.8
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  hasTriedToUpB = 0
  jumpValue = Rnd
  if nearCliffY > UpBYDist
    jumpValue = 0
  endif
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
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
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
  if sideBValue <= sideBChance && YDistBackEdge > -sideBHeight && YDistBackEdge < sideBHeight && absNCX <= sideBRange && AnimFrame >= 30
    Button B
    ClearStick
    Stick 1
    Return
  endif
  if highUpBValue <= highUpBChance && YDistBackEdge > calc(UpBYDist - 10) && Equal hasTriedToUpB 0
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
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif nearCliffX > 6 || nearCliffX < -6
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
    immediateTempVar = HurtboxSize - 5
    if NoOneHanging && YDistBackEdge < immediateTempVar && highUpBValue < highUpBChance
      AbsStick 0 (-1)
    endif
  else
    globTempVar = nearCliffX * -1
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

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet JUMP_TO_STAGE
  ClearStick
  if Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif Equal IsOnStage 1
    globTempVar = TopNX * -1
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