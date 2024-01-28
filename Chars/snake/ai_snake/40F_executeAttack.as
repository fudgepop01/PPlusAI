#snippet SKIP_CHECKS
  if Equal CurrAction hex(0x117) || Equal CurrAction hex(0x118)
    Seek execGeneral
    Jump
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 5 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 5 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 5 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet FTILT_2
  if Equal CurrSubaction hex(0x50) && AnimFrame >= 3 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet FSMASH_2
  if Equal CurrSubaction hex(0x58) && AnimFrame >= 17 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet USMASH
  if Equal CurrAction hex(0x30) || Equal CurrAction hex(0x32)
    anotherTempVar = OTopNX - TopNX
    anotherTempVar /= 31.900
    AbsStick anotherTempVar
  endif
#endsnippet

#snippet USPECIAL
  if AnimFrame >= 6
    AbsStick 0 -1
    Seek finish
    Jump
  else
    AbsStick OPos
  endif
#endsnippet

#snippet NSPECIAL
  if Equal CurrAction hex(0x112) && AnimFrame > 20
    PredictOMov anotherTempVar mov_attack
    if anotherTempVar > 0.12 && XDistLE 35
      Button R|B
    elif XDistLE 45
      anotherTempVar = OTopNY - TopNY
      if anotherTempVar > 15
        AbsStick 0 0.5
      else 
        AbsStick 0 -0.5
      endif
    elif !(XDistLE 80)
      AbsStick OPos 0
    endif
  elif Equal CurrAction hex(0x1A)
    CallI Shield
  endif
#endsnippet

#snippet NSPECIALAIR 
  Seek nspecial
  Jump
#endsnippet

#snippet SSPECIAL
  if NoOpponent
    Button R
  endif
#endsnippet