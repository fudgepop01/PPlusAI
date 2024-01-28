#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x115) && ActionTimer > 5
    Button X
    if Equal AirGroundState 1
      scriptVariant = sv_wavedash_awayFromLedge
      Call Wavedash
    endif
    Return
  endif
#endsnippet