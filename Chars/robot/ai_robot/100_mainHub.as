#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x113) || Equal CurrAction hex(0x118)
    immediateTempVar = 1
    Return
  endif
#endsnippet