#snippet FILTER_CHECKS
  if Equal CurrAction hex(0x11e) && YDistFloor < 35
    $ifLastOrigin(nair,false)
      move_IASA = 4
    $ifLastOrigin(fair,true)
      move_IASA = 4
    $ifLastOrigin(dair,true)
      move_IASA = 4
    $ifLastOrigin(bair,true)
      move_IASA = 4
    $ifLastOrigin(uair,true)
      move_IASA = 4
    endif
  endif 
#endsnippet

#snippet ADDITIONAL_FILTERS
  GetLaBit immediateTempVar 62 fromSelf
  $ifLastAttack(hover)
    if immediateTempVar > 0
      lastAttack = -1
    endif 
  endif
  if Equal CurrAction hex(0x11e)
    $ifAerialAttack()
    else
      lastAttack = -1
    endif
  endif
#endsnippet