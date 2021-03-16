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

#snippet DEFAULT_RECOVERY_CHECKS
  if nearCliffY > 0
    {ABOVE_LEDGE}
  elif True
    #let YDist = var3
    if LevelValue >= LV6
      globTempVar = OTopNY - 10 
      if Equal approachType at_edgeguard && TopNY < globTempVar
        YDist = -maxYEdgeDistJumpNoUpB 
      elif Equal hasTriedToUpB 1
        YDist = -maxYEdgeDistJumpNoUpB
      elif NoOneHanging
        YDist = -maxYEdgeDist
      else
        YDist = -maxYEdgeDist + 10
      endif
    else
      YDist = 10
    endif
    
    {BELOW_LEDGE}
  endif
#endsnippet

#snippet ABOVE_LEDGE
  if LevelValue < LV6 && NumJumps > 0 && YSpeed < 0 && nearCliffY < 20
    Button X
    Seek handleJumpToStage
  elif LevelValue < LV6 && Equal NumJumps 0 && nearCliffY < 20 && FramesHitstun < 1 
    Button B
    Stick 0 0.6
    hasTriedToUpB = 1
    Return  
  endif
#endsnippet

#snippet BELOW_LEDGE
  LOGVAL YDist
  globTempVar = nearCliffX 
  Abs globTempVar
  if globTempVar < 2 && nearCliffY >= -10 && Rnd < 0.1 && CanJump
    Button X
    Seek handleJumpToStage
    Jump
  {BEFORE_BELOW_RECOVER_OPTIONS}
  endif
#endsnippet

#snippet BEFORE_BELOW_RECOVER_OPTIONS
  elif nearCliffY <= YDist
    if NumJumps > 0 
      if Equal hasTriedToUpB 1 || nearCliffY <= -maxYEdgeDistWithJump
        Button X
        Seek handleJumpToStage
        Jump
      endif
    endif
    Button B
    Stick 0 0.6
    hasTriedToUpB = 1
    Return
  else
    Call AIHub
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
  else
    globTempVar = nearCliffX * -1
    AbsStick globTempVar
  endif
#endsnippet