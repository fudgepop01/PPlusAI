#snippet CAMP_MOVES
  if !(XDistLE 15)
    DynamicDiceClear dslot0
    $addToDice(1, nspecialair, 1)
    $addToDice(1, nspecial, 1)
    $addToDice(1, sspecialair, 2)
    $addToDice(1, sspecial, 2)
    $addToDice(1, dspecialair, 2)
    if !(XDistLE 40)
      $addToDice(1, dspecial, 2)
    endif
  endif
#endsnippet