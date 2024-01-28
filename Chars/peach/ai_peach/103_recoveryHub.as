#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  if recOption > optFloat
    Button X
  endif

  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10|11E)
  $genActions(NSPECIAL, 114)
  $genActions(SSPECIAL, 113|117|118|119)
  $genActions(USPECIAL, 114|11a|11b|11c)
  $genActions(DSPECIAL, 115)
  #const PeachFloatAction = hex(0x11E)
  #const PeachFloat_LABit = hex(0x3E)
  
  #const UpBXDist = 50
  #const UpBYDist = 36
  #const sideBHeight = -10
  #const sideBRange = 50
  #const earlySideBHeight = -25
  #const floatXDist = 220
  #const floatYDist = 0

  #const optNone = 0
  #const optJump = 1
  #const optUpB = 2
  #const optEarlyUpB = 3
  #const optSideB = 4
  #const optEarlySideB = 5
  #const optFloat = 6
  #const optEarlyFloat = 7

  // these exist too
  // #let recOption = var4
  // #let shouldGoHigh = var5
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 5
  #const NCXOffsNear = 3
#endsnippet

#snippet RECOVERY_CONDITIONS
  {STANDARD_CLIFF_DATA}
  
  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 5

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,0,sideBRange,y_rangeAbove,highCliffY,sideBHeight,100)
      DynamicDiceAdd dslot0 optSideB 50
    endif
    $if_recoveryRect(x_rangeOffset,20,sideBRange,y_rangeAbove,highCliffY,earlySideBHeight,100)
      DynamicDiceAdd dslot0 optEarlySideB 1
    endif

    GetLaBit immediateTempVar PeachFloat_LABit fromSelf
    if Equal immediateTempVar false
      $if_recoveryRect(x_abs,0,floatXDist,y_rangeAbove,highCliffY,0,100)
        DynamicDiceAdd dslot0 optFloat 50
      endif
      $if_recoveryRect(x_abs,0,floatXDist,y_rangeAbove,highCliffY,0,100)
        DynamicDiceAdd dslot0 optFloat 50
      endif
    endif
  endif
  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 3
    $if_recoveryRect(x_abs,0,100,y_rangeAbove,nearCliffY,20,30)
      DynamicDiceAdd dslot0 optUpB 5
    endif
  endif
  $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,10)
    if immediateTempVar < 2
      DynamicDiceClear dslot0
    endif
    DynamicDiceAdd dslot0 optUpB 25
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
  if recOption >= optFloat
    AbsStick 0 (-1)
    Button X
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

#snippet SFALL
  AbsStick nearCliffX

  if Equal CurrAction PeachFloatAction
    Abs nearCliffX
    if nearCliffX < 20 || Equal IsOnStage 1
      Seek reroll
      Return
    endif
    Button X
  endif
#endsnippet

#snippet USPECIAL
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    AbsStick nearCliffX
  endif

  Abs nearCliffX
  if nearCliffX < 10 || TopNX > -20 && TopNX < 20 && Equal IsOnStage 1
    if Equal IsFastfalling false
      AbsStick nearCliffX (-1)
    endif
  endif

  if YDistBackEdge > 40
    AbsStick 0 -1
  endif
#endsnippet

#snippet SSPECIAL
  AbsStick nearCliffX
#endsnippet