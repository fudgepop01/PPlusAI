#snippet ADDITIONAL_FILTERS
  GetLaBit anotherTempVar hex(0x10) fromSelf
  if anotherTempVar >= true
    $ifLastOrigin(nspecial,false)
      lastAttack = -1
    $ifLastOrigin(nspecialair,true)
      lastAttack = -1
    endif
  endif
  $ifLastOrigin(sspecial,false)
    Goto checkOInCombo
    GetLaBasic anotherTempVar hex(0x5D) fromSelf
    if OCurrAction >= hex(0x5C) && OCurrAction <= hex(0x5E)
      lastAttack = -1
    elif immediateTempVar > 0
      lastAttack = -1
    elif anotherTempVar >= 3
      move_IASA = 145
      move_damage = 1
    endif
  endif
#endsnippet

#snippet COMBO_ROUTINES
  GetLaBasic anotherTempVar hex(0x5D) fromSelf
  if NoOpponent && anotherTempVar > 0
    DynamicDiceClear dslot0
    $addToDice(0, sspecial, 1)
  elif Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
    DynamicDiceClear dslot0
    $addToDice(0, nair, 1)
    $addToDice(0, fair, 1)
    $addToDice(0, dair, 1)
    $addToDice(0, bair, 1)
    $addToDice(0, uair, 1)
  endif 
#endsnippet