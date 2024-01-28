#snippet SKIP_CHECKS
  if Equal CurrAction hex(0x113) || Equal CurrAction hex(0x118)
    Seek execGeneral
    Jump
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 9 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet NSPECIALAIR_LASER
  immediateTempVar = TopNY - OTopNY
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 30
    AbsStick OPos (-1)
  elif immediateTempVar >= 0 && XDistLE 20
    AbsStick OPos (0.6)
  endif
#endsnippet

#snippet NSPECIALAIR_LASERMAX
  Seek nspecialair_laser
  Jump
#endsnippet

#snippet USPECIAL
  immediateTempVar = TopNX - OTopNX
  globTempVar = TopNY - OTopNY
  Norm anotherTempVar immediateTempVar globTempVar
  Abs anotherTempVar

  if anotherTempVar <= 50
    Seek finish
    Jump
  endif
#endsnippet

#snippet SSPECIALAIR
  immediateTempVar = TopNX - OTopNX
  globTempVar = TopNY - OTopNY
  Norm anotherTempVar immediateTempVar globTempVar
  Abs anotherTempVar

  if anotherTempVar <= 60
    Seek finish
    Jump
  endif
#endsnippet