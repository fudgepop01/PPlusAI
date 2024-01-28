#snippet SKIP_CHECKS
  $ifLastOrigin(sspecial,false)
    Goto sspecialCheck 
  $ifLastOrigin(sspecialAir,true)
    Goto sspecialCheck 
  endif
  if !(True)
    label sspecialCheck
    anotherTempVar = OPos * 45
    GetYDistFloorOffset immediateTempVar anotherTempVar 5 0
    if immediateTempVar < 0
      lastAttack = -1
      Return
    endif
    Return
  endif
#endsnippet

#snippet SSPECIAL
  Seek sspecialair
  Jump
#endsnippet

#snippet SSPECIALAIR
  if Equal CurrAction hex(0x11B) && Rnd < techSkill
    Button A
  endif
  if Equal CurrAction hex(0x124)
    Seek finish
    Jump
  endif
#endsnippet

#snippet SSPECIAL_GRAB
  Seek sspecialair_grab
  Jump
#endsnippet

#snippet SSPECIALAIR_GRAB
  if Equal CurrAction hex(0x11E) && Rnd < techSkill
    Stick 0 1
  endif
  if Equal CurrAction hex(0x124)
    Seek finish
    Jump
  endif
#endsnippet