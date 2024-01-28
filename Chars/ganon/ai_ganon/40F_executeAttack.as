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
      Seek finish
      Jump
    endif
    Return
  endif

  if Equal CurrAction hex(0x112) && Equal AirGroundState 2
    Seek execGeneral
    Jump
  endif
#endsnippet