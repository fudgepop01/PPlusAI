#snippet PRE_RECOVERY_CHECKS
  if Equal CurrAction hex(0x10)
    Seek handleSFall
    Jump
  endif
#endsnippet

#snippet NSPECIAL
  Seek reroll
  $makeRecovery(nspecial)
#endsnippet

#snippet SSPECIAL
  Seek reroll
  $makeRecovery(sspecial)
#endsnippet

#snippet USPECIAL
  Seek reroll
  $makeRecovery(uspecial)
#endsnippet

#snippet DSPECIAL
  Seek reroll
  $makeRecovery(dspecial)
#endsnippet

#snippet SFALL
  globTempVar = TopNX * -1
  AbsStick globTempVar
#endsnippet

#snippet CD_OLD
  NEAREST_CLIFF(cliffDistX, cliffDistY)
  if nearCliffY > 0
    immediateTempVar = Direction * nearCliffX
    if immediateTempVar > 0
      immediateTempVar = Width * 2 
      if nearCliffX > 0
        nearCliffX -= immediateTempVar
      else
        nearCliffX += immediateTempVar
      endif
    endif
  endif
#endsnippet

#snippet CD_NEW
  DIST_TO_CLIFF(cliffDistX, cliffDistY)
  if nearCliffY > 0
    immediateTempVar = Direction * nearCliffX
    if immediateTempVar < 0
      immediateTempVar = Width * 2 
      if nearCliffX < 0
        nearCliffX -= immediateTempVar
      else
        nearCliffX += immediateTempVar
      endif
    endif
  endif
#endsnippet


#snippet JUMP_TO_STAGE_OLD
  ClearStick
  if Equal isBelowStage 1 || {nearCliffX > 6 || nearCliffX < -6}
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif YDistBackEdge < cs_djumpHeight
    globTempVar = nearCliffX * -3
    AbsStick globTempVar
  endif
#endsnippet

#snippet JUMP_TO_STAGE_NEW
  ClearStick
  if Equal isBelowStage 1 || {cliffDistX > 6 || cliffDistX < -6}
    AbsStick cliffDistX
  elif YDistBackEdge < cs_djumpHeight
    globTempVar = cliffDistX * 3
    AbsStick globTempVar
  endif
#endsnippet

#snippet CLIFF_DIST_MACRO
  {CD_OLD}
#endsnippet
#snippet JUMP_TO_STAGE
  {JUMP_TO_STAGE_OLD}
#endsnippet

#snippet JUMP_TO_STAGE_BELOW

#endsnippet

#snippet PRE_CONDITIONS
  cliffDistY -= TotalYSpeed
  cliffDistY += HurtboxSize
  // if !(NoOneHanging) && !(Equal isBelowStage 1)
  //   LOGSTR_NL str("someone hanging")
  //   tolerence += 25
  // endif
  if YDistBackEdge < calc(cs_djumpHeight - 4) && absNCX <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Seek begin
    Return
  endif
#endsnippet

#snippet DRAW_RADIUS
  #const parts = 32
  GetNearestCliff cliffDistX
  globTempVar = 0
  if !(True)
    label NC_draw
  endif
  globTempVar += 1
  immediateTempVar = calc(360 / parts) * globTempVar
  COS anotherTempVar immediateTempVar
  SIN immediateTempVar immediateTempVar
  anotherTempVar *= UpBRadius
  immediateTempVar *= UpBRadius
  anotherTempVar += cliffDistX
  immediateTempVar += cliffDistY
  DrawDebugLine cliffDistX cliffDistY anotherTempVar immediateTempVar color(0xFFFFFFDD)
  if globTempVar < parts
    SeekNoCommit NC_draw
  endif
#endsnippet

////// FOR USE IN FUNCTIONS //////

#snippet COMMON_RECOVERY_BASE
  if Equal isBelowStage 0 && nearCliffY > 0
    GetRndPointOnStage nearCliffX
    globTempVar = nearCliffX - TopNX
    AbsStick globTempVar
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet

#snippet COMMON_RECOVERY_BASE_NEW
  if Equal isBelowStage 0 && cliffDistY > 0
    GetRndPointOnStage cliffDistX
    globTempVar = cliffDistX - TopNX
    AbsStick globTempVar
  else
    AbsStick cliffDistX
  endif
#endsnippet

#snippet STANDARD_CLIFF_DATA
  #let nearCliffX = var0
  #let nearCliffY = var1
  #let absNCX = var2  
  #let highCliffY = var3
  
  DIST_TO_CLIFF(nearCliffX, nearCliffY)
  
  {CLIFF_OFFSET}

  // LOGSTR str("values")
  // LOGVAL nearCliffY
  nearCliffY *= -1
  anotherTempVar = HurtboxSize * 0.5
  nearCliffY -= anotherTempVar
  highCliffY = nearCliffY
  // LOGVAL nearCliffY

  if !(NoOneHanging) || {shouldGoHigh >= true && isBelowStage <= false}
    highCliffY += shouldGoHigh
    // LOGSTR str("hcy")
    // LOGVAL highCliffY
  endif

  // drift towards goal
  ClearStick
  anotherTempVar = nearCliffX
  if nearCliffY > 0 && AWAY_FROM_STAGE
    immediateTempVar = Width * 2
    if anotherTempVar > 0
      anotherTempVar -= immediateTempVar
    else
      anotherTempVar += immediateTempVar
    endif
  endif
  AbsStick anotherTempVar
  absNCX = nearCliffX
  Abs absNCX
  anotherTempVar = Width * 0.5
  absNCX -= anotherTempVar
  Abs absNCX

  // LOGVAL absNCX
  // PRINTLN

  anotherTempVar = HurtboxSize * 0.5 + CenterY
  DrawDebugRectOutline CenterX anotherTempVar 1 1 color(0xFFFFFFDD)
  DrawDebugRectOutline CenterX CenterY Width HurtboxSize color(0x888888DD)
#endsnippet

#snippet BREVERSE
  anotherTempVar = XSpeed * cliffDistX
  if AnimFrame <= 12 && ActionTimer <= 12 && anotherTempVar < 0
    AbsStick cliffDistX
#endsnippet

#snippet GLIDE
  if Equal CurrAction hex(0x84)
    AbsStick cliffDistX
  else
    immediateTempVar = HurtboxSize * -0.15
    if nearCliffY < immediateTempVar
      Stick -1
    elif nearCliffY > 15 && YSpeed > -1.25
      Stick 1
    endif
  endif
#endsnippet