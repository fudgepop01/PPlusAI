#snippet JAB1232
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB1233
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 8 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 11 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet FSMASH2
  if AnimFrame >= 10
    Button A
  endif
#endsnippet

#snippet SSPECIAL
  immediateTempVar = TopNY - OTopNY
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 30
    AbsStick OPos (-1)
  elif immediateTempVar >= 0 && XDistLE 20
    AbsStick OPos (0.6)
  endif
#endsnippet

#snippet SSPECIALAIR
  immediateTempVar = TopNY - OTopNY 
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 30
    AbsStick OPos (-1)
  elif immediateTempVar >= 0 && XDistLE 20
    AbsStick OPos (-1)
  endif
#endsnippet