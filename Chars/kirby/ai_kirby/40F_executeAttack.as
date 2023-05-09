#snippet SKIP_CHECKS
  $ifLastAttack(uspecial_proj)
    if YDistFloor < 0
      Seek finish
      Jump
    endif
  $elifLastAttack(uspecial)
    Goto uspecialCheck
  endif
  if !(True)
    label uspecialCheck
    anotherTempVar = OPos * 30
    GetYDistFloorOffset immediateTempVar anotherTempVar 5 0
    if immediateTempVar < 0
      Seek finish
      Jump
    endif
    Return
  endif
#endsnippet

#snippet DSPECIALAIR
  if AnimFrame >= 30 || YDistBackEdge > 0 || Equal HitboxConnected 1
    Button B
    Call MainHub
  endif
#endsnippet

#snippet USPECIAL
  Button B
  Stick 1 (-1)
#endsnippet

#snippet USPECIALAIR
  Button B
  Stick 1 (-1)
#endsnippet

#snippet USPECIAL_PROJ
  if Equal CurrAction hex(0x114)
    ClearStick 0
    Return
  endif
#endsnippet