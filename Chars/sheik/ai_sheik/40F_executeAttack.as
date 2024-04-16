#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 7 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet NSPECIAL 
  if Equal CurrAction hex(0x112) || Equal CurrAction hex(0x117) 
    if XDistLE 25
      anotherTempVar = OTopNY - TopNY
      if anotherTempVar < 15
      else
        Button R
      endif
    elif Rnd < 0.96
      if Rnd < 0.02
        Button R
      endif
      Button B
    endif
    if YDistFloor < 0
      Button R
    endif 
  endif
#endsnippet