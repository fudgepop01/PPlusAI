#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|118)
  $genActions(DSPECIAL, 115|11b|11d)
  
  #const UpBXDist = 150
  #const UpBYDist = 150
  #const tolerence = 6

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optUpBBair = 21
  #const optSideB = 30
  #const optDownB = 40
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  {STANDARD_CLIFF_DATA}

  GetColDistPosRel globTempVar anotherTempVar TopNX CenterY 0 80 false
  if Equal anotherTempVar -1
    anotherTempVar = nearCliffX
    Abs anotherTempVar
    if anotherTempVar < 10
      nearCliffX *= -1
      ClearStick
      AbsStick nearCliffX
      nearCliffX *= -1
    endif
  endif

  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 20
  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 25
    endif
  endif

  if AWAY_FROM_STAGE
    anotherTempVar = Direction * nearCliffX
    if anotherTempVar < 0
      $if_recoveryRect(x_abs,60,150,y_rangeAbove,highCliffY,10,100)
        DynamicDiceAdd dslot0 optDownB 10
      endif
      $if_recoveryRect(x_abs,0,150,y_rangeAbove,highCliffY,0,100)
        DynamicDiceAdd dslot0 optSideB 10
      endif
    endif
    $if_recoveryRect(x_abs,10,100,y_rangeAbove,highCliffY,-70,100)
      DynamicDiceAdd dslot0 optSideB 10
    endif
    DynamicDiceSize dslot0 immediateTempVar
    if immediateTempVar < 2
      $if_recoveryRect(x_abs,30,150,y_rangeAbove,highCliffY,100,150)
        DynamicDiceAdd dslot0 optUpBBair 10
      endif
      $if_recoveryRect(x_abs,0,30,y_rangeAbove,highCliffY,100,150)
        DynamicDiceAdd dslot0 optUpB 10
      endif
    endif
  elif True
    $if_recoveryRect(x_abs,0,150,y_rangeAbove,highCliffY,100,100)
      DynamicDiceAdd dslot0 optSideB 10
    endif
  endif

  anotherTempVar = TopNY - BBoundary
  if anotherTempVar > 20 && nearCliffY < calc(UpBYDist + 40)
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
  ClearStick
  if Equal recOption optUpBBair && ActionTimer >= 23
    Stick -1
    Button A
    Seek begin
    Return
  endif
  AbsStick nearCliffX
#endsnippet

#snippet SSPECIAL
  ClearStick
  {BREVERSE}
  else
    AbsStick nearCliffX
  endif
#endsnippet

#snippet DSPECIAL
  ClearStick
  {BREVERSE}
  elif Equal CurrAction hex(0x118) && AnimFrame > 2
    Button R
  else
    AbsStick nearCliffX
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet