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
  globTempVar = nearCliffX * -1
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