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
  if CurrAction <= hex(0x20) && Equal AirGroundState 2
    if Rnd < 0.2
      scriptVariant = sv_execute_fastfall
    endif
    AbsStick OPos
    if Rnd < 0.4 && AnimFrame > 3
      ClearStick
      Button B
    endif
  endif
  if !(ODistLE 5) && AnimFrame > 3 && Equal CurrSubaction hex(0x1d2) && Equal IsOnStage 1 && Equal AirGroundState 2
    Button B
  endif
#endsnippet