#snippet ISACTIONABLE_OVERRIDE
  if CurrAction >= hex(0x24) && CurrAction <= hex(0x33) && Equal HitboxConnected 1
    immediateTempVar = 1

    $ifLastOrigin(sspecial,false)
    $ifLastOrigin(sspecialair,true)
    elif CurrAction > hex(0x29)
      immediateTempVar = 0
    $ifLastOrigin(fsmash,true)
    $ifLastOrigin(usmash,true)
    $ifLastOrigin(dsmash,true)
    elif CurrAction > hex(0x26)
      immediateTempVar = 0
    $ifLastOrigin(ftilt,true)
    $ifLastOrigin(utilt,true)
    $ifLastOrigin(dtilt,true)
    else
      immediateTempVar = 0
    endif
    Return
  endif
#endsnippet