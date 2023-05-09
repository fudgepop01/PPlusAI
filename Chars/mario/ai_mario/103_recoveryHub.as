#snippet INITIALIZATION
  #const MarioSideB_RABit = hex(0x12)
  #const MarioDownB_LABit = hex(0x74)
  
  #const UpBXDist = 13
  #const UpBYDist = 35
  #const sideBHeight = 4
  #const sideBRange = 140
  #const tolerence = 10

  #const jumpChance = 0.6
  #const sideBChance = 0.7
  #const downBChance = 0.8
  #const highSideBChance = 0.6
  #const earlySideBChance = 0.8
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let downBValue = var8
  #let highSideBValue = var9
  #let earlySideBValue = var10
  jumpValue = Rnd
  sideBValue = Rnd
  downBValue = Rnd
  if cliffDistY < UpBYDist || cliffDistX > UpBXDist
    jumpValue = 0
    sideBValue = 0
    downBValue = 0
  endif
  highSideBValue = Rnd
  earlySideBValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 5
  #const NCXOffsNear = 3
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
  {PRE_CONDITIONS}
  immediateTempVar = Direction * -1 * 5
  GetYDistFloorOffset immediateTempVar immediateTempVar 80 0
  if absNCX <= UpBXDist && YDistBackEdge > calc(UpBYDist - tolerence) && Equal isBelowStage 0 && Equal immediateTempVar -1 
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  
  
  GetRaBit anotherTempVar MarioSideB_RABit 0
  if Equal anotherTempVar 1
    if YDistBackEdge < 80 && YDistBackEdge > -10 && sideBValue < sideBChance
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
  else
    immediateTempVar = XSpeed
    Abs immediateTempVar
    if YDistBackEdge < -20 && absNCX > 15 && earlySideBValue < earlySideBChance && immediateTempVar > 1.5
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
    if YDistBackEdge < 80 && YDistBackEdge > -10 && absNCX > 15 && sideBValue < sideBChance && immediateTempVar > 1.5
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
  endif

  GetLaBit anotherTempVar MarioDownB_LABit 0
  if YDistBackEdge > -10 && downBValue < downBChance && Equal anotherTempVar 0
    Button B
    ClearStick
    Stick 0 (-0.7)
    Return
  endif
  if jumpValue <= jumpChance && NumJumps > 0
    immediateTempVar = calc(cs_djumpHeight - 6)
    if !(NoOneHanging)
      immediateTempVar -= 20
    endif

    if YDistBackEdge > immediateTempVar && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      jumpValue *= 1.25
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    else
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
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
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet DSPECIAL
  MOD immediateTempVar AnimFrame 3
  if immediateTempVar <= 1
    Button B
  endif

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
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif True
    #let absNCX = var2
    NEAREST_CLIFF(nearCliffX, nearCliffY)

    // drift towards goal
    globTempVar = nearCliffX * -1
    ClearStick
    AbsStick globTempVar

    absNCX = nearCliffX
    Abs absNCX

    if highSideBValue < highSideBChance && YDistBackEdge < -10 && YDistBackEdge > -45
      if Equal CurrSubaction hex(0x1db) && AnimFrame >= 7 && Rnd < 0.2 
        Return
      elif !(Equal YDistFloor -1) 
        Button B
        Return
      endif
    endif

    if Equal CurrSubaction hex(0x1db) && AnimFrame >= 7 && Rnd < 0.2 && YDistBackEdge < 5 && YDistBackEdge > -10
      Return
    elif absNCX <= 15
      Button B
      Return
    endif
  endif
  if Equal CurrSubaction hex(0x1db)
    Button B
  endif
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