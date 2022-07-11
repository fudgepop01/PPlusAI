#snippet ADDITIONAL_FILTERS
  $tempVar(lucAuraCount, immediateTempVar)
  GetLaFloat lucAuraCount hex(0x1b) 0
  if lucAuraCount < 65
    $ifLastAttack(sspecial_aura)
      lastAttack = -1
    $elifLastAttack(sspecialair_aura)
      lastAttack = -1
    endif
  endif
  $ifLastOrigin(sspecialair,false)
    if YSpeed < 0.8 && YDistFloor < 12
      lastAttack = -1
    endif
  endif
#endsnippet

#snippet POST_CHOICE_FILTER
  if CurrAction > hex(0x29) && Equal lastAttack -1
    Button B
    ClearStick
    $setLastAttack(asc)
    Call ExecuteAttack
  endif
#endsnippet

#snippet COMBO_ROUTINES
  LUC_CANCEL_CHECK(lucCanCancel, immediateTempVar)
  if CurrAction > hex(0x20) && CurrAction <= hex(0x34) && Equal lucCanCancel 1
    immediateTempVar = XSpeed - OKBXSpeed
    Abs immediateTempVar
    if Equal AirGroundState 1
      immediateTempVar -= 1
    endif
    if immediateTempVar > 1.8
      Button B
      AbsStick 0 (-1)
      $setLastAttack(dspecial)
      Call ExecuteAttack
    elif OKBYSpeed > 3.5 || OFramesHitstun > 40
      Button B
      ClearStick
      $setLastAttack(asc)
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
      if Equal AirGroundState 1
        $addToDice(0, sspecial, 1)
      else
        $addToDice(0, sspecialair, 1)
      endif
    endif
  endif
#endsnippet