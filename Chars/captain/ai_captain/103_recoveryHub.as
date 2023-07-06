#snippet INITIALIZATION
  #const UpBXDist = 60
  // temp until i figure this out for sure
  // #const UpBYDist = -58
  #const UpBYDist = -48
  #const sideBHeight = 10
  #const sideBRange = 20

  #const downBIfAbove = 60
  #const jumpChance = 0.3
  #const highUpBChance = 0.15
  #const sideBChance = 0.4
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let tolerence = var8
  tolerence = 6
  hasTriedToUpB = 0
  jumpValue = Rnd
  if cliffDistY < UpBYDist || cliffDistX > UpBXDist
    jumpValue = 0
  endif
  highUpBValue = Rnd
  sideBValue = Rnd
  if cliffDistX > sideBRange
    sideBValue = 0
  endif
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
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
  if sideBValue <= sideBChance && cliffDistY > -sideBHeight && cliffDistY < sideBHeight && absNCX <= sideBRange
    $recover(side)
  endif
  if highUpBValue <= highUpBChance && cliffDistY < 30 && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif
  globTempVar = UpBYDist + tolerence
  if absNCX <= UpBXDist && cliffDistY < globTempVar && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif

  if globTempVar < 18 && TotalYSpeed < -0.1
    globTempVar = -1
  endif
  if NumJumps > 0 && cliffDistY > calc(downBIfAbove - 12)
    $recover(jump)
  elif cliffDistY > downBIfAbove
    $recover(down)
  elif Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    if cliffDistY < calc(rec_jumpHeight - 6) && Rnd < 0.5
      $recover(jump)
    endif
  elif cliffDistY < calc(rec_jumpHeight + UpBYDist + 20) || Equal globTempVar -1
    if NumJumps > 0
      $recover(jump)
    else
      $recoverVar(up)
    endif
  endif
#endsnippet

#snippet SSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet DSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet JUMP_TO_STAGE
  ClearStick
  if Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif Equal IsOnStage 1
    globTempVar = TopNX * -1
    AbsStick globTempVar
  elif nearCliffX > 6 || nearCliffX < -6
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
  immediateTempVar = nearCliffX * Direction
  if immediateTempVar < 0
    Stick -1
  endif
#endsnippet

#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_NEW}
#endsnippet