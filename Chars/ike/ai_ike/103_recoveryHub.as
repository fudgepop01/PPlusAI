#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10|11d)
  $genActions(NSPECIAL, 112|117|118)
  $genActions(SSPECIAL, 113|11a|11b|11c)
  $genActions(USPECIAL, 114|11e|11f|120)
  $genActions(DSPECIAL, 115)

  #const canWJBasic = 91

  #const UpBXDist = 42
  #const UpBYDist = 50
  #const sideBHeight = -4
  #const sideBRange = 80
  #const sideBRangeEarly = 100

  #const optJump = 0
  #const optUpB = 1
  #const optHighUpB = 2
  #const optSideB = 3
  #const optSideBWJ = 4
  #const optHighSideB = 5
  #const optEarlySideB = 6

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optSideB = 30
  #const optSideBWJ = 31
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

  if absNCX < 10 && isBelowStage > 0
    isBelowStage = 0
  endif

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    $if_recoveryRect(x_abs,0,UpBXDist,y_abs,nearCliffY,-50,UpBYDist)
      DynamicDiceAdd dslot0 optUpB 100
    endif
    $if_recoveryRect(x_abs,0,sideBRangeEarly,y_rangeAbove,nearCliffY,-20,60)
      DynamicDiceAdd dslot0 optEarlySideB 50
    endif
    $if_recoveryRect(x_abs,0,sideBRange,y_rangeAbove,nearCliffY,0,50)
      DynamicDiceAdd dslot0 optSideB 50
    endif
  endif

  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 2
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,nearCliffY,UpBYDist,10)
      DynamicDiceAdd dslot0 optUpB 50
    endif
  endif

  $tempVar(wallCheckDist,immediateTempVar)
  wallCheckDist = -20
  if nearCliffX > 0
    wallCheckDist *= -1 
  endif
  if isBelowStage > 0
    wallCheckDist *= -1 
  endif

  GetLaBasic anotherTempVar canWJBasic 0
  GetColDistPosRel wallCheckDist wallCheckDist 0 -10 wallCheckDist 0 1
  if !(Equal wallCheckDist -1) && anotherTempVar > 0
    DynamicDiceAdd dslot0 optSideBWJ 75
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

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet USPECIAL
  ClearStick
  if Equal isBelowStage 1
    AbsStick nearCliffX
  elif nearCliffX > 6 || nearCliffX < -6
    if NoOneHanging
      AbsStick nearCliffX
    endif
  else
    AbsStick nearCliffX
  endif
#endsnippet

#snippet SSPECIAL
  if Equal CurrAction hex(0x67)
    Goto handleJumpToStage
    Return
  endif

  #let travelDist = var6
  DIST_TO_CLIFF(nearCliffX, nearCliffY)
  if Equal recOption optSideBWJ && isBelowStage > 0
    nearCliffX *= -1
  endif
  if AnimFrame > 2 && AnimFrame < 5 && Equal CurrAction hex(0x113)
    AbsStick nearCliffX
    Button B
  elif True
    #let absNCX = var2

    ClearStick
    AbsStick nearCliffX

    absNCX = nearCliffX
    Abs absNCX

    anotherTempVar = ActionTimer * calc(1 / 8) - 1
    travelDist = 45 + anotherTempVar * 9
    travelDist *= Direction

    $tempVar(wallCheckDist,immediateTempVar)
    GetColDistPosRel wallCheckDist anotherTempVar TopNX 0 travelDist 0 1
    if Equal recOption optSideBWJ
      if !(Equal wallCheckDist -1) || Equal CurrAction hex(0x11b)
        wallCheckDist -= TopNX
        Abs wallCheckDist
        if Equal CurrAction hex(0x11a)
          Return
        else
          MOD anotherTempVar AnimFrame 2
          if anotherTempVar <= 0
            ClearStick
            Stick -1
            Button X
          endif
          Return
        endif
        Return
      endif
    endif
    
    $tempVar(tolerantYDist,globTempVar)
    tolerantYDist = -30
    immediateTempVar = tolerantYDist + 30
    if Equal recOption optHighSideB && nearCliffY < tolerantYDist && nearCliffY > tolerantYDist
      if Equal CurrAction hex(0x11a)
        Return
      elif !(Equal YDistFloor -1)
        Button B
        Return
      endif
    endif

    GetLaBasic immediateTempVar canWJBasic 0
    if !(Equal CurrAction hex(0x11b))
      GetYDistFloorOffset anotherTempVar travelDist 0 0
      if anotherTempVar > 0
      elif nearCliffY < 0 && immediateTempVar > 0
        recOption = optSideBWJ
        Button B
      else
        Button B
      endif
    elif nearCliffY < 0 && immediateTempVar > 0
      recOption = optSideBWJ
    endif

    if !(Equal recOption optSideBWJ) && nearCliffY > 0 && Equal CurrAction hex(0x11b) && absNCX <= 15 && nearCliffY < 10
      Button B
      Return
    endif
  endif
#endsnippet