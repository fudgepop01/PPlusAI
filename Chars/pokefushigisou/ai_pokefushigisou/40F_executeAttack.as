#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet SKIP_CHECKS
  $ifLastOrigin(nspecialair,false)
    Goto nspecialCheck 
  endif
  if !(True)
    label nspecialCheck
    if YDistFloor < 0
      Seek finish
      Jump
    endif
    Return
  endif
#endsnippet

#snippet DSPECIAL
  immediateTempVar = OTopNX - TopNX
  // 1 / 55
  immediateTempVar *= 0.018182
  AbsStick immediateTempVar
#endsnippet

#snippet DSPECIALAIR
  Seek dspecial
  Jump
#endsnippet

#snippet NSPECIAL
  if NoOpponent || !(XDistLE 55)
    Button B
  endif
#endsnippet