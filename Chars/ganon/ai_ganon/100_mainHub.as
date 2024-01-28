#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x112) && Equal AirGroundState 2
    immediateTempVar = 1
    Return
  endif
#endsnippet