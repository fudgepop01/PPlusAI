#snippet INITIALIZATION
  #const UpBXDist = 80
  #const UpBYDist = 80
  #const downBHeight = 8
  #const downBRange = 55
  #const tolerence = 15

  #const jumpChance = 0.8
  #const highUpBChance = 0.6
  #const highHighUpBChance = 0.3
  #const downBChance = 0.4
  #const downBLedgeChance = 0.8
  #const trickAngleChance = 0.5
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let downBValue = var7
  #let downBLedgeValue = var8
  #let highHighUpBValue = var9
  #let trickAngleValue = var10
  hasTriedToUpB = 0
  jumpValue = Rnd
  if cliffDistY < UpBYDist || cliffDistX > UpBXDist
    jumpValue = 0
  endif
  highUpBValue = Rnd
  highHighUpBValue = Rnd
  downBValue = Rnd
  downBLedgeValue = Rnd
  trickAngleValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  
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

  NEAREST_CLIFF(nearCliffX, nearCliffY)
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary

  {PRE_CONDITIONS}
  if downBValue <= downBChance && YDistBackEdge < downBHeight && YDistBackEdge < downBHeight && absNCX <= downBRange
    Button B
    ClearStick
    Stick 0 (-1)
    Return
  endif
  if highUpBValue <= highUpBChance && YDistBackEdge < calc(UpBYDist - 40) && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if highHighUpBValue <= highHighUpBChance && YDistBackEdge < calc(UpBYDist - 100) && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  immediateTempVar = UpBYDist - tolerence + HurtboxSize
  if absNCX <= UpBXDist && YDistBackEdge < immediateTempVar && YSpeed < 0 && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 12) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Seek begin
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 30) || globTempVar < 18
    if NumJumps > 0
      Button X
      Goto handleJumpToStage
      Seek begin
      Return
    else
      hasTriedToUpB = 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif
#endsnippet

#snippet USPECIAL
  if ActionTimer < 5 || Equal CurrAction hex(0x114)
    immediateTempVar = 0

    anotherTempVar = HurtboxSize + 8 * Scale
    globTempVar = TopNY - 20
    GetColDistPosRel immediateTempVar globTempVar TopNX globTempVar 50 anotherTempVar false
    if immediateTempVar > 0
      AbsStick -1 (-1)
    endif
    globTempVar = TopNY - 20
    GetColDistPosRel globTempVar anotherTempVar TopNX globTempVar -50 anotherTempVar false
    if globTempVar > 0
      AbsStick 1 (-1)
    endif
    if immediateTempVar > 0 || globTempVar > 0
      Return
    endif
  endif

  #const startDist = 60
  #const endDist = 6
  #const time = 20
  #let timer = var0
  timer = 20
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

    if trickAngleValue < trickAngleChance
      immediateTempVar = 20
      nearCliffY += YDistBackEdge
      nearCliffY -= immediateTempVar
    endif

    if highHighUpBValue <= highHighUpBChance && YDistBackEdge > calc(UpBYDist - 100) || highUpBValue <= highUpBChance && YDistBackEdge > calc(UpBYDist - 40)
      if TopNX > 0
        nearCliffX += 3
      else
        nearCliffX -= 3
      endif
    endif
  endif

  #let targetPosX = var3
  #let targetPosY = var4
  #let distFromSelf = var2

  globTempVar = timer / time
  globTempVar *= calc(startDist - endDist)
  globTempVar += endDist
  Norm immediateTempVar nearCliffX nearCliffY
  Abs immediateTempVar

  targetPosX = nearCliffX / immediateTempVar
  targetPosX *= globTempVar
  
  targetPosY = nearCliffY / immediateTempVar
  targetPosY *= globTempVar * 1.5

  targetPosX = CenterX + targetPosX
  targetPosY = CenterY + targetPosY

  DrawDebugRectOutline targetPosX targetPosY 5 5 color(0xFF8800DD)

  #let PKTXPos = var5
  #let PKTYPos = var6
  #let PKTXSpd = var7
  #let PKTYSpd = var8

  GetArticleOfTypeAtTargetLoc PKTXPos PKTYPos art_ness_uspecial 0
  GetArticleOfTypeAtTargetSpeed PKTXSpd PKTYSpd art_ness_uspecial 0

  ClearStick

  // LOGSTR str("POSITIONS")
  // LOGVAL PKTXPos
  // LOGVAL PKTYPos
  // LOGSTR str("SPEEDS")
  // LOGVAL PKTXSpd
  // LOGVAL PKTYSpd

  if !(Equal PKTXPos 0) && !(Equal PKTYPos 0)
    Norm anotherTempVar PKTXSpd PKTYSpd
    Abs anotherTempVar
    distFromSelf = anotherTempVar * 5
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
    immediateTempVar *= distFromSelf
    globTempVar *= distFromSelf 
    immediateTempVar = immediateTempVar + PKTXPos - targetPosX
    globTempVar = globTempVar + PKTYPos - targetPosY
    // LOGSTR str("xdist ydist")
    // LOGVAL immediateTempVar
    // LOGVAL globTempVar
    Norm anotherTempVar immediateTempVar globTempVar
    Abs anotherTempVar
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