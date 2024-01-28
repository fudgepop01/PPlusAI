#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113|121|122|126|12c)
  $genActions(USPECIAL, 114|12e)
  $genActions(DSPECIAL, 115)

  #const WarioDownB_LABasic = hex(0x42)

  #const UpBXDist = 47
  #const UpBYDist = 50
  #const sideBHeight = 10
  #const sideBRange = 50

  #const downBLv3Height = 40
  #const downBLv2Height = 30

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optSideB = 30
  #const optDownB = 40
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 5
  #const NCXOffsNear = 3
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

  $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,15)
    DynamicDiceClear dslot0
    DynamicDiceAdd dslot0 optUpB 5
  endif
  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,15,sideBRange,y_rangeAbove,nearCliffY,sideBHeight,50)
      DynamicDiceAdd dslot0 optSideB 6
    endif
  endif
  
  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 2
    GetLaBasic anotherTempVar WarioDownB_LABasic fromSelf
    if anotherTempVar >= 3
      $if_recoveryRect(x_abs,0,100,y_rangeBelow,highCliffY,downBLv3Height,150)
        DynamicDiceAdd dslot0 optDownB 40
      endif
    elif anotherTempVar >= 2
      $if_recoveryRect(x_abs,0,100,y_rangeBelow,highCliffY,downBLv2Height,150)
        DynamicDiceAdd dslot0 optDownB 40
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
    GetLaBasic anotherTempVar WarioDownB_LABasic fromSelf
    if anotherTempVar >= 2
      DynamicDiceAdd dslot0 optDownB 100
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

#snippet NSPECIAL
#endsnippet

#snippet USPECIAL
  ClearStick
  nearCliffX *= 0.05
  if AnimFrame > 2 && AnimFrame < 5
    AbsStick nearCliffX
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    AbsStick nearCliffX
  endif
#endsnippet

#snippet DSPECIAL
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    AbsStick nearCliffX
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif True
    AbsStick nearCliffX 1
  endif
#endsnippet