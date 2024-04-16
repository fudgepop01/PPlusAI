#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118)
  $genActions(SSPECIAL, 113)
  $genActions(USPECIAL, 114|11a|11b|11c|11e)
  $genActions(DSPECIAL, 115|11f|121)

  #const UpBXDist = 100
  #const UpBYDist = 80
  #const downBHeight = 8
  #const downBRange = 65
  #const tolerence = 15

  #const optNone = 0
  #const optJump = 10
  #const optFloat = 11
  #const optUpB = 20
  #const optUpBTrick = 21
  #const optSideB = 30
  #const optDownB = 40
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  GetColDistPosRel globTempVar globTempVar TopNX TopNY 3 0 0
  if globTempVar > 0
    ClearStick
    AbsStick -1
    Return
  endif
  GetColDistPosRel globTempVar globTempVar TopNX TopNY -3 0 0
  if globTempVar > 0
    ClearStick
    AbsStick 1
    Return
  endif

  {STANDARD_CLIFF_DATA}

  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 9

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 6
    endif
  endif

  if AWAY_FROM_STAGE
    globTempVar = nearCliffX * XSpeed
    anotherTempVar = XSpeed
    Abs anotherTempVar
    if globTempVar > 0 && anotherTempVar > 1
      $if_recoveryRect(x_abs,10,150,y_rangeBelow,highCliffY,-100,120)
        DynamicDiceAdd dslot0 optDownB 10
      endif
    endif
  endif

  globTempVar = HurtboxSize + 15 * Scale
  GetColDistPosRel globTempVar anotherTempVar TopNX CenterY 0 globTempVar false
  if Equal anotherTempVar -1
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,highCliffY,UpBYDist,100)
      DynamicDiceAdd dslot0 optUpB 5
    endif
    $if_recoveryRect(x_abs,0,UpBXDist,y_rangeAbove,highCliffY,20,50)
      DynamicDiceAdd dslot0 optUpBTrick 5
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
    if Equal recOption optFloat
      AbsStick 0 -1
    endif
  endif
#endsnippet

#snippet USPECIAL
  if ActionTimer < 10 || Equal CurrAction hex(0x114)
    immediateTempVar = 0

    anotherTempVar = HurtboxSize + 25 * Scale
    LOGVAL_NL anotherTempVar
    globTempVar = TopNY - 20
    GetColDistPosRel immediateTempVar globTempVar TopNX globTempVar 20 anotherTempVar false
    if !(Equal immediateTempVar -1)
      AbsStick -1 (-1)
    endif
    LOGVAL_NL immediateTempVar
    globTempVar = TopNY - 20
    GetColDistPosRel globTempVar anotherTempVar TopNX globTempVar -20 anotherTempVar false
    if !(Equal globTempVar -1)
      AbsStick 1 (-1)
    endif
    LOGVAL_NL globTempVar
    if !(Equal immediateTempVar -1) || !(Equal globTempVar -1)
      Return
    endif
  endif


  #const startDist = 40
  #const endDist = 6
  #const time = 30
  #let timer = var0
  timer = 30
  label exec_uspecial
  XGoto PerFrameChecks
  //= XReciever
  Seek exec_uspecial

  #let nearCliffX = var1
  #let nearCliffY = var2
  NEAREST_CLIFF(nearCliffX, nearCliffY)

  if !(Equal isBelowStage 1)
    if !(NoOneHanging)
      nearCliffY -= 20
    endif

    if Equal recOption optUpBTrick
      immediateTempVar = 20
      nearCliffY += YDistBackEdge
      nearCliffY -= immediateTempVar
    endif
  endif

  #let targetPosX = var3
  #let targetPosY = var4

  globTempVar = timer / time
  globTempVar *= calc(startDist - endDist)
  globTempVar += endDist
  Norm immediateTempVar nearCliffX nearCliffY

  targetPosX = nearCliffX / immediateTempVar
  targetPosX *= globTempVar * 1.05
  
  targetPosY = nearCliffY / immediateTempVar
  targetPosY *= globTempVar * 1.6

  targetPosX = TopNX + targetPosX
  targetPosY = TopNY + 5 + targetPosY

  DrawDebugRectOutline targetPosX targetPosY 5 5 color(0xFF8800DD)

  #let PKTXPos = var5
  #let PKTYPos = var6
  #let PKTXSpd = var7
  #let PKTYSpd = var8

  GetArticleOfTypeAtTargetLoc PKTXPos PKTYPos art_lucas_uspecial 0
  GetArticleOfTypeAtTargetSpeed PKTXSpd PKTYSpd art_lucas_uspecial 0

  ClearStick

  // LOGSTR str("POSITIONS")
  // LOGVAL PKTXPos
  // LOGVAL PKTYPos
  // LOGSTR str("SPEEDS")
  // LOGVAL PKTXSpd
  // LOGVAL PKTYSpd

  if !(Equal PKTXPos 0) && !(Equal PKTYPos 0)
    Norm anotherTempVar PKTXSpd PKTYSpd
    // LOGSTR str("totalVel")
    // LOGVAL anotherTempVar
    immediateTempVar = PKTXSpd / anotherTempVar
    if Equal PKTXSpd 0
      immediateTempVar = 0
    endif 
    globTempVar = PKTYSpd / anotherTempVar
    if Equal PKTYSpd 0
      globTempVar = 0
    endif 
    // LOGSTR str("XVel, YVel")
    // LOGVAL immediateTempVar
    // LOGVAL globTempVar
    immediateTempVar *= 10
    globTempVar *= 10 
    immediateTempVar = immediateTempVar + PKTXPos - targetPosX
    globTempVar = globTempVar + PKTYPos - targetPosY
    // LOGSTR str("xdist ydist")
    // LOGVAL immediateTempVar
    // LOGVAL globTempVar
    Norm anotherTempVar immediateTempVar globTempVar
    if timer > 0 && anotherTempVar <= 25
      timer -= 1
    endif

    // LOGSTR str("vecLen")
    // LOGVAL anotherTempVar
    immediateTempVar /= anotherTempVar
    globTempVar /= anotherTempVar
    immediateTempVar *= -1
    globTempVar *= -1
    AbsStick immediateTempVar globTempVar
  endif
  if CurrAction <= hex(0x100)
    Call RecoveryHub
  endif
#endsnippet