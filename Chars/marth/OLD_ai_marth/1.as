#snippet SKIP_DASHDANCE_CONDITIONS
#endsnippet

#snippet BEGINNING_CHECKS
  if Equal CurrAction hex(0x114)
    Call RecoveryHub
  endif

  if OYSpeed < 0 && OYDistBackEdge > -5 && Equal OCurrAction hex(0x49)
    Call AIHub
  endif
#endsnippet

#snippet MIX_DOUBLEJUMP_SECTION
#endsnippet

#snippet ADDITIONAL_MIXUPS
#endsnippet

#snippet ADDITIONAL_YDIST_CHECKS
#endsnippet

#snippet ADDITIONAL_IDLE_HOOK
#endsnippet