#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|80|81|82|83)
  $genActions(DSPECIAL, 115)

  #const UpBXDist = 60
  #const UpBYDist = 60
  #const dairHeight = 80
  #const dairRange = 150

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optSideB = 30
  #const optDownB = 40
  #const optDair = 50
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
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
    anotherTempVar = XSpeed
    Abs anotherTempVar
    if anotherTempVar > 0.65 && YSpeed < 0
      $if_recoveryRect(x_abs,2,dairRange,y_rangeAbove,nearCliffY,-20,100)
        DynamicDiceAdd dslot0 optDair 100
      endif
    endif
    DynamicDiceSize dslot0 immediateTempVar
    if immediateTempVar < 2
      $if_recoveryRect(x_abs,5,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,55)
        DynamicDiceAdd dslot0 optUpB 50
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
  if recOption >= optDair
    Button A
    AbsStick 0 -1
  elif recOption >= optDownB
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
  elif Equal CurrAction hex(0x81)
    Button A
  elif Equal CurrAction hex(0x83)
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  endif
#endsnippet

#snippet SSPECIAL
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet