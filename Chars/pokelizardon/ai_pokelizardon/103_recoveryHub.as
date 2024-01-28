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
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114)
  $genActions(DSPECIAL, 115|117|84|85)

  #const UpBXDist = 37
  #const UpBYDist = 45
  #const GlideHeight = 5
  #const GlideRange = 85

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optSideB = 30
  #const optDownB = 40
  #const optGlide = 41
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
    $if_recoveryRect(x_abs,0,GlideRange,y_rangeAbove,nearCliffY,GlideHeight,65)
      DynamicDiceAdd dslot0 optGlide 35
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
  {BREVERSE}
  else
    AbsStick cliffDistX
  endif
#endsnippet

#snippet SSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet DSPECIAL
  {GLIDE}
  Abs cliffDistX
  if cliffDistX < 10 || YDistFloor > 0
    if XDistLE 30
      Button A
    else 
      Button X
    endif
  endif
#endsnippet