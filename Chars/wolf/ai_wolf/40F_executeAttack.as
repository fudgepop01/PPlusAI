#snippet DSPECIAL
  if AnimFrame >= 6
    Button X
    scriptVariant = sv_wavedash_in
    CallI Wavedash
  endif
#endsnippet

#snippet DSPECIALAIR
  if AnimFrame >= 6
    Button X
  endif
#endsnippet

#snippet SKIP_EXEC
  $ifLastAttack(nspecialair)
    Seek nspecialair
    Return
  endif
#endsnippet

#snippet SSPECIALAIR
  if Equal CurrAction hex(0x113)
    immediateTempVar = TopNY - OTopNY 
    if immediateTempVar < -20
      AbsStick OPos 1
    elif immediateTempVar > 30
      AbsStick OPos (-1)
    elif immediateTempVar >= 0 && XDistLE 20
      AbsStick OPos (-1)
    endif

    if Equal CurrSubaction hex(0x1d4) 
      immediateTempVar = TopNX - goalX
      if Direction > 0 && immediateTempVar < 0
        Button B
      elif Direction < 0 && immediateTempVar > 0
        Button B
      endif
      Abs immediateTempVar
      if Equal AnimFrame 0 && immediateTempVar < 20
        Button B
      elif immediateTempVar > 20 && immediateTempVar < 50 && Rnd < techSkill && AnimFrame >= 1
        Button B
      endif
    endif
  endif
#endsnippet

#snippet SSPECIAL
  if Equal CurrAction hex(0x113)
    immediateTempVar = TopNY - OTopNY 
    if immediateTempVar < -20
      AbsStick OPos 1
    elif immediateTempVar > 30
      AbsStick OPos (-1)
    elif immediateTempVar >= 0 && XDistLE 20
      AbsStick OPos (-1)
    endif

    if Equal CurrSubaction hex(0x1d4) 
      immediateTempVar = TopNX - goalX
      if Direction > 0 && immediateTempVar < 0
        Button B
      elif Direction < 0 && immediateTempVar > 0
        Button B
      endif
      Abs immediateTempVar
      if Equal AnimFrame 0 && immediateTempVar < 20
        Button B
      elif immediateTempVar > 20 && immediateTempVar < 50 && Rnd < techSkill && AnimFrame >= 1
        Button B
      endif
    endif
  endif
#endsnippet


#snippet NSPECIALAIR
  ClearStick
  AbsStick OPos
  Seek nspecialair
  if !(Equal CurrSubaction hex(0x1cf)) 
    if !(Equal CurrSubaction JumpSquat) && AnimFrame >= 5 && Rnd < 0.8
      ClearStick
      Button B
    endif
    Return
  elif True
    if AnimFrame >= 13
      scriptVariant = sv_execute_fastfall
    endif
    if AnimFrame >= 14 && Equal IsOnStage 1 && Equal AirGroundState 2 && YDistBackEdge > -15 && Rnd <= techSkill
      scriptVariant = sv_wavedash_in
      if currGoal < cg_attack 
        scriptVariant = sv_wavedash_out
      endif
      CallI Wavedash
    endif
  endif
#endsnippet