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
  if Equal CurrAction hex(0x11B) && Rnd < techSkill
    Button A
  endif
#endsnippet

#snippet SSPECIALAIR
  if Equal CurrAction hex(0x11B) && Rnd < techSkill
    Button A
  endif
#endsnippet

#snippet SSPECIAL_GRAB
  if Equal CurrAction hex(0x11E) && Rnd < techSkill
    Button A
  endif
#endsnippet

#snippet SSPECIALAIR_GRAB
  if Equal CurrAction hex(0x11E) && Rnd < techSkill
    Stick 0 1
  endif
#endsnippet