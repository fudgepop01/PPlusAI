#snippet INITIALIZATION
  #const UpBXDist = 50
  #const UpBYDist = 115
  #const tolerence = 10

  #const jumpChance = 0.35
  #const highUpBChance = 0.45
  #const waddleDashChance = 0.6
  #const waddleDashDist = 30
  #const waddleDashHeight = 30
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let waddleDashValue = var7
  hasTriedToUpB = 0
  jumpValue = Rnd
  highUpBValue = Rnd
  waddleDashValue = Rnd
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
  if highUpBValue <= highUpBChance && YDistBackEdge > calc(UpBYDist - 70) && Equal hasTriedToUpB 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif
  if absNCX <= UpBXDist && YDistBackEdge > calc(UpBYDist - tolerence) && Equal hasTriedToUpB 0 && Equal isBelowStage 0
    hasTriedToUpB = 1
    Button B
    ClearStick
    AbsStick 0 (0.7)
    Return
  endif 
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

  // if YDistBackEdge < -waddleDashHeight && waddleDashValue < waddleDashChance && NumJumps > 0
  //   Seek execWaddleDash
  //   Jump
  // endif

  // if !(True)
  //   label execWaddleDash
  //     XGoto PerFrameChecks
  //     XReciever
  //     Seek execWaddleDash

  //     globTempVar = nearCliffX * -1
  //     AbsStick globTempVar
  //     if Equal CurrAction hex(0xE) || Equal CurrAction hex(0xF)
  //       Button B
  //     elif Equal CurrAction hex(0x113)
  //       if Equal CanCancelAttack 1
  //         Seek postThrow
  //         Jump
  //       endif
  //     endif
  //   Return
  //   label postThrow
  //     XGoto PerFrameChecks
  //     XReciever
  //     Seek postThrow

  //     ClearStick
  //     globTempVar = nearCliffX * -1
  //     AbsStick globTempVar
  //     if Equal CurrAction hex(0x113)
  //       Button X
  //     elif Equal CurrAction hex(0xE) || Equal CurrAction hex(0xD)
  //       Button X
  //     endif
  //   Return
  // endif
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