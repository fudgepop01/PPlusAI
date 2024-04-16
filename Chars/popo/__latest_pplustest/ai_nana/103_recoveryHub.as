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
  $genActions(USPECIAL, 114|118|119|11c|11f)
  $genActions(DSPECIAL, 115)

  #const UpBXDist = 10
  #const UpBYDist = 15
  #const sideBHeight = 30
  #const sideBRange = 100

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
      DynamicDiceAdd dslot0 optJump 100
    endif
  endif

  if AWAY_FROM_STAGE
    anotherTempVar = XSpeed
    Abs anotherTempVar
    if anotherTempVar > 0.2
      $if_recoveryRect(x_abs,2,sideBRange,y_rangeAbove,nearCliffY,130,160)
        DynamicDiceAdd dslot0 optSideB 100
      endif
    endif
    // $if_recoveryRect(x_abs,0,10,y_rangeAbove,nearCliffY,15,15)
    //   DynamicDiceAdd dslot0 optUpB 15
    // endif
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
      DynamicDiceAdd dslot0 optSideB 100
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
  nearCliffX *= 0.5
  {BREVERSE}
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    AbsStick nearCliffX
  endif
#endsnippet

#snippet SSPECIAL
  MOD immediateTempVar AnimFrame 3
  if immediateTempVar <= 1
    Button B
  endif

  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    AbsStick nearCliffX
  endif
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet