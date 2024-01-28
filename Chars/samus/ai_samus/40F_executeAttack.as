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
    if XDistLE 50
      anotherTempVar = OTopNY - TopNY
      if anotherTempVar < 20
        Button B
      else
        Button R
      endif 
    endif
  endif
#endsnippet