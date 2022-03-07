#snippet INITIALIZATION
  #const UpBXDist = 45
  #const UpBYDist = 55
  #const sideBHeight = 50
  #const sideBRange = 80
  #const tolerence = 10

  #const jumpChance = 0.6
  #const highUpBChance = 0.45
  #const sideBChance = 0.8
  #const downBChance = 0.6
  #const highSideBChance = 0.7
  #const sideBClimbChance = 0.55
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let sideBValue = var7
  #let highSideBValue = var9
  #let sideBClimbValue = var10
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
  sideBValue = Rnd
  highSideBValue = Rnd
  sideBClimbValue = Rnd
#endsnippet

#snippet NCXOFFS_REDEFINE
  #const NCXOffs = 6
  #const NCXOffsNear = 4
#endsnippet

#snippet RECOVERY_CONDITIONS
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2

  GetNearestCliff nearCliffX
  DrawDebugRectOutline nearCliffX nearCliffY 10 10 color(0x00FF00DD)
  
  NEAREST_CLIFF(nearCliffX, nearCliffY)

  // drift towards goal
  globTempVar = nearCliffX * -1
  ClearStick
  AbsStick globTempVar

  absNCX = nearCliffX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    immediateTempVar = calc(cs_djumpHeight - 6)
    if !(NoOneHanging)
      immediateTempVar -= 20
    endif

    if YDistBackEdge > immediateTempVar && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      jumpValue *= 1.25
      Return
    endif
  elif YDistBackEdge > calc(cs_djumpHeight + UpBYDist - 20) || globTempVar < 18
    if NumJumps > 0 && Rnd < 0.5
      Button X
      Goto handleJumpToStage
      Return
    else
      hasTriedToUpB = 1
      Button B
      ClearStick
      AbsStick 0 (0.7)
      Return
    endif
  endif

  immediateTempVar = Direction * -1 * 5
  GetYDistFloorOffset immediateTempVar immediateTempVar 80 0
  if highUpBValue <= highUpBChance && YDistBackEdge > calc(UpBYDist - 50) && Equal hasTriedToUpB 0 && Equal immediateTempVar -1 
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if absNCX <= UpBXDist && YDistBackEdge > calc(UpBYDist - tolerence) && Equal hasTriedToUpB 0 && Equal isBelowStage 0 && Equal immediateTempVar -1 
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif

  GetLaBasic immediateTempVar 89 0
  if Equal immediateTempVar 0 
    if YDistBackEdge > -40 && YDistBackEdge < -10 && sideBValue < sideBChance
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
    if YDistBackEdge > -100 && YDistBackEdge < -10 && highSideBValue < highSideBChance
      Button B
      ClearStick
      Stick 1 0
      Return
    endif

    GetColDistPosRel immediateTempVar immediateTempVar 0 TopNY 0 0 1
    if !(Equal immediateTempVar -1) && sideBClimbValue < sideBClimbChance 
      Button B
      ClearStick
      Stick 1 0
      Return
    endif
  endif
#endsnippet

#snippet DSPECIAL
#endsnippet

#snippet NSPECIAL
#endsnippet

#snippet USPECIAL
  ClearStick
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif nearCliffX > 6 || nearCliffX < -6
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
    immediateTempVar = HurtboxSize - 5
    if NoOneHanging && YDistBackEdge < immediateTempVar && highUpBValue < highUpBChance
      AbsStick 0 (-1)
    endif
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar

    if YDistBackEdge < 15 && YSpeed > 2
      currGoal = cg_recover_reversal
      XGoto CalcAttackGoal
      XReciever
      scriptVariant = sv_none
      XGoto SetAttackGoal
      XReciever
      skipMainInit = mainInitSkip
      Call MainHub
    endif
  endif
#endsnippet

#snippet SSPECIAL
  ClearStick
  immediateTempVar = nearCliffX
  Abs nearCliffX
  anotherTempVar = YDistBackEdge * -1
  if AnimFrame > 2 && AnimFrame < 5
    immediateTempVar = TopNX * -1
    AbsStick immediateTempVar
  elif Equal CurrAction hex(0x113) && anotherTempVar > immediateTempVar
    currGoal = cg_recover_reversal
    XGoto CalcAttackGoal
    XReciever
    scriptVariant = sv_none
    XGoto SetAttackGoal
    XReciever
    skipMainInit = mainInitSkip
    Call MainHub
  elif YDistBackEdge > 10
    Button B
    Stick 0 1
  endif
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