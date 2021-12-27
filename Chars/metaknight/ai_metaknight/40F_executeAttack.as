#snippet FTILT2
  if Equal CurrSubaction hex(0x50) && AnimFrame >= 8 && Rnd <= 0.8
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

#snippet DSPECIAL
  if Equal CurrAction hex(0x115) || Equal CurrAction hex(0x11b) || Equal CurrAction hex(0x11c)
    immediateTempVar = goalX - TopNX
    globTempVar = TopNY - goalY
    Norm anotherTempVar immediateTempVar globTempVar

    if anotherTempVar < 3
      Button A
    endif

    immediateTempVar = immediateTempVar / anotherTempVar
    globTempVar = globTempVar / anotherTempVar
    AbsStick immediateTempVar globTempVar

    Button B
  endif
#endsnippet

#snippet DSPECIALAIR
  if Equal CurrAction hex(0x115)
    immediateTempVar = TopNX - goalX
    globTempVar = TopNY - goalY
    Norm anotherTempVar immediateTempVar globTempVar

    if anotherTempVar < 10
      Button A
    endif

    immediateTempVar = goalX / anotherTempVar
    globTempVar = goalY / anotherTempVar
    AbsStick immediateTempVar globTempVar

    Button B
  endif
#endsnippet