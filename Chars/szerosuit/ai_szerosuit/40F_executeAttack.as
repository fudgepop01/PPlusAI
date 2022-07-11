#snippet JAB1232
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB1233
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 6 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet DSPECIAL
  if Equal CurrSubaction hex(0x1E4) && AnimFrame >= 9
    Button A
  endif
#endsnippet

#snippet DSPECIALAIR
  if Equal CurrSubaction hex(0x1E4) && AnimFrame >= 9
    Button A
  endif
#endsnippet

#snippet NSPECIAL
  Button B
#endsnippet