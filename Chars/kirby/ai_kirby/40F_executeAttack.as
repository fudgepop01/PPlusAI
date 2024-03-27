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
  if Equal Direction OPos
    Stick 1 (-1)
  endif
#endsnippet

#snippet USPECIALAIR
  Button B
  if Equal Direction OPos
    Stick 1 (-1)
  endif
#endsnippet

#snippet USPECIAL_PROJ
  if Equal CurrAction hex(0x114)
    ClearStick 0
    Seek uspecial_proj
    Return
  endif
#endsnippet