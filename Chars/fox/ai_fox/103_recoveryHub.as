#snippet INITIALIZATION
  $genActions(SFALL, 10|1de)
  $genActions(NSPECIAL, 112)
  $genActions(SSPECIAL, 113|129)
  $genActions(USPECIAL, 114|117|118)
  $genActions(DSPECIAL, 115|11a)

  #const UpBRadius = 85
  #const sideBHeight = -6
  #const sideBRange = 90

  #const jumpChance = 0.5
  #const highUpBChance = 0.85
  #const highHighUpBChance = 0.7
  #const sideBChance = 0.7
  #const sideBLedgeChance = 0.7
  #const trickAngleChance = 0.6
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let sideBLedgeValue = var8
  #let highHighUpBValue = var9
  #let trickAngleValue = var10
  #let tolerence = var11
  tolerence = 20
  hasTriedToUpB = 0
  jumpValue = Rnd
  if cliffDistY < UpBRadius || cliffDistX > sideBRange
    jumpValue = 0
  endif
  highUpBValue = Rnd
  highHighUpBValue = Rnd
  sideBValue = Rnd
  if cliffDistX > sideBRange
    sideBValue = 0
  endif
  sideBLedgeValue = Rnd
  trickAngleValue = Rnd
  if cliffDistX > calc(UpBRadius * 0.5)
    trickAngleValue = 1
  endif
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 1
  #const NCXOffsNear = 1
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let cliffDistX = var0
  #let cliffDistY = var1
  #let absNCX = var2
  #let distFromEdge = var3

  DIST_TO_CLIFF(cliffDistX, cliffDistY)

  immediateTempVar = Direction * cliffDistX
  if Equal isBelowStage 0 && immediateTempVar > 0
    if highUpBValue < highUpBChance
      immediateTempVar = highHighUpBChance - highHighUpBValue
      immediateTempVar /= 0.7
      immediateTempVar *= 25
      tolerence += immediateTempVar
    endif
    if highHighUpBValue < highHighUpBChance
      immediateTempVar = highHighUpBChance - highHighUpBValue
      immediateTempVar /= 0.7
      immediateTempVar *= 50
      tolerence += immediateTempVar
    endif
  endif
  
  // drift towards goal
  ClearStick
  AbsStick cliffDistX

  absNCX = cliffDistX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}

  Norm distFromEdge cliffDistX cliffDistY
  Abs distFromEdge
  if sideBValue <= sideBChance && cliffDistY > sideBHeight && cliffDistY < calc(sideBHeight + 20) && absNCX <= sideBRange
    $recover(side)
  endif
  if highUpBValue <= highUpBChance && distFromEdge < UpBRadius && cliffDistY < -20 && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif
  immediateTempVar = UpBRadius - tolerence
  if distFromEdge > immediateTempVar && distFromEdge < UpBRadius && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif

  if globTempVar < 18 && TotalYSpeed < -0.1
    globTempVar = -1
  endif
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if cliffDistY < calc(rec_jumpHeight + 6) && Rnd < 0.5
      $recover(jump)
    endif
  elif cliffDistY < calc(cs_djumpHeight - UpBRadius + 20) || Equal globTempVar -1
    if NumJumps > 0
      $recover(jump)
    else
      $recoverVar(up)
    endif
  endif
#endsnippet

#snippet USPECIAL
  if Equal isBelowStage 1
    if cliffDistX < TopNX
      cliffDistX += 3
    else
      cliffDistX -= 3
    endif
  endif

  if !(Equal CurrSubaction hex(0x1DF))
    if !(NoOneHanging) && !(Equal isBelowStage 1)
      cliffDistY -= 45
    endif

    #let absNCX = var4
    #let NCY = var3
    absNCX = cliffDistX
    Abs absNCX
    NCY = cliffDistY

    if trickAngleValue < trickAngleChance
      immediateTempVar = Rnd * 70 + 20
      cliffDistY -= immediateTempVar
      if absNCX < cliffDistY
        cliffDistY += absNCX
      endif
    endif

    Norm globTempVar cliffDistX cliffDistY
    cliffDistX /= globTempVar
    cliffDistY /= globTempVar
    cliffDistY *= -1

    if cliffDistY < 0.3 && cliffDistY > 0
      cliffDistY = 0.3
    endif

    if 0.1 < cliffDistX && cliffDistX < 0.25
      AbsStick 0.3 cliffDistY
    elif -0.25 < cliffDistX && cliffDistX < -0.1
      AbsStick -0.3 cliffDistY
    else
      AbsStick cliffDistX cliffDistY
    endif
  else
    globTempVar = TopNX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    AbsStick cliffDistX
  else
    AbsStick cliffDistX
    if sideBLedgeValue <= sideBLedgeChance && ActionTimer >= 18
      immediateTempVar = Direction * calc(20 * 2)
      GetYDistFloorOffset immediateTempVar immediateTempVar 5 0
      if immediateTempVar > -1
        Button B
      endif
    endif
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