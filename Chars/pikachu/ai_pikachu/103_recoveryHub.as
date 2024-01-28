#snippet INITIALIZATION
  #const UpBRadius = 90
  #const sideBHeight = 0
  #const sideBRange = 80
  #const tolerence = 10

  #const jumpChance = 0.8
  #const sideBChance = 0.7
  #const highSideBChance = 0.55
  #const earlySideBChance = 0.95
  #const highUpBChance = 0.75
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let highSideBValue = var9
  #let earlySideBValue = var10
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
  sideBValue = Rnd
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
   #let distFromEdge = var3

  GetNearestCliff nearCliffX
  DrawDebugRectOutline nearCliffX nearCliffY 10 10 color(0x00FF00DD)
  
  NEAREST_CLIFF(nearCliffX, nearCliffY)

  Norm distFromEdge nearCliffX nearCliffY
  Abs distFromEdge

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
  if distFromEdge < UpBRadius && Equal hasTriedToUpB 0 && Equal isBelowStage 0 && Equal immediateTempVar -1 
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  
  if YDistBackEdge < -20 && absNCX > 15 && earlySideBValue < earlySideBChance
    Button B
    ClearStick
    Stick 1 0
    Return
  endif
  if YDistBackEdge > -40 && YDistBackEdge < -10 && absNCX > 15 && sideBValue < sideBChance
    Button B
    ClearStick
    Stick 1 0
    Return
  endif

  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
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
  endif
  if highUpBValue <= highUpBChance && distFromEdge < UpBRadius && YDistBackEdge < 20 && Equal hasTriedToUpB 0
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if distFromEdge > calc(UpBRadius - tolerence) && distFromEdge < UpBRadius && Equal hasTriedToUpB 0
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
  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX += 3
    else
      nearCliffX -= 3
    endif
  endif

  if Equal CurrSubaction hex(0x1DC) || Equal CurrSubaction hex(0x1DB)
    if !(NoOneHanging) && !(Equal isBelowStage 1)
      nearCliffY -= 35
    endif

    #let absNCX = var4
    #let NCY = var3
    absNCX = nearCliffX
    NCY = nearCliffY

    if Equal CurrSubaction hex(0x1DB)
      if nearCliffX > TopNX
        nearCliffX += 15
      else
        nearCliffX -= 15
      endif
    endif

    Norm globTempVar nearCliffX nearCliffY
    nearCliffX /= globTempVar
    nearCliffY /= globTempVar
    nearCliffX *= -1
    nearCliffY *= -1

    if 0.1 < nearCliffX && nearCliffX < 0.25
      AbsStick 0.3 nearCliffY
    elif -0.25 < nearCliffX && nearCliffX < -0.1
      AbsStick -0.3 nearCliffY
    else
      AbsStick nearCliffX nearCliffY
    endif
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