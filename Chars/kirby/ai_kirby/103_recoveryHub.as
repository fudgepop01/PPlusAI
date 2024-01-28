#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  if CurrAction < hex(0xB) || CurrAction > hex(0xD)
    immediateTempVar = Direction * cliffDistX
    immediateTempVar += 10
    if immediateTempVar > 0
      Return
    endif
  endif
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|129|12b)
  $genActions(DSPECIAL, 115|12c)

  #const UpBXDist = 35
  #const UpBYDist = 37
  #const horizUpBHeight = 20
  #const horizUpBRange = 55

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optHorizUpB = 21
  #const optSideB = 30
  #const optDownB = 40
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
      immediateTempVar = NumJumps * 10
      DynamicDiceAdd dslot0 optJump immediateTempVar
    endif
  endif

  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,0,45,y_rangeAbove,nearCliffY,20,UpBYDist)
      DynamicDiceAdd dslot0 optUpB 100
    endif
    $if_recoveryRect(x_abs,0,horizUpBRange,y_rangeAbove,nearCliffY,5,horizUpBHeight)
      DynamicDiceAdd dslot0 optHorizUpB 20
    endif
  endif

  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 2
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,10)
      DynamicDiceAdd dslot0 optUpB 50
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
  if Equal recOption optHorizUpB
    Button B
    {BREVERSE}
    else
      Stick 1
    endif
  else
    AbsStick cliffDistX
  endif
  
#endsnippet

#snippet SSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet