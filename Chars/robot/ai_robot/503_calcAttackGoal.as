#snippet ADDITIONAL_FILTERS
  GetLaBasic anotherTempVar hex(0x4B) fromSelf
  if anotherTempVar <= 0
    $ifLastOrigin(uspecialair,false)
      lastAttack = -1
    $ifLastOrigin(sspecialair,true)
      lastAttack = -1
    endif
  endif
  GetLaBit anotherTempVar hex(0x4) fromSelf
  $ifLastOrigin(nspecialair,false)
    if anotherTempVar < 100
      lastAttack = -1
    endif
  endif

  GetLaBit anotherTempVar hex(0x3) fromSelf
  if anotherTempVar >= 1
    $ifLastAttack(nspecialair_laser)
      lastAttack = -1
    endif
  $elifLastAttack(nspecialair_lasermax)
    lastAttack = -1
  endif

  $ifLastOrigin(uspecialair,false)
    anotherTempVar = OTopNY - TopNY
    if anotherTempVar < 40
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet COMBO_ROUTINES
  if Equal CurrAction hex(0x113) || Equal CurrAction hex(0x118)
    DynamicDiceClear dslot0
    $addToDice(0, nair, 1)
    $addToDice(0, fair, 1)
    $addToDice(0, dair, 1)
    $addToDice(0, bair, 1)
    $addToDice(0, uair, 1)
  endif 
#endsnippet