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