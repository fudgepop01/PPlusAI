#snippet SKIP_EXEC
  $ifLastAttack(sspecialair)
    Seek sspecialair
    Return
  endif

  $ifAerialAttack()
    if Equal scriptVariant sv_execute_hardfall
      label
      MOD immediateTempVar AnimFrame 2
      if Equal immediateTempVar 0
        Button X
      endif
      AbsStick OPos
      if Equal CurrAction hex(0xC) && AnimFrame >= 1
      else
        Return
      endif
    elif Equal scriptVariant sv_execute_rising
      label
      MOD immediateTempVar AnimFrame 2
      if Equal immediateTempVar 0
        Button X
      endif
      AbsStick OPos
      if Equal CurrAction hex(0xC)
      else
        Return
      endif
    endif
  endif
  ClearStick
#endsnippet

#snippet COMMON_EXTENSION
  if Equal scriptVariant sv_execute_hardfall && YSpeed <= 0
    AbsStick 0 (-1)
  elif Equal scriptVariant sv_execute_rising
    Button X
  endif
#endsnippet

#snippet NSPECIAL_CHARGE
  if !(ODistLE 60) 
    Button B
  endif
#endsnippet

#snippet DSPECIAL
  if Equal CurrSubaction hex(0x1e4) && FramesHitlag <= 0 
    Button X
    scriptVariant = sv_wavedash_in
    CallI Wavedash
  endif
#endsnippet

#snippet DSPECIALAIR
  if Equal CurrSubaction hex(0x1e8)
    Button X
  endif
#endsnippet

#snippet SSPECIALAIR
  ClearStick
  AbsStick OPos
  Seek sspecialair
  if !(Equal CurrSubaction hex(0x1d7)) && Equal AirGroundState 2
    if !(Equal CurrSubaction JumpSquat) && AnimFrame >= 12 && Rnd < 0.8
      ClearStick
      Button B
      AbsStick OPos 0
    endif
    Return
  endif
#endsnippet

#snippet DSMASH2
  if AnimFrame >= 8 && Equal CurrSubaction hex(0x60)
    Button A
  endif
#endsnippet

#snippet DSMASH2_STRONG
  if AnimFrame >= 8 && Equal CurrSubaction hex(0x60)
    Button A
  endif
#endsnippet

#snippet JAB123_2
  if AnimFrame >= 3 && Equal CurrSubaction hex(0x48)
    Button A
  endif
#endsnippet