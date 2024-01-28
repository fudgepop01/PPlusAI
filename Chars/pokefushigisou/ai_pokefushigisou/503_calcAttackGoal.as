#snippet ADDITIONAL_FILTERS
  GetLaFloat anotherTempVar hex(0x1B) fromSelf
  if anotherTempVar < 22 && !(XDistLE 65)
    Goto nspCheck
  elif NoOpponent && anotherTempVar >= 22
    Goto nspCheck
  endif

  if !(True)
    label nspCheck
      $ifLastAttack(nspecial)
        lastAttack = -1
      $elifLastAttack(nspecialair)
        lastAttack = -1
      endif
    Return 
  endif
#endsnippet

#snippet COMBO_ROUTINES
  if NoOpponent
    GetLaFloat anotherTempVar hex(0x1B) fromSelf
    if anotherTempVar < 22
      DynamicDiceClear dslot0
      $addToDice(0, nspecial, 1)
    endif
  endif
#endsnippet