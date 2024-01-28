#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10|118)
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|117)
  $genActions(DSPECIAL, 115|11a|11c)
  
  #const UpBRadius = 55
  #const sideBRange = 95
  #const sideBHeight = -5

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optUpBUppies = 21
  #const optSideB = 30
  #const optSideBLedge = 31
  #const optDownB = 40
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet CLIFF_OFFSET
  immediateTempVar = TotalXSpeed * 0.5 * 43
  nearCliffX += immediateTempVar
#endsnippet

#snippet RECOVERY_CONDITIONS
  {STANDARD_CLIFF_DATA}

  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 1

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,2,sideBRange,y_rangeAbove,highCliffY,0,30)
      DynamicDiceAdd dslot0 optSideB 0.1
      DynamicDiceAdd dslot0 optSideBLedge 0.5
    endif
    $if_recoveryRect(x_abs,40,100,y_rangeAbove,highCliffY,-50,200)
      DynamicDiceAdd dslot0 optDownB 0.05
    endif
    // DynamicDiceSize dslot0 immediateTempVar
    // if immediateTempVar < 2
      Norm immediateTempVar nearCliffX nearCliffY
      Abs immediateTempVar
      if immediateTempVar < 65 && highCliffY > -40
        DynamicDiceAdd dslot0 optUpB 50
        DynamicDiceAdd dslot0 optUpBUppies 30
      endif
    // endif
  elif True
    DynamicDiceSize dslot0 immediateTempVar
    if immediateTempVar < 2
      Norm immediateTempVar nearCliffX nearCliffY
      Abs immediateTempVar
      if immediateTempVar < 70 && immediateTempVar > 60
        DynamicDiceAdd dslot0 optUpB 50
      endif
    endif
  endif

  anotherTempVar = nearCliffY + TopNY - 90
  immediateTempVar = nearCliffX + TopNX - 45
  globTempVar = immediateTempVar + 90
  DrawDebugLine immediateTempVar anotherTempVar globTempVar anotherTempVar color(0xDDDDDD88)
  anotherTempVar = TopNY - BBoundary
  if anotherTempVar > 20 && nearCliffY < 95
  else
    DynamicDiceClear dslot0
    DynamicDiceAdd dslot0 optNone 1
    if NumJumps > 0
      DynamicDiceAdd dslot0 optJump 100
    endif
    DynamicDiceSize dslot0 anotherTempVar
    if anotherTempVar < 2
      DynamicDiceAdd dslot0 optUpB 100
    endif
  endif

  DynamicDiceRoll dslot0 recOption 0
  if recOption > optJump
    ClearStick
  endif
  if recOption >= optDownB
    Button B
    AbsStick 0 -1
  elif recOption >= optSideB
    Button B
    AbsStick nearCliffX
  elif recOption >= optUpB
    Button B
    AbsStick 0 1
  elif recOption >= optJump
    Button X
  endif
#endsnippet

#snippet USPECIAL
  if Equal isBelowStage 1
    if cliffDistX < TopNX
      cliffDistX += 3
    else
      cliffDistX -= 3
    endif
  elif Equal recOption optUpBUppies
    cliffDistY -= shouldGoHigh
  endif

  if !(Equal CurrAction hex(0x117))
    #let absNCX = var4
    absNCX = cliffDistX

    Norm globTempVar cliffDistX cliffDistY
    cliffDistX /= globTempVar
    cliffDistY /= globTempVar
    cliffDistY *= -1

    if cliffDistY < 0.3 && cliffDistY > 0
      cliffDistY = 0.3
    endif

    if 0.1 < cliffDistX && cliffDistX < 0.25
      AbsStick 0.3 cliffDistY
    elif -0.25 < cliffDistX && cliffDistX < -0.1
      AbsStick -0.3 cliffDistY
    else
      AbsStick cliffDistX cliffDistY
    endif
  else
    AbsStick cliffDistX
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    AbsStick cliffDistX
  else
    AbsStick cliffDistX
    if Equal recOption optSideBLedge && ActionTimer >= 14
      immediateTempVar = Direction * calc(18 * 2)
      GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
      if immediateTempVar > -1
        Button B
      endif
    endif
  endif
#endsnippet

#snippet DSPECIAL
#endsnippet