#snippet SSPECIAL
  immediateTempVar = TopNY - OTopNY 
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 30
    AbsStick OPos (-1)
  elif immediateTempVar >= 0 && XDistLE 20
    AbsStick OPos (-1)
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

#snippet NSPECIAL
  immediateTempVar = Direction * TopNX
  if Equal CurrAction hex(0x11b) 
    if immediateTempVar > 0
      Button A
    else
      Stick -1
    endif
  endif
#endsnippet

#snippet NSPECIALAIR
  if Equal AirGroundState 1
    Seek nspecial
    Jump
  endif
  if Equal CurrAction hex(0x121) 
    Button A
  endif
#endsnippet