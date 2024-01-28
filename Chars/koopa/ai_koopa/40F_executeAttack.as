#snippet JAB123_2
  if AnimFrame > 3 
    Button A
  endif
#endsnippet

#snippet DTILT_2
  if AnimFrame >= 8
    Button A
  endif
#endsnippet

#snippet SSPECIAL_THROWB
  ClearStick
  if Equal CurrSubaction hex(0x1de)
    Stick (-1)
    Button A
    lastAttack = -1
    Seek finish
    Return
  endif
#endsnippet

#snippet SSPECIAL_THROWF
  ClearStick
  if Equal CurrSubaction hex(0x1de)
    Stick 1
    Button A
    lastAttack = -1
    Seek finish
    Return
  endif
#endsnippet

#snippet SSPECIAL_THROWLW
  ClearStick
  if Equal CurrSubaction hex(0x1de)
    Stick 0 (-1)
    Button A
    lastAttack = -1
    Seek finish
    Return
  endif
#endsnippet

#snippet SSPECIALAIR_THROWLW
  ClearStick
  if Equal CurrSubaction hex(0x1d9)
    Stick 0 (-1)
    Button A
    lastAttack = -1
    Seek finish
    Return
  endif
#endsnippet