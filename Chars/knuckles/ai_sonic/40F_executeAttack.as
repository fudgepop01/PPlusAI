#snippet SKIP_CHECKS
  if Equal CurrAction hex(0x113) && ActionTimer >= 6
    Seek execGeneral
    Jump
  endif
#endsnippet

#snippet SSPECIALAIR
  Stick 1
  if Equal CurrSubaction hex(0x1c) 
    if AnimFrame >= 8
      Seek _sspecial_dive
      Return
    endif
  elif ActionTimer >= 6
    if NumJumps > 0
      Button X
      Seek _sspecial_dive
      Return
    else
      Button B
    endif
  endif
  if Equal CurrAction hex(0xC)
    label _sspecial_dive
    Button B
  endif
#endsnippet

#snippet NSPECIAL
  AbsStick OPos
#endsnippet

#snippet NSPECIALAIR_DIG
  Button B
  AbsStick OPos
#endsnippet

#snippet DSPECIAL
  if Equal CurrAction hex(0x124)
    MOD anotherTempVar GameTimer 5
    globTempVar = 100 - ActionTimer
    globTempVar *= 0.01 
    if !(XDistLE 30) && anotherTempVar < 2 && Rnd < globTempVar
      Button B
    endif
  elif Equal CurrAction hex(0x11e)
    AbsStick OPos
    if Equal HitboxConnected 1 || XDistLE 30 && Rnd < 0.01 || YDistFloor < 0
      Button X
    endif
  elif Equal CurrAction hex(0x122)
    if AnimFrame > 8
      Button X
      Seek finish
      Jump
    endif
  endif
#endsnippet

#snippet DSPECIAL_AIR
  Seek dspecial
  Jump
endif