#snippet DSPECIAL
  if AnimFrame >= 6
    Button X
    Seek finish
    Return
  endif
#endsnippet

#snippet DSPECIALAIR
  if AnimFrame >= 6
    Button X
    CallI MainHub
  endif
#endsnippet

#snippet SKIP_EXEC
  $ifLastAttack(nspecialair)
    Seek nspecialair
    Jump
  endif
#endsnippet

#snippet NSPECIAL
  if !(ODistLE 70) && AnimFrame > 3 && Equal CurrSubaction hex(0x1cf)
    Button B
  endif
#endsnippet

#snippet NSPECIALAIR
  ClearStick
  AbsStick OPos
  Seek nspecialair
  if !(Equal CurrSubaction hex(0x1d2)) && Equal AirGroundState 2
    if !(Equal CurrSubaction JumpSquat) && AnimFrame >= 6 && Rnd < 0.8
      ClearStick
      Button B
    endif
    Return
  elif True
    if AnimFrame >= 5 && Rnd <= techSkill && Equal IsOnStage 1 && Equal AirGroundState 2
      scriptVariant = sv_execute_fastfall
    endif
  endif
#endsnippet