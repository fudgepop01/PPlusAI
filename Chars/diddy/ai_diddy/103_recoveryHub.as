#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet

#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118|119|11a)
  $genActions(SSPECIAL, 113|11b|11c|124)
  $genActions(USPECIAL, 114|125|127)
  $genActions(DSPECIAL, 115)

  #const DiddySideB_LABit = hex(0x71)

  #const UpBMaxChargeTime = 45

  // no charge ==> full direction
  #const UpBXMin = 50
  // max charge ==> full direction
  #const UpBXMax = 85
  // max charge w/ lean ==> full direction
  #const UpBXMaxLean = 105

  // no charge ==> no direction
  #const UpBYMin = -55
  // max charge ==> no direction
  #const UpBYMax = -58
  // max charge w/ lean ==> full direction
  #const UpBYMaxLean = 15

  #const sideBHeight = -4
  #const sideBRange = 90
  #const sideBHitOffense = 55
  #const sideBGrabOffense = 35

  #let upBEdgeAimOffset = var7

  upBEdgeAimOffset = Rnd * 60

  #const optNone = 0
  #const optJump = 10
  #const optUpB = 20
  #const optSideB = 30
  #const optDownB = 40
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 10
  #const NCXOffsNear = 5
#endsnippet

#snippet RECOVERY_CONDITIONS
  {STANDARD_CLIFF_DATA}
  
  DynamicDiceClear dslot0
  DynamicDiceAdd dslot0 optNone 1

  if NumJumps > 0
    $if_recoveryRect(x_abs,0,300,y_rangeBelow,highCliffY,15,150)
      DynamicDiceAdd dslot0 optJump 0.2
    endif
  endif

  if AWAY_FROM_STAGE
    GetLaBit anotherTempVar DiddySideB_LABit fromSelf
    if anotherTempVar <= false
      $if_recoveryRect(x_abs,10,150,y_rangeAbove,highCliffY,-30,100)
        DynamicDiceAdd dslot0 optSideB 6
      endif
    endif
  endif

  DynamicDiceSize dslot0 immediateTempVar
  if immediateTempVar < 2
    $if_recoveryRect(x_abs,0,50,y_rangeAbove,highCliffY,55,30)
      DynamicDiceAdd dslot0 optUpB 6
    endif
    $if_recoveryRect(x_abs,10,UpBXMaxLean,y_rangeAbove,highCliffY,UpBYMaxLean,30)
      DynamicDiceAdd dslot0 optUpB 6
    endif
  endif
  
  anotherTempVar = TopNY - BBoundary
  if anotherTempVar > 20 && nearCliffY < calc(55 + 40)
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
  if Equal isBelowStage 1
    if cliffDistX > TopNX
      cliffDistX += 2
    else
      cliffDistX -= 2
    endif
  endif

  if !(NoOneHanging)
    cliffDistY -= 20
  endif

  // SetDebugMode 1
  if Equal CurrAction hex(0x114) || Equal CurrAction hex(0x125)
    #let absCDX = var3
    absCDX = cliffDistX
    Abs absCDX

    // LOGSTR str("ACDX")
    // LOGVAL absCDX

    globTempVar = cliffDistY / UpBYMax
    anotherTempVar = absCDX / UpBXMaxLean

    #let anglePriority = var4
    anglePriority = anotherTempVar - globTempVar

    // LOGSTR str("Angle Priority")
    // LOGVAL anglePriority
    // PRINTLN

    if anglePriority > 0.5
      absCDX += upBEdgeAimOffset
      anotherTempVar = absCDX / UpBXMaxLean
      anglePriority = anotherTempVar - globTempVar
      // LOGSTR str("Shifted Priority")
      // LOGVAL anglePriority
    endif
    // 0.5 = equal priority; 45 deg angle
    // > 0.5 = height is more important
    // < 0.5 = dist is more important
    
    #let cliffLineDist = var5
    Norm cliffLineDist cliffDistX cliffDistY
    Abs cliffLineDist

    cliffLineDist += UpBYMin
    cliffLineDist /= UpBMaxChargeTime
    
    #let chargeTime = var5
    // because cliffLineDist and chargeTime are var1
    chargeTime *= UpBMaxChargeTime
    // LOGSTR str("charge time")
    // LOGVAL chargeTime

    #let leanFrame = var6
    leanFrame = chargeTime * anglePriority
    leanFrame -= UpBMaxChargeTime
    Abs chargeTime
    Abs leanFrame
    leanFrame *= 0.45

    // LOGSTR str("lean frame")
    // LOGVAL leanFrame
    // PRINTLN

    if AnimFrame > leanFrame
      AbsStick cliffDistX
    endif
    if AnimFrame <= chargeTime
      Button B
    endif
  else
    AbsStick cliffDistX
  endif
  // SetDebugMode 0
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
  if Equal CurrAction hex(0x124)
    Button X
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet