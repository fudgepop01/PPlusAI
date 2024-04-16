#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118|119|11a)
  // tether
  $genActions(SSPECIAL, 7f|80|81|82)
  $genActions(USPECIAL, 114)
  $genActions(DSPECIAL, 115|11d|11e|120|121)

  #const UpBXDist = 28
  #const UpBYDist = 50

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
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
  if !(Equal anotherTempVar -1)
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
  DynamicDiceAdd dslot0 optNone 1

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    if YSpeed < -1
      $if_recoveryRect(x_abs,20,200,y_rangeAbove,nearCliffY,UpBYDist,300)
        DynamicDiceAdd dslot0 optDownB 25
      endif
    endif
    DynamicDiceSize dslot0 immediateTempVar
    if immediateTempVar < 2
      $if_recoveryRect(x_abs,2,UpBXDist,y_rangeAbove,highCliffY,UpBYDist,20)
        DynamicDiceAdd dslot0 optUpB 5
      endif
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
  {BREVERSE}
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    nearCliffX *= 0.05
    AbsStick nearCliffX
  endif
#endsnippet

#snippet SSPECIAL
#endsnippet

#snippet DSPECIAL
  ClearStick
  if Equal CurrAction hex(0x11e) && AnimFrame > 51
    AbsStick 0 -1
    Button B
  elif Equal CurrAction hex(0x121)
    AbsStick nearCliffX
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet