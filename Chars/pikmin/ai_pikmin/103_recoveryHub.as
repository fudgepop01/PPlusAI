#snippet INITIALIZATION
  $genActions(SFALL, 10)
  $genActions(USPECIAL, 114)

  #const UpBXDist = 58
  #const UpBYDist = 50

  #const jumpChance = 0.4
  #const highUpBChance = 0.3
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let tolerence = var9
  tolerence = 10
  hasTriedToUpB = 0

  jumpValue = Rnd
  highUpBValue = Rnd

  if cliffDistY < UpBYDist || cliffDistX > UpBXDist
    jumpValue = 0
  endif
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
  if highUpBValue <= highUpBChance && cliffDistY < calc(UpBYDist + 40) && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif
  anotherTempVar = UpBYDist + tolerence
  if absNCX <= UpBXDist && cliffDistY < anotherTempVar && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif

  if globTempVar < 18 && TotalYSpeed < -0.1
    globTempVar = -1
  endif
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if cliffDistY < calc(rec_jumpHeight + 6) && Rnd < 0.5
      $recover(jump)
    endif
  elif cliffDistY > calc(rec_jumpHeight + UpBYDist + 20) || globTempVar < 18
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

  AbsStick cliffDistX
  // SetDebugMode 0
#endsnippet

#snippet SSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet