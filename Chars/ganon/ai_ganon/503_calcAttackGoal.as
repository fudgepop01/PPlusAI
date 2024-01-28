#snippet ADDITIONAL_FILTERS
  GetLaBit anotherTempVar hex(0x10) fromSelf
  if anotherTempVar >= true
    $ifLastOrigin(nspecial,false)
      lastAttack = -1
    $ifLastOrigin(nspecialair,true)
      lastAttack = -1
    endif
  endif
  GetLaBasic anotherTempVar hex(0x5D) fromSelf
  if anotherTempVar >= 3
    move_IASA = 145
    move_damage = 1
  endif
#endsnippet

#snippet COMBO_ROUTINES
  if Equal CurrAction hex(0x112) && Equal AirGroundState 2
    DynamicDiceClear dslot0
    $addToDice(0, nair, 1)
    $addToDice(0, fair, 1)
    $addToDice(0, dair, 1)
    $addToDice(0, bair, 1)
    $addToDice(0, uair, 1)
  endif 
#endsnippet