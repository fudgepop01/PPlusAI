// #snippet TURBO_ROUTINES
//   if CurrAction >= hex(0x24) && CurrAction <= hex(0x33)
//     if CurrAction <= hex(0x26)
//       $addOriginToDice(nair)
//     endif
//   endif
// #endsnippet

#snippet TURBO_ACTIONS
  $tempVar(canJumpCancel,immediateTempVar)
  if CurrAction >= hex(0x24) && CurrAction <= hex(0x33)
    canJumpCancel = 1
    if CurrAction <= hex(0x26)
      Stick 1
    elif CurrAction <= hex(0x29)
    elif CurrAction <= hex(0x32)
      canJumpCancel = 0
    endif
  endif
  IF_AERIAL_ATTACK(var11)
    if OKBYSpeed >= 2
      Button X
    endif
    Call ExecuteAttack
  $ifLastOrigin(dashattack,true)
  $ifLastOrigin(jab123,true)
  elif Equal AirGroundState 1
    CallI ExecuteAttack
  elif Equal IsOnStage 1
    Stick 0 -1
    skipMainInit = sm_execAttack
  endif
#endsnippet


#snippet TURBO_FILTERS
  IF_AERIAL_ATTACK(var11)
  endif
  if CurrAction >= hex(0x2A) && CurrAction <= hex(0x32) && Equal var11 1
    lastAttack = -1
    Return
  elif Equal var11 0 && YSpeed < 0
    lastAttack = -1
    Return  
  endif
#endsnippet
