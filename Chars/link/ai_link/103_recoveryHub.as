#snippet INITIALIZATION
  #const UpBXDist = 70
  #const UpBYDist = 30
  #const ZSnapDistY = 20
  #const ZSnapDistX = 30
  #const tolerence = 6

  #const jumpChance = 0.4
  #const highUpBChance = 0.25
  #const sideBChance = 0.5
  #const grappleChance = 0.6
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let hasUsedSideB = var8
  #let grappleValue = var9
  hasTriedToUpB = 0
  hasUsedSideB = 0
  jumpValue = Rnd
  sideBValue = Rnd
  grappleValue = Rnd
  if cliffDistY < UpBYDist || cliffDistX > UpBXDist
    jumpValue = 0
    grappleValue = 0
  endif
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
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    endif
  endif
  if YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
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

  immediateTempVar = Direction * nearCliffX
  if immediateTempVar > 0 && grappleValue <= grappleChance && YDistBackEdge < -ZSnapDistY && YDistBackEdge > ZSnapDistY && absNCX <= ZSnapDistX
    Button R|A
    ClearStick
    Stick 0 1
    Return
  endif
  if XSpeed > 1 || XSpeed < -1
    if sideBValue <= sideBChance && YDistBackEdge < -20 && Rnd < 0.2 && Equal hasUsedSideB 0
      Button B
      ClearStick
      Stick 1
      Return
    endif
  endif

  if highUpBValue <= highUpBChance && absNCX <= calc(UpBXDist * 2) && absNCX > calc(UpBXDist * 1.2) && YDistBackEdge < calc(UpBYDist - 40) && Equal hasTriedToUpB 0
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
  Button B
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    immediateTempVar = TopNY - OTopNY
    Stick 1
    if immediateTempVar > 20
      Stick 1 -1
    elif immediateTempVar < 20
      Stick 1 1
    endif
  endif
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet