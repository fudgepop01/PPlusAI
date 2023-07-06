#snippet SKIP_CHECKS
  $ifLastOrigin(sspecialAir,false)
    Goto sspecialCheck 
  endif
  if !(True)
    label sspecialCheck
    anotherTempVar = OPos * 30
    GetYDistFloorOffset immediateTempVar anotherTempVar 5 0
    if immediateTempVar < 0
      Seek finish
      Jump
    endif
    Return
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 5 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet FTILT_2
  if Equal CurrSubaction hex(0x50) && ActionTimer <= 15
    Button A
  endif
#endsnippet

#snippet FTILT_3
  if Equal CurrSubaction hex(0x50)
    Button A
  endif
#endsnippet

#snippet SSPECIAL
  Seek sspecial_mid
  Jump
#endsnippet

#snippet SSPECIAL_MID
  PredictOMov immediateTempVar mov_jump
  if Equal CurrSubaction hex(0x1e6) && AnimFrame >= 4 && Rnd <= 0.8 && immediateTempVar >= 0.65 && XDistLE 25
    Button X
  endif
#endsnippet

#snippet SSPECIAL_JUMP
  if Equal CurrSubaction hex(0x1e6) && AnimFrame >= 4 && Rnd <= 0.8
    Button X
  endif
#endsnippet
