#snippet COMBO_ROUTINES
  if CurrAction > hex(0x20) && CurrAction <= hex(0x34)
    if OKBSpeed > 3
      Button B
      AbsStick 0 (-1)
      $setLastAttack(dspecial)
      Call ExecuteAttack
    else
      DynamicDiceClear dslot0
      if CurrAction <= hex(0x26)
        $addToDice(0, ftilt, 1)
        $addToDice(0, utilt, 1)
        $addToDice(0, dtilt, 1)
      endif
      if CurrAction <= hex(0x29)
        $addToDice(0, fsmash, 1)
        $addToDice(0, usmash, 1)
        $addToDice(0, dsmash, 1)
      endif
      if CurrAction > hex(0x29)
        Button B
        ClearStick
        $setLastAttack(asc)
        Call ExecuteAttack
      endif
      $addToDice(0, sspecial, 1)
    endif
  endif
#endsnippet