#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x11e)
    immediateTempVar = 1
    Return
  endif
#endsnippet

#snippet NAVIGATION_OVERRIDE
  if Equal CurrAction hex(0x11e) && currGoal >= cg_attack
    anotherTempVar = goalX - TopNX
    AbsStick anotherTempVar
    if Rnd < 0.98
      Button X
    endif
    Return
  endif
#endsnippet