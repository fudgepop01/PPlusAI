#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10|11d)
  $genActions(NSPECIAL, 112|117|118)
  $genActions(SSPECIAL, 113|11b|11c)
  $genActions(USPECIAL, 114|11e|11f|120)
  $genActions(DSPECIAL, 115)

  #const UpBXDist = 30
  #const UpBYDist = 40
  #const sideBHeight = -4
  #const sideBRange = 80

  #const optJump = 0
  #const optUpB = 1
  #const optHighUpB = 2
  #const optSideB = 3
  #const optSideBWJ = 4
  #const optHighSideB = 5
  #const optEarlySideB = 6
  #let recOption = var4

  #let tolerance = var5
  tolerance = 10
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  $tempVar(tolerantYDist,globTempVar)

  DIST_TO_CLIFF(nearCliffX, nearCliffY)
  
  // drift towards goal
  ClearStick
  AbsStick nearCliffX
  absNCX = nearCliffX
  Abs absNCX
  if absNCX < 10 && isBelowStage > 0
    isBelowStage = 0
  endif
  if isBelowStage < 1
    DynamicDiceClear dslot0
    if nearCliffY < calc(UpBYDist - 70) && absNCX < UpBXDist
      DynamicDiceAdd dslot0 optHighUpB 1
    endif
    tolerantYDist = calc(UpBYDist * -1) + tolerance
    if nearCliffY < tolerantYDist && absNCX < UpBXDist
      DynamicDiceAdd dslot0 optUpB 1
    endif

    tolerantYDist = -20 + tolerance
    if nearCliffY > tolerantYDist && absNCX > 20
      DynamicDiceAdd dslot0 optEarlySideB 1
    endif
    tolerantYDist = -40 + tolerance
    immediateTempVar = tolerantYDist + 30
    if nearCliffY < immediateTempVar && nearCliffY > tolerantYDist && absNCX < 20
      DynamicDiceAdd dslot0 optSideB 1
    endif
  endif

  $tempVar(wallCheckDist,immediateTempVar)
  wallCheckDist = -55
  if nearCliffX > 0
    wallCheckDist *= -1 
  endif
  if isBelowStage > 0
    wallCheckDist *= -1 
  endif
  GetColDistPosRel wallCheckDist wallCheckDist TopNX -10 wallCheckDist 0 1
  if !(Equal wallCheckDist -1) 
    DynamicDiceAdd dslot0 optSideBWJ 1
  endif

  if NumJumps > 0
    tolerantYDist = calc(cs_djumpHeight * -1) + tolerance
    if LevelValue >= LV5
      DynamicDiceAdd dslot0 optJump 1
    elif nearCliffY < tolerantYDist
      DynamicDiceAdd dslot0 optJump 20
    endif
  endif

  DynamicDiceRoll dslot0 recOption 0
  if Equal recOption optJump
    Button X
  elif Equal recOption optUpB || Equal recOption optHighUpB
    Button B
    ClearStick
    AbsStick nearCliffX 1
  elif recOption >= optSideB && recOption <= optEarlySideB 
    Button B
    ClearStick
    AbsStick nearCliffX 0
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
    travelDist = 60 + anotherTempVar * 9
    travelDist *= Direction

    $tempVar(wallCheckDist,immediateTempVar)
    GetColDistPosRel wallCheckDist anotherTempVar TopNX -10 travelDist 0 1
    if Equal recOption optSideBWJ && !(Equal wallCheckDist -1)
      wallCheckDist -= TopNX
      Abs wallCheckDist
      if Equal CurrAction hex(0x11a)
        Return
      else
        MOD anotherTempVar AnimFrame 2
        if anotherTempVar <= 0
          Stick -1
          Button X
        endif
        Return
      endif
      Return
    endif
    
    $tempVar(tolerantYDist,globTempVar)
    tolerantYDist = -40 + tolerance
    immediateTempVar = tolerantYDist + 30
    if Equal recOption optHighSideB && nearCliffY < tolerantYDist && nearCliffY > tolerantYDist
      if Equal CurrAction hex(0x11a)
        Return
      elif !(Equal YDistFloor -1)
        Button B
        Return
      endif
    endif

    if !(Equal CurrAction hex(0x11b))
      GetYDistFloorOffset anotherTempVar travelDist 0 0
      if anotherTempVar > 0
      elif nearCliffY < 0
        recOption = optSideBWJ
        Button B
      else
        Button B
      endif
    elif nearCliffY < 0
      recOption = optSideBWJ
    endif

    if !(Equal recOption optSideBWJ) && nearCliffY > 0 && Equal CurrAction hex(0x11b) && absNCX <= 15 && nearCliffY < 10
      Button B
      Return
    endif
  endif
#endsnippet