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
  $genActions(USPECIAL, 114)
  $genActions(DSPECIAL, 115|119)

  #const UpBXDist = 90
  #const UpBYDist = 90
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
  DynamicDiceAdd dslot0 optNone 1

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 0.1
    endif
  endif
  
  GetLaBit immediateTempVar hex(0x3E) fromSelf
  if Equal immediateTempVar false
    $if_recoveryRect(x_abs,2,UpBXDist,y_rangeAbove,highCliffY,UpBYDist,30)
      DynamicDiceAdd dslot0 optUpB 0.1
    endif
  endif

  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 3
    if NumJumps > 0
      $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
        DynamicDiceAdd dslot0 optJump 50
      endif
    elif True
      $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,10)
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

#snippet SSPECIAL
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet USPECIAL
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    nearCliffX *= 0.05
    AbsStick nearCliffX
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    nearCliffX *= 0.033333
    AbsStick nearCliffX
  endif
#endsnippet