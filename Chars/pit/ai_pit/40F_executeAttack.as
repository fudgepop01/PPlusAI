#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 10 && Rnd <= 0.6
    Button A
  endif
#endsnippet