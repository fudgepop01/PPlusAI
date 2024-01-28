#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 6 && Rnd <= 0.8
    Button A
  endif
#endsnippet

#snippet JAB123_3
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 6 && Rnd <= 0.8
    Button A
  elif Equal CurrSubaction hex(0x49) && AnimFrame >= 9 && Rnd <= 0.6
    Button A
  endif
#endsnippet

#snippet SSPECIAL
  immediateTempVar = TopNY - OTopNY
  if !(XDistLE 10 40)
    Button B
  endif
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
  if !(XDistLE 10 40)
    Button B
  endif
  if immediateTempVar < -20
    AbsStick OPos 1
  elif immediateTempVar > 30
    AbsStick OPos (-1)
  elif immediateTempVar >= 0 && XDistLE 20
    AbsStick OPos (-1)
  endif
#endsnippet

#snippet NSPECIALAIR
  if Equal AirGroundState 1
    Seek nspecial
    Jump
  endif
  if CurrAction >= hex(0x100)
    #const chargeLen = 50
    #const xMin = 35
    #const xMax = 300
    #const distPerFrame = 5.3

    immediateTempVar = TopNX - OTopNX
    Abs immediateTempVar

    anotherTempVar = 0.1 * immediateTempVar
    EstOYCoord anotherTempVar anotherTempVar
    anotherTempVar += 5
    anotherTempVar -= TopNY

    globTempVar = xMin + ActionTimer * distPerFrame 
    if immediateTempVar < globTempVar && anotherTempVar < 10
    elif Equal CurrSubaction hex(0x1cf) || Equal CurrSubaction hex(0x1d2) || YDistFloor < 0
      if Rnd < 0.02 || XDistLE 25
      else
        Button B
      endif
    else
      Button B
    endif
  endif
#endsnippet

#snippet NSPECIAL
  if Equal AirGroundState 2
    Seek nspecialair
    Jump
  endif
  if CurrAction >= hex(0x100)
    #const chargeLen = 50
    #const xMin = 35
    #const xMax = 300
    #const distPerFrame = 5.3

    immediateTempVar = TopNX - OTopNX
    Abs immediateTempVar

    anotherTempVar = 0.1 * immediateTempVar
    EstOYCoord anotherTempVar anotherTempVar
    anotherTempVar += 5
    anotherTempVar -= TopNY
    Abs anotherTempVar

    globTempVar = xMin + ActionTimer * distPerFrame 
    if immediateTempVar < globTempVar && anotherTempVar < 10
    elif Equal CurrSubaction hex(0x1cf) || Equal CurrSubaction hex(0x1d2)
      if Rnd < 0.02 || XDistLE 25
      else
        Button B
      endif
    else
      Button B
    endif
  endif
#endsnippet