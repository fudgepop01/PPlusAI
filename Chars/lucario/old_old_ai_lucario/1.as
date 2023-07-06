#snippet DEBUG_SKIP
  globTempVar = 0
  SAFE_INJECT_2 globTempVar
  if !(Equal globTempVar 0)
    Seek CallAttacks
    Jump
  endif
#endsnippet

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
  elif CanJump && Rnd <= 0.01 && lastAttack >= hex(0x6041) && lastAttack <= hex(0x604F) && Equal IsOnStage 1 && TopNY > OTopNY && OFramesHitstun < 1
    Call mix_doubleJump
  elif CanJump && Rnd <= 0.01 && Equal lastAttack hex(0x8008) && TopNY > OTopNY && OFramesHitstun < 1
    Call mix_doubleJump
#endsnippet

#snippet ADDITIONAL_MIXUPS
#endsnippet

#snippet ADDITIONAL_YDIST_CHECKS
#endsnippet

#snippet ADDITIONAL_IDLE_HOOK
#endsnippet