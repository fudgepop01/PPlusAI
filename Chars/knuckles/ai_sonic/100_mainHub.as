#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x113) && ActionTimer >= 6
    immediateTempVar = 1
    Return
  endif
#endsnippet