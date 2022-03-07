#snippet SSPECIAL_THROWB
  if Equal CurrSubaction hex(0x1de)
    Stick (-1)
  endif
#endsnippet

#snippet SSPECIAL_THROWF
  if Equal CurrSubaction hex(0x1de)
    Stick 1
  endif
#endsnippet

#snippet SSPECIAL_THROWLW
  if Equal CurrSubaction hex(0x1de)
    Stick 0 (-1)
  endif
#endsnippet