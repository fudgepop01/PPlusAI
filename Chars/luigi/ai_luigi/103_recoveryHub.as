#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10|11b)
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113|117|118|119)
  $genActions(USPECIAL, 114)
  $genActions(DSPECIAL, 115)

  #const LuigiDownB_LABit = hex(0x3D)
  
  #const UpBXDist = 5
  #const UpBYDist = 42
  #const sideBHeight = 4
  #const sideBRange = 80

  #const optNone = 0
  #const optJump = 1
  #const optUpB = 2
  #const optSideB = 3
  #const optEarlySideB = 4
  #const optDownB = 5
  #const optEarlyDownB = 6
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

  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,20,200,y_rangeAbove,highCliffY,10,200)
      DynamicDiceAdd dslot0 optEarlySideB 6
    endif
    GetLaBit anotherTempVar LuigiDownB_LABit fromSelf
    if anotherTempVar < 1
      $if_recoveryRect(x_abs,0,300,y_rangeAbove,nearCliffY,10,200)
        DynamicDiceAdd dslot0 optEarlyDownB 0.1
      endif
    endif
  endif

  $if_recoveryRect(x_abs,10,sideBRange,y_rangeAbove,highCliffY,10,40)
    DynamicDiceAdd dslot0 optSideB 20
  endif

  GetLaBit anotherTempVar LuigiDownB_LABit 0
  if anotherTempVar < 1
    $if_recoveryRect(x_abs,0,100,y_rangeBelow,highCliffY,50,60)
      DynamicDiceAdd dslot0 optDownB 40
    endif
  endif

  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 2
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,15)
      DynamicDiceClear dslot0
      DynamicDiceAdd dslot0 optUpB 5
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
    GetLaBit anotherTempVar LuigiDownB_LABit 0
    if anotherTempVar < 1
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
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal isBelowStage 1 || nearCliffX > 6 || nearCliffX < -6
    AbsStick nearCliffX
  endif
#endsnippet

#snippet DSPECIAL
  MOD immediateTempVar AnimFrame 3
  if immediateTempVar <= 1 && ActionTimer < 60
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

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif True
    #let absNCX = var2
    NEAREST_CLIFF(nearCliffX, nearCliffY)

    // drift towards goal
    globTempVar = nearCliffX * -1
    ClearStick
    AbsStick globTempVar

    absNCX = nearCliffX
    Abs absNCX

    if shouldGoHigh >= true && YDistBackEdge < -10 && YDistBackEdge < 45
      if Equal CurrSubaction hex(0x1db) && AnimFrame >= 7 && Rnd < 0.2 
        Return
      elif !(Equal YDistFloor -1) 
        Button B
        Return
      endif
    endif

    if Equal CurrSubaction hex(0x1db) && AnimFrame >= 7 && Rnd < 0.2 && YDistBackEdge < 5 && YDistBackEdge < 10
      Return
    elif absNCX <= 15
      Button B
      Return
    endif
  endif
  if Equal CurrSubaction hex(0x1db)
    Button B
  endif
#endsnippet