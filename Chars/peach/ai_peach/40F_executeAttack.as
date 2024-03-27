#snippet SKIP_CHECKS
  $ifLastAttack(hover)
    Seek hover
    Jump
  elif Equal CurrAction hex(0x11e)
    Button X
    Seek execGeneral
    Jump
  endif
#endsnippet

#snippet COMMON_EXTENSION
  if Equal CurrAction hex(0x11e) && Equal CurrSubaction hex(0x1de)
    Button X
    Seek finish
    Jump
  elif Equal AirGroundState 2 && AnimFrame < 3 && Rnd < 0.4 
    Button X
  elif !(NoJumpPrevFrame)
    Button X
  endif
#endsnippet

#snippet HOVER
  immediateTempVar = TopNY - OTopNY
  Abs immediateTempVar
  if Equal CurrAction hex(0x11e)
    Button X
    skipMainInit = mainInitSkip
    lastAttack = -1
    if currGoal < cg_attack
      currGoal = cg_attack
    endif
    CallI MainHub
  elif Equal AirGroundState 2 && immediateTempVar < 25 && Rnd < 0.5 && YDistFloor > 3
    ClearStick
    Button X
    AbsStick 0 (-1)
  else
    Seek hover
    if !(NoJumpPrevFrame) || Equal AirGroundState 1 && NoJumpPrevFrame
      Button X
    endif
    Return
  endif
#endsnippet

#snippet JAB123_2
  if Equal CurrSubaction hex(0x48) && AnimFrame >= 4 && Rnd <= 0.8
    Button A
  endif
#endsnippet