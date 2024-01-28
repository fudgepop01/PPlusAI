#snippet ISACTIONABLE_OVERRIDE
  if Equal CurrAction hex(0x120)
    immediateTempVar = 1
    Return
  endif
#endsnippet

#snippet NAVIGATION_OVERRIDE
  if Equal CurrAction hex(0x120) && currGoal >= cg_attack
    anotherTempVar = goalX - TopNX
    anotherTempVar *= 0.1
    globTempVar = goalY - TopNY
    globTempVar *= 0.05
    ClearStick
    AbsStick anotherTempVar globTempVar
    if Rnd < 0.98
      Button X
    endif
    Return
  endif
#endsnippet