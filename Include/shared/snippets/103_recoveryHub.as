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

#snippet JUMP_TO_STAGE
  ClearStick
  if Equal isBelowStage 1
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif nearCliffX > 6 || nearCliffX < -6
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  elif YDistBackEdge < cs_djumpHeight
    globTempVar = nearCliffX * -3
    AbsStick globTempVar
  endif
#endsnippet

#snippet PRE_CONDITIONS
  if !(NoOneHanging) && !(Equal isBelowStage 1)
    LOGSTR_NL str("someone hanging")
    nearCliffY -= 25
  endif
  if YDistBackEdge > calc(cs_djumpHeight - 4) && absNCX <= 15 && NumJumps > 0
    Button X
    Goto handleJumpToStage
    Return
  endif
  nearCliffY -= yRecoveryOffset
#endsnippet

#snippet DRAW_RADIUS
  #const parts = 32
  GetNearestCliff nearCliffX
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
  anotherTempVar += nearCliffX
  immediateTempVar += nearCliffY
  DrawDebugLine nearCliffX nearCliffY anotherTempVar immediateTempVar color(0xFFFFFFDD)
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