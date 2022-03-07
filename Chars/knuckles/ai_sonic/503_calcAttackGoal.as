#snippet ADDITIONAL_FILTERS
  $ifLastAttack(sspecialair)
    if YDistFloor < 10
      lastAttack = -1
    endif
  endif
#endsnippet