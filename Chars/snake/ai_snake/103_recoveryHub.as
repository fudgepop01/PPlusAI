#snippet INITIALIZATION
  $genActions(USPECIAL, 114|117|118)
  SetDebugMode 1
  LOGSTR str("REC NOT IN YET")
  SetDebugMode TEMP_DEBUG_TOGGLE
  
  #const UpBXDist = 90
  #const UpBYDist = 69
  #const horizUpBHeight = 0
  #const horizUpBRange = 0
  #const tolerence = 6

  #const jumpChance = 0.8
  #const highUpBChance = 0.4
  #const horizUpBChance = 0.75
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let horizUpBValue = var7
  hasTriedToUpB = 0
  jumpValue = 0
  highUpBValue = Rnd
  horizUpBValue = Rnd
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

  GetLaBit hasTriedToUpB hex(0x3D) fromSelf

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}
  
  if highUpBValue <= highUpBChance && YDistBackEdge > calc(UpBYDist - 40) && Equal hasTriedToUpB 0
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
    immediateTempVar = calc(cs_djumpHeight - 8)
    if !(NoOneHanging)
      immediateTempVar -= 20
    endif

    if YDistBackEdge > immediateTempVar && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      jumpValue *= 1.25
      Return
    endif
  else
  
    immediateTempVar = calc(cs_djumpHeight + UpBYDist - 20)
    if !(NoOneHanging)
      immediateTempVar -= 20
    endif
    if YDistBackEdge > immediateTempVar || globTempVar < 18
      if NumJumps > 0
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
  endif
#endsnippet

#snippet USPECIAL
    anotherTempVar = XSpeed * nearCliffX
    if AnimFrame < 5 && ActionTimer < 5 && anotherTempVar > 0
      anotherTempVar = nearCliffX * -1
      AbsStick anotherTempVar
    elif AnimFrame > 9
      anotherTempVar = nearCliffX * -1
      AbsStick anotherTempVar
    endif
#endsnippet

#snippet SSPECIAL
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
  if immediateTempVar < 0 && Equal isBelowStage 0
    Stick -1
  endif
#endsnippet