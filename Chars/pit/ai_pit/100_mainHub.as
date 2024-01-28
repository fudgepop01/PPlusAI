#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x85)
    currGoal = cg_attack_shieldPunish
    immediateTempVar = 1
    Return
  endif
#endsnippet