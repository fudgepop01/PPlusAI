#snippet INITIALIZATION
  #const UpBXDist = 70
  #const UpBYDist = 60
  #const tolerence = 40

  #const jumpChance = 0.7
  #const highUpBChance = 0.65
  #const neutralBChance = 0.4
  #let hasUsedMove = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let neutralBValue = var7
  if PrevAction >= hex(0x74) && PrevAction <= hex(0x7B) 
    AND hasUsedMove hasUsedMove bf_USpecial_OFF
  else
    hasUsedMove = 0
  endif
  jumpValue = Rnd
  highUpBValue = Rnd
  neutralBValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2
  TIMED_NEAREST_CLIFF(nearCliffX, nearCliffY, 33)
  
  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  {PRE_CONDITIONS}
  
  immediateTempVar = nearCliffX + XSpeed * 30
  Abs immediateTempVar
  anotherTempVar = YDistBackEdge + YSpeed * -30
  AND globTempVar hasUsedMove bf_USpecial
  if highUpBValue <= highUpBChance && anotherTempVar > calc(UpBYDist - 40) && globTempVar <= 0
    OR hasUsedMove hasUsedMove bf_USpecial
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  immediateTempVar = UpBYDist - tolerence + HurtboxSize
  if immediateTempVar <= UpBXDist && anotherTempVar > immediateTempVar && globTempVar <= 0
    OR hasUsedMove hasUsedMove bf_USpecial
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 

  AND globTempVar hasUsedMove bf_NSpecial
  if neutralBValue <= neutralBChance && YDistBackEdge < 20 && globTempVar <= 0
    OR hasUsedMove hasUsedMove bf_NSpecial
    Button B
    ClearStick
    Return
  endif

  globTempVar = TopNY - BBoundary
  AND immediateTempVar hasUsedMove bf_USpecial
  if immediateTempVar <= 0 || jumpValue <= jumpChance && NumJumps > 0
    if YDistBackEdge > calc(cs_djumpHeight - 6) && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Seek begin
      Return
    endif
  elif anotherTempVar > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0
      Button X
      Goto handleJumpToStage
      Seek begin
      Return
    else
      OR hasUsedMove hasUsedMove bf_USpecial
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
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

  if absNCX < 10 && NCY < 10 && NCY > -10
    Button B
  endif
  
  if !(Equal CurrAction hex(0x119))
    Norm globTempVar nearCliffX nearCliffY
    nearCliffX /= globTempVar
    nearCliffY /= globTempVar
    nearCliffX *= -1
    nearCliffY *= -1

    if nearCliffY < 0.3 && nearCliffY > 0
      nearCliffY = 0.3
    endif

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
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  else
    Stick 1
  endif
#endsnippet

#snippet NSPECIAL
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif AnimFrame > 4
    Stick 1
  endif
#endsnippet