#snippet ADDITIONAL_FILTERS
  $ifLastAttack(dspecialair)
    if Equal NumJumps 0
      lastAttack = -1
    endif
  $elifLastAttack(nspecial)
    lastAttack = -1
  endif
#endsnippet