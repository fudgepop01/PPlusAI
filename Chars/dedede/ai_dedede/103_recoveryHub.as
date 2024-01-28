#snippet INITIALIZATION
  #const UpBXDist = 53
  #const UpBYDist = 90

  #const jumpChance = 0.35
  #const highUpBChance = 0.45
  #const waddleDashChance = 0.6
  #const waddleDashDist = 30
  #const waddleDashHeight = 30
  #let hasTriedToUpB = var4
  #let jumpValue = var5
  #let highUpBValue = var6
  #let waddleDashValue = var7
  #let tolerence = var8
  tolerence = 10
  hasTriedToUpB = 0
  jumpValue = 0
  if cliffDistY < UpBYDist || cliffDistX > UpBXDist
    jumpValue = 0
  endif
  highUpBValue = Rnd
  waddleDashValue = Rnd
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
  cliffDistY += HurtboxSize
  hasTriedToUpB = 0
  // drift towards goal
  ClearStick
  AbsStick cliffDistX

  absNCX = cliffDistX
  Abs absNCX
  globTempVar = TopNY - BBoundary
  {PRE_CONDITIONS}
  if highUpBValue <= highUpBChance && cliffDistY <= calc(UpBYDist + 70) && Equal hasTriedToUpB 0
    $recoverVar(up)
  endif
  anotherTempVar = UpBYDist - tolerence
  if absNCX <= UpBXDist && cliffDistY < anotherTempVar && Equal hasTriedToUpB 0 && Equal isBelowStage 0
    $recoverVar(up)
  endif 
  if globTempVar < 18 && TotalYSpeed < -0.1
    globTempVar = -1
  endif
  if Equal hasTriedToUpB 1 || jumpValue <= jumpChance && NumJumps > 0
    immediateTempVar = calc(rec_jumpHeight + 6)
    if !(NoOneHanging)
      immediateTempVar += 20
    endif

    if cliffDistY < immediateTempVar && TotalYSpeed < 0.5
      Button X
      jumpValue *= 1.25
      Return
    endif
  elif cliffDistY < calc(rec_jumpHeight + UpBYDist + 20) || Equal globTempVar -1
    if NumJumps > 0
      Button X
      Return
    else
      $recoverVar(up)
    endif
  endif

  // if YDistBackEdge < -waddleDashHeight && waddleDashValue < waddleDashChance && NumJumps > 0
  //   Seek execWaddleDash
  //   Jump
  // endif

  // if !(True)
  //   label execWaddleDash
  //     XGoto PerFrameChecks
  //     //= XReciever
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
  //     //= XReciever
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
    AbsStick cliffDistX
  elif Equal isBelowStage 1
    AbsStick cliffDistX
  elif Equal CurrSubaction hex(0x1f7)
    AbsStick cliffDistX
    immediateTempVar = HurtboxSize - 6
    if NoOneHanging && cliffDistY > immediateTempVar
      Abs cliffDistX
      cliffDistX -= 25
      if YDistFloor > 0 || cliffDistY > 24
      elif highUpBChance > highUpBValue || OYDistFloor < 0 && cliffDistX < Width
        ClearStick
        AbsStick 0 (-1)
      endif
    endif
  elif cliffDistX > 6 || cliffDistX < -6
    AbsStick cliffDistX
  endif
#endsnippet


#snippet CLIFF_DIST_MACRO
  {CD_NEW}
#endsnippet
// #snippet JUMP_TO_STAGE
//   {JUMP_TO_STAGE_NEW}
// #endsnippet

#snippet JUMP_TO_STAGE
  ClearStick
  if Equal isBelowStage 1
    AbsStick cliffDistX
  elif Equal IsOnStage 1
    globTempVar = cliffDistX * -1
    AbsStick globTempVar
  elif cliffDistX > 6 || cliffDistX < -6
    AbsStick cliffDistX
  endif
  immediateTempVar = cliffDistX * Direction
  if immediateTempVar > 0
    Stick -1
  endif
#endsnippet