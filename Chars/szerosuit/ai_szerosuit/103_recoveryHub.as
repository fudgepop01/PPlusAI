#snippet INITIALIZATION
  #const UpBXDist = 50
  #const UpBYDist = 30
  #const sideBHeight = 10
  #const sideBRange = 50
  #const tolerence = 8

  #const jumpChance = 0.7
  #const downBChance = 0.7
  #const sideBChance = 0.8
  #let hasTriedToUpB = var4
  #let hasTriedToDownB = var5
  #let jumpValue = var6
  #let downBValue = var7
  #let sideBValue = var8
  hasTriedToUpB = 0
  hasTriedToDownB = 0
  jumpValue = Rnd
  downBValue = Rnd
  if nearCliffY > UpBYDist
    jumpValue = 0
    downBValue = 0
  endif
  sideBValue = Rnd
  if YDistBackEdge < -20
    sideBValue = 0
  endif
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  TIMED_NEAREST_CLIFF(nearCliffX, nearCliffY, 20)
  
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
      Seek begin
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
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
  if sideBValue <= sideBChance && YDistBackEdge > -sideBHeight && YDistBackEdge < sideBHeight && absNCX <= sideBRange && AnimFrame >= 30
    Button B
    ClearStick
    Stick 1
    Return
  endif
  if downBValue <= downBChance && YDistBackEdge > calc(UpBYDist - 10) && Equal hasTriedToDownB 0 && NumJumps > 0 && YDistBackEdge > calc(cs_djumpHeight + UpBYDist)
    hasTriedToDownB = 1
    Button B
    ClearStick
    AbsStick 0 (-0.7)
    Return
  endif
  if absNCX <= UpBXDist && YDistBackEdge < 15 && Equal hasTriedToUpB 0
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
    if NoOneHanging && YDistBackEdge < immediateTempVar && downBValue < downBChance
      AbsStick 0 (-1)
    endif
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet USPECIAL
  if Equal CurrAction hex(0x7a)
    Stick 1
  elif Equal CurrAction hex(0x81)
    GetCommitPredictChance immediateTempVar
    immediateTempVar *= 2
    if immediateTempVar > 0.75
      immediateTempVar = 0.75
    endif
    if Rnd > immediateTempVar || !(XDistLE 40) 
      Button X
    endif
  elif True
    if AnimFrame > 2 && AnimFrame < 5
      immediateTempVar = TopNX * -1
      AbsStick immediateTempVar
    else
      Stick 1
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
  if YSpeed < 0.1
    Button X
  endif
  Goto handleJumpToStage
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