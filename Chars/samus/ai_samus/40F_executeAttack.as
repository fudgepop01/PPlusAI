#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 4 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 4 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 10 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet NSPECIAL 
  if Equal CurrAction hex(0x118)
    if XDistLE 30 && OYDistFloor > 0
      anotherTempVar = OTopNY - TopNY
      if anotherTempVar < 20 && Rnd < 0.25
        Button B
      else
        Button R
      endif 
    elif Rnd < 0.02
      if Rnd < 0.25
        Button B
      else
        Button R
      endif
    endif
    if YDistFloor < 0
      Button R
    endif 
  endif
#endsnippet

#snippet NSPECIALAIR
  Seek nspecial
  Jump
#endsnippet

#snippet SSPECIAL 
  #let timer = var3
  timer = 0
  globTempVar = TopNY - OTopNY
  Abs globTempVar
  if globTempVar > 10 || Rnd < 0.25
    timer = 12
  endif
  label sspecial_routine
    Goto PFC
    Seek sspecial_routine
    Stick 0.7
    timer -= 1
    if timer <= 0
      Button B
      if timer < -20
        Seek finish
      endif
    endif
  Return
#endsnippet

#snippet SSPECIALAIR
  Seek sspecial
  Jump
#endsnippet