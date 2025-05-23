#snippet SKIP_CHECKS
  $ifLastOrigin(sspecial,false)
    Goto sspecialCheck 
  $ifLastOrigin(sspecialAir,true)
    Goto sspecialCheck 
  endif
  if !(True)
    label sspecialCheck
    anotherTempVar = OPos * 80
    GetYDistFloorOffset immediateTempVar anotherTempVar 5 0
    if immediateTempVar < 0
      Seek finish
      Jump
    endif
    Return
  endif
#endsnippet

#snippet DSPECIAL
  if ActionTimer >= 6
    Button X
    AbsStick OPos
    Seek finish
    Return
  endif
#endsnippet

#snippet DSPECIALAIR
  if ActionTimer >= 6
    AbsStick OPos
    Button X
    Seek finish
    Jump
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
    if ActionTimer >= 6 && Rnd <= techSkill && Equal IsOnStage 1 && Equal AirGroundState 2
      scriptVariant = sv_execute_fastfall
    endif
  endif
#endsnippet