#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118)
  $genActions(SSPECIAL, 113|119)
  $genActions(USPECIAL, 114|129|12b)
  $genActions(DSPECIAL, 115|12c)

  #const UpBXDist = 51
  #const UpBYDist = 70
  #const tolerence = 6

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

  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 9

  if AWAY_FROM_STAGE
    if NumJumps > 0
      $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
        DynamicDiceAdd dslot0 optJump 6
      endif
    endif
    $if_recoveryRect(x_abs,30,150,y_rangeAbove,highCliffY,0,100)
      DynamicDiceAdd dslot0 optSideB 10
    endif
    DynamicDiceSize dslot0 immediateTempVar
    if immediateTempVar < 2
      $if_recoveryRect(x_abs,10,UpBXDist,y_rangeAbove,highCliffY,UpBYDist,20)
        DynamicDiceAdd dslot0 optUpB 50
      endif
    endif
  elif True
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,20)
      DynamicDiceAdd dslot0 optUpB 50
    endif
    if NumJumps > 0
      $if_recoveryRect(x_abs,0,UpBXDist,y_rangeBelow,nearCliffY,UpBYDist,80)
        DynamicDiceAdd dslot0 optJump 50
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
  elif Equal CurrAction hex(0x114)
    Abs nearCliffX
    nearCliffX -= calc(UpBXDist * 0.5)
    nearCliffX *= 0.15
    Stick nearCliffX
  endif
#endsnippet

#snippet SSPECIAL
  ClearStick
  {BREVERSE}
  elif Equal CurrAction hex(0x119)
    Button B
  else
    AbsStick nearCliffX
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet