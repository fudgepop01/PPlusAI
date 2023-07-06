#snippet ADDITIONAL_FILTERS
  $tempVar(bowserCanFireball, immediateTempVar)
  GetLaFloat bowserCanFireball hex(0x13) 0
  if bowserCanFireball >= 50
    $ifLastAttack(nspecial)
      lastAttack = -1
    $elifLastAttack(nspecialair)
      lastAttack = -1
    endif
  endif
#endsnippet