#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113|119|11a|11c)
  $genActions(USPECIAL, 114)
  $genActions(DSPECIAL, 115|11d|11e|11f)

  #const sideBHeight = 17
  #const sideBRange = 15

  #const optNone = 0
  #const optJump = 1
  #const optUpB = 2
  #const optSideB = 3
  #const optDownB = 5
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

  $if_recoveryRect(x_abs,15,sideBRange,y_rangeAbove,nearCliffY,sideBHeight,sideBRange)
    DynamicDiceAdd dslot0 optSideB 6
  endif

  anotherTempVar = TopNY - BBoundary
  if anotherTempVar > 20
  else
    DynamicDiceClear dslot0
    DynamicDiceAdd dslot0 optNone 1
    if NumJumps > 0
      DynamicDiceAdd dslot0 optJump 100
    endif
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
    ClearStick
    anotherTempVar = TopNX * -1
    AbsStick anotherTempVar
    Button X
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet USPECIAL
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif True
    AbsStick nearCliffX 1
  endif
#endsnippet