#snippet SFALL_ACTIONS
  if Equal CurrAction hex(0x10) 
#endsnippet
#snippet USPECIAL_ACTIONS
  elif Equal CurrAction hex(0x114)
#endsnippet
#snippet NSPECIAL_ACTIONS
  elif Equal CurrAction hex(0x112)
#endsnippet
#snippet SSPECIAL_ACTIONS
  elif Equal CurrAction hex(0x113)
#endsnippet
#snippet DSPECIAL_ACTIONS
  elif Equal CurrAction hex(0x115)
#endsnippet

#snippet LEDGE_REFRESH
  if nearCliffY < -ledgeRefreshDist && YSpeed < 0
    if NumJumps > 0
      Button X
      Return 
    else
      approachType = 0
      Return
    endif
  else
    Return
  endif
#endsnippet

#snippet PRE_RECOVERY_CHECKS
  if Equal CurrAction hex(0x10)
    Seek handleSFall
    Jump
  endif
#endsnippet

#snippet NSPECIAL
  $makeRecovery(nspecial)
#endsnippet

#snippet SSPECIAL
  $makeRecovery(sspecial)
#endsnippet

#snippet USPECIAL
  $makeRecovery(uspecial)
#endsnippet

#snippet DSPECIAL
  $makeRecovery(dspecial)
#endsnippet

#snippet SFALL
  globTempVar = nearCliffX * -1
  AbsStick globTempVar
#endsnippet

#snippet JUMP_TO_STAGE
  SetFrame 0
  label
  if CanJump && CurrAction <= hex(0x10)
    Button X
  endif

  globTempVar = nearCliffX * -1
  AbsStick globTempVar

  if Equal IsOnStage 1 || FrameGE 30 || FramesHitstun > 0
    Call AIHub
  elif FrameGE 2 && YSpeed < 0
    Call AIHub
  elif FrameGE 20 && !(MeteoChance)
    Call AIHub
  endif
#endsnippet

////// FOR USE IN FUNCTIONS //////

#snippet COMMON_RECOVERY_BASE
  
  if Equal isBelowStage 0 && nearCliffY > 0
    GetRndPointOnStage nearCliffX
    globTempVar = nearCliffX - TopNX
    AbsStick globTempVar
    LOGSTR str("here")
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet