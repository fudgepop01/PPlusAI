#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  if recOption > optFloat
    Button X
    ClearStick
    AbsStick 0 -1
  endif

  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10|11E)
  $genActions(NSPECIAL, 112|117|118|119)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|11b|11c)
  $genActions(DSPECIAL, 115|120)

  #const MewtwoFloatAction = hex(0x120)
  #const MewtwoFloat_LABit = hex(0x73)

  #const UpBXDist = 69
  #const UpBYDist = 55
  #const sideBHeight = 4
  #const sideBRange = 90
  #const tolerence = 6
  #const floatXDist = 70
  #const floatYDist = 70

  #const optNone = 0
  #const optJump = 10
  #const optFloat = 11
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
  DynamicDiceAdd dslot0 optNone 5

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    immediateTempVar = XSpeed
    Abs immediateTempVar
    if immediateTempVar > 1
      $if_recoveryRect(x_abs,0,sideBRange,y_rangeAbove,highCliffY,sideBHeight,100)
        DynamicDiceAdd dslot0 optSideB 50
      endif
    endif
  endif
  
  GetLaBit immediateTempVar MewtwoFloat_LABit fromSelf
  if Equal immediateTempVar false && NumJumps > 0
    $if_recoveryRect(x_abs,0,floatXDist,y_rangeAbove,highCliffY,70,100)
      DynamicDiceAdd dslot0 optFloat 50
    endif
  endif
  
  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 3
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,20)
      DynamicDiceAdd dslot0 optUpB 5
    endif
  endif

  anotherTempVar = TopNY - BBoundary
  if anotherTempVar > 20 && nearCliffY < calc(UpBYDist + 40)
  else
    DynamicDiceClear dslot0
    DynamicDiceAdd dslot0 optNone 1
    GetLaBit immediateTempVar MewtwoFloat_LABit fromSelf
    if Equal immediateTempVar false && NumJumps > 0
      DynamicDiceAdd dslot0 optFloat 100
    elif NumJumps > 0
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
    if Equal recOption optFloat
      AbsStick 0 -1
    endif
  endif
#endsnippet

#snippet USPECIAL
  if Equal isBelowStage 1
    if nearCliffX > TopNX
      nearCliffX += 2
    else
      nearCliffX -= 2
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DF))
    if !(NoOneHanging) && !(Equal isBelowStage 1)
      nearCliffY -= 25
      if nearCliffX > 0
        nearCliffX += 15
      else
        nearCliffX -= 15
      endif
    endif

    #let absNCX = var4
    #let NCY = var3
    absNCX = nearCliffX
    NCY = nearCliffY

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
  else
    globTempVar = TopNX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet SSPECIAL
  {BREVERSE}
  else
    Stick 1
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet

// float
#snippet DSPECIAL
  Button X
  if !(NoOneHanging) && !(Equal isBelowStage 1)
    nearCliffY -= 25
    if nearCliffX > 0
      nearCliffX += 15
    else
      nearCliffX -= 15
    endif
  endif

  #let absNCX = var4
  #let NCY = var3
  absNCX = nearCliffX
  NCY = nearCliffY

  Norm globTempVar nearCliffX nearCliffY
  if globTempVar < 10 || YDistFloor > 0
    currGoal = cg_attack
    skipMainInit = mainInitSkip
    CallI MainHub
  endif
  
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
#endsnippet