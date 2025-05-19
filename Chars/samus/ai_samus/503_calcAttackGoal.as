#snippet ADDITIONAL_FILTERS
  GetLaBasic anotherTempVar hex(0x41) fromSelf
  if anotherTempVar < 6
    $ifLastOrigin(nspecialair,false)
      lastAttack = -1
    $elifLastAttack(nspecial_full)
      lastAttack = -1
    endif
  $elifLastAttack(nspecial)
    lastAttack = -1
  endif
  $ifLastAttack(sspeciaair)
    if YSpeed >= 0
      lastAttack = -1
    endif
  endif

  if currGoal >= cg_edgeguard
    $ifLastList(uspecial;uspecialair,if)
      lastAttack = -1
    endif
  endif
#endsnippet