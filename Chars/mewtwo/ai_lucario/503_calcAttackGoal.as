#snippet FILTER_CHECKS
  if Equal CurrAction hex(0x120) && YDistFloor < 40
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
  if Equal CurrAction hex(0x120)
    $ifAerialAttack()
    else
      lastAttack = -1
    endif
  endif

  $ifLastAttack(hover)
    if NumJumps <= 0 || Equal CurrAction hex(0x120)
      lastAttack = -1
    endif
  endif
#endsnippet