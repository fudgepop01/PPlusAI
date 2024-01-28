// #snippet TURBO_ROUTINES
//   if CurrAction >= hex(0x24) && CurrAction <= hex(0x33)
//     if CurrAction <= hex(0x26)
//       $addOriginToDice(nair)
//     endif
//   endif
// #endsnippet

#snippet TURBO_ACTIONS
  if YDistBackEdge > -15 && Equal IsOnStage 0
    Button X
  endif
  skipMainInit = mainInitSkip
  currGoal = cg_attack_shieldPunish
  CallI MainHub
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
