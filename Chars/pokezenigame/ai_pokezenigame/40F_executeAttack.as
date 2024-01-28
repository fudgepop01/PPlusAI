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

#snippet SSPECIAL
  immediateTempVar = OPos * 30
  GetYDistFloorOffset immediateTempVar immediateTempVar 5 fromSelf
  if Equal CurrAction hex(0x119) && Equal AirGroundState 2 || immediateTempVar < 0
    Button B
  endif
#endsnippet

#snippet SSPECIALAIR
  Seek sspecial
  Jump
#endsnippet

#snippet NSPECIALAIR
  immediateTempVar = TopNY - OTopNY
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 30
    AbsStick OPos (-1)
  elif immediateTempVar >= 0 && XDistLE 20
    AbsStick OPos (0.6)
  endif
#endsnippet
