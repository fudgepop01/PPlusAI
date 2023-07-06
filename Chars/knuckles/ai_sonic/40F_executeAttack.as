#snippet SSPECIALAIR
  Stick 1
  MOD immediateTempVar AnimFrame 2
  if !(Equal CurrSubaction hex(0x1cf))
    if Equal immediateTempVar 1 
      Button B
    endif
    Return
  endif
  label
#endsnippet