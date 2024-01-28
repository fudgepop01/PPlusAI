#snippet ADDITIONAL_FILTERS
  GetLaBit anotherTempVar hex(0x71) fromSelf 
  GetLaBit immediateTempVar hex(0x3D) fromSelf 
  if anotherTempVar >= true || immediateTempVar >= true
    $ifLastOrigin(sspecial,false)
      lastAttack = -1
    $ifLastOrigin(sspecialair,true)
      if NumJumps > 2
        lastAttack = -1
      endif
    endif
  endif

  anotherTempVar = OTopNX - TopNX
  Abs anotherTempVar 
  $ifLastOrigin(sspecial,false)
    if Rnd < 0.75 || anotherTempVar < 30
      lastAttack = -1
    endif
  $ifLastOrigin(sspecialair,true)
    if Rnd < 0.75 || anotherTempVar < 30
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet COMBO_ROUTINES
  if Equal CurrAction hex(0x85)
    DynamicDiceClear dslot0
    $addToDice(0, nair, 1)
    $addToDice(0, fair, 1)
    $addToDice(0, dair, 1)
    $addToDice(0, bair, 1)
    $addToDice(0, uair, 1)
  endif 
#endsnippet