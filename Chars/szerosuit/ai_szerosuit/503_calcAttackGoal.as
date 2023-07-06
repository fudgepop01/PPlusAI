#snippet MOVE_CALC_MODIFIERS
  $ifLastOrigin(dsmash,false)
    if Equal IsOnStage 1
      if Equal currGoal cg_edgeguard && !(Equal OCurrAction hex(0x45)) && OYDistBackEdge > -25
        rollWeight += 450
      else
        rollWeight += 80
      endif
    endif
  endif
#endsnippet