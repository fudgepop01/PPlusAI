#snippet ADDITIONAL_FILTERS
  if currGoal >= cg_edgeguard
    $ifLastList(nspecial;nspecialair;sspecialair,if)
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet COMBO_ROUTINES
  if Equal CurrAction hex(0x113) && ActionTimer >= 6
    DynamicDiceClear dslot0
    $addToDice(0, nair, 1)
    $addToDice(0, fair, 1)
    $addToDice(0, dair, 1)
    $addToDice(0, bair, 1)
    $addToDice(0, uair, 1)
  endif 
#endsnippet