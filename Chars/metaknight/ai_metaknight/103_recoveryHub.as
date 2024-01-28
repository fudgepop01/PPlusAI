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
  $genActions(SSPECIAL, 113|119|11a)
  $genActions(USPECIAL, 114|11d|85)
  $genActions(DSPECIAL, 115|11b|11c)

  #const UpBXDist = 10
  #const UpBYDist = 48
  #const sideBHeight = 20
  #const sideBRange = 73
  #const noochBHeight = 38
  #const noochBRange = 80
  #const downBRadius = 47
  #const GlideHeight = 30
  #const GlideRange = 100

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optGlide = 21
  #const optSideB = 30
  #const optDownB = 40
  #const optNoochB = 50
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
      DynamicDiceAdd dslot0 optGlide 5
    endif
    $if_recoveryRect(x_abs,50,sideBRange,y_rangeAbove,nearCliffY,sideBHeight,40)
      DynamicDiceAdd dslot0 optSideB 5
    endif
    $if_recoveryRect(x_abs,0,35,y_rangeAbove,nearCliffY,35,35)
      DynamicDiceAdd dslot0 optDownB 20
    endif
    $if_recoveryRect(x_abs,0,80,y_rangeAbove,nearCliffY,35,50)
      DynamicDiceAdd dslot0 optNoochB 10
    endif
  elif True
    $if_recoveryRect(x_abs,10,25,y_rangeAbove,nearCliffY,UpBYDist,15)
      DynamicDiceAdd dslot0 optUpB 80
    endif
  endif

  // DynamicDiceSize dslot0 immediateTempVar
  // if immediateTempVar < 2
  //   $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,10)
  //     DynamicDiceAdd dslot0 optUpB 50
  //   endif
  // endif

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
      DynamicDiceAdd dslot0 optGlide 100
    endif
  endif

  DynamicDiceRoll dslot0 recOption 0
  if recOption > optJump
    ClearStick
  endif
  if recOption >= optNoochB
    ClearStick
    Button B
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
  if Equal recOption optGlide
    if Equal CurrAction hex(0x114) && AnimFrame < 5
      AbsStick cliffDistX
    endif
    {GLIDE}
    Abs cliffDistX
    if cliffDistX < 10 && cliffDistY < 0 || YDistFloor > 0
      if XDistLE 20
        Button A
      else 
        Button X
      endif
    endif
  elif True
    if AnimFrame > 2 && AnimFrame < 5
      if nearCliffX < 10 && nearCliffX > -10 && YDistBackEdge > 10
        immediateTempVar = TopNX
        AbsStick immediateTempVar
      elif Equal isBelowStage 1
        immediateTempVar = TopNX
        AbsStick immediateTempVar
      endif
    else
      Abs nearCliffX
      if nearCliffX < 10 && nearCliffY < 15
        Stick 0 1
        Button B
      elif Equal isBelowStage 1
        Stick 0 1
        Button B
      endif
    endif
  endif
#endsnippet

#snippet SSPECIAL
  {BREVERSE}
  elif nearCliffY < 0
    Stick 0 1
  elif nearCliffY > 10
    Stick 0 -1
  endif
#endsnippet

#snippet NSPECIAL
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
  if Equal CurrAction hex(0x11c)
    immediateTempVar = nearCliffX * -1
    ClearStick
    AbsStick immediateTempVar
  else
    Norm globTempVar nearCliffX nearCliffY
    nearCliffX /= globTempVar
    nearCliffY /= globTempVar
    nearCliffY *= -1

    if 0.1 < nearCliffX && nearCliffX < 0.25
      AbsStick 0.3 nearCliffY
    elif -0.25 < nearCliffX && nearCliffX < -0.1
      AbsStick -0.3 nearCliffY
    else
      AbsStick nearCliffX nearCliffY
    endif
  endif
#endsnippet