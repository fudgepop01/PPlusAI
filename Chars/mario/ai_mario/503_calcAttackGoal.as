#snippet ADDITIONAL_FILTERS
  if currGoal >= cg_edgeguard
    $ifLastOrigin(uspecialair,false)
      lastAttack = -1
    $ifLastOrigin(uspecial,true)
      lastAttack = -1
    endif
  endif
#endsnippet