#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|119|11a|129|12b)
  $genActions(DSPECIAL, 115|11e)

  #const UpBXDist = 37
  #const UpBYDist = 42
  #const sideBHeight = 1
  #const sideBRange = 40

  #const optNone = 0
  #const optJump = 10
  #const optNB = 20
  #const optUpB = 30
  #const optSideB = 40
  #const optDownB = 50
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  {STANDARD_CLIFF_DATA}
  
  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 1

  GetLaBasic anotherTempVar hex(0x62) fromSelf
  if anotherTempVar < 2
    $if_recoveryRect(x_abs,0,80,y_rangeBelow,nearCliffY,-30,60)
      DynamicDiceAdd dslot0 optNB 3
    endif 
  elif NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,2,sideBRange,y_rangeAbove,highCliffY,0,40)
      DynamicDiceAdd dslot0 optSideB 3
    endif
    $if_recoveryRect(x_abs,4,100,y_rangeAbove,highCliffY,-70,200)
      if NumJumps > 0
        DynamicDiceAdd dslot0 optJump 6
      else
        DynamicDiceAdd dslot0 optDownB 3
      endif
    endif
    $if_recoveryRect(x_abs,2,40,y_rangeAbove,nearCliffY,-10,30)
      DynamicDiceAdd dslot0 optUpB 3
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
    GetLaBasic anotherTempVar hex(0x62) fromSelf
    if anotherTempVar < 2
      DynamicDiceAdd dslot0 optNB 50
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
  elif recOption >= optNB
    Button B
    ClearStick
  elif recOption >= optJump
    Button X
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet DSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet NSPECIAL
  AbsStick nearCliffX
  if AnimFrame > 40 && NumJumps <= 0
    Stick 0 -1
  elif AnimFrame > 70
    Button X
  endif
#endsnippet

#snippet USPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    AbsStick nearCliffX
  endif
#endsnippet