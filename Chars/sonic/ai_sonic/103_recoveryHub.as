#snippet INITIALIZATION
  $genActions(SFALL, 10|1de|11d|123)
  $genActions(NSPECIAL, 112|118|119|11a|11b)
  $genActions(SSPECIAL, 113|11e|11f)
  $genActions(USPECIAL, 114)
  $genActions(DSPECIAL, 115|11e|120|122|124)

  #const UpBXDist = 25
  #const UpBYDist = 69
  #const tolerence = 6

  #const jumpChance = 0.1
  #const highUpBChance = 0.45
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  hasTriedToUpB = 0
  jumpValue = 0
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
  nearCliffY *= -1
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  GetLaBit hasTriedToUpB hex(0x3D) fromSelf
  LOGSTR str("HTTUB")
  LOGVAL hasTriedToUpB
  PRINTLN

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
  immediateTempVar = UpBYDist - tolerence + HurtboxSize
  if absNCX <= UpBXDist && YDistBackEdge < immediateTempVar && YSpeed < 0 && Equal hasTriedToUpB 0
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
      Seek begin
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0 && Equal hasTriedToUpB 1
      Button X
      Goto handleJumpToStage
      Seek begin
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
  anotherTempVar = TopNX * -1
  AbsStick anotherTempVar
#endsnippet

#snippet SSPECIAL
  anotherTempVar = TopNX * -1
  AbsStick anotherTempVar
  Button X
#endsnippet

#snippet DSPECIAL
  anotherTempVar = TopNX * -1
  AbsStick anotherTempVar
  Button X
#endsnippet

#snippet NSPECIAL
#endsnippet