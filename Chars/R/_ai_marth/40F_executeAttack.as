#snippet JAB1232
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB1233
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 8 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet FTILT3
  if Equal CurrSubaction hex(0x50) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x51) && AnimFrame >= 7 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet DAIR
  Stick 0 (-1)
#endsnippet