#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(NSPECIAL, 112|117|118|119|11a)
  $genActions(SSPECIAL, 113|11b|11c)
  $genActions(USPECIAL, 114|125|127)
  $genActions(DSPECIAL, 115)

  #const UpBMaxChargeTime = 45

  // no charge ==> full direction
  #const UpBXMin = 50
  // max charge ==> full direction
  #const UpBXMax = 85
  // max charge w/ lean ==> full direction
  #const UpBXMaxLean = 105

  // no charge ==> no direction
  #const UpBYMin = -60
  // max charge ==> no direction
  #const UpBYMax = -63
  // max charge w/ lean ==> full direction
  #const UpBYMaxLean = 15

  #const sideBHeight = -4
  #const sideBRange = 90
  #const sideBHitOffense = 55
  #const sideBGrabOffense = 35

  #const jumpChance = 0.3
  #const highUpBChance = 0.2
  #const sideBChance = 0.55
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let upBEdgeAimOffset = var7
  #let sideBValue = var8
  #let tolerence = var9
  tolerence = 10
  hasTriedToUpB = 0

  jumpValue = Rnd
  highUpBValue = Rnd
  sideBValue = Rnd
  upBEdgeAimOffset = Rnd * 60
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 10
  #const NCXOffsNear = 5
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let cliffDistX = var0
  #let cliffDistY = var1
  #let absNCX = var2
  DIST_TO_CLIFF(cliffDistX, cliffDistY)
  
  // drift towards goal
  ClearStick
  AbsStick cliffDistX

  absNCX = cliffDistX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}
  if sideBValue <= sideBChance && cliffDistY >= sideBHeight && cliffDistY < calc(sideBHeight + 8) && absNCX <= sideBRange
    $recover(side)
  endif
  if highUpBValue <= highUpBChance && cliffDistY < calc(UpBYMin + 40) && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif
  anotherTempVar = UpBYMin + tolerence
  if absNCX <= UpBXMaxLean && cliffDistY < anotherTempVar && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif

  if globTempVar < 18 && TotalYSpeed < -0.1
    globTempVar = -1
  endif
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if cliffDistY < calc(rec_jumpHeight + 6) && Rnd < 0.5
      $recover(jump)
    endif
  elif cliffDistY > calc(rec_jumpHeight + UpBYMin + 20) || globTempVar < 18
    if NumJumps > 0
      $recover(jump)
    else
      $recoverVar(up)
    endif
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
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet