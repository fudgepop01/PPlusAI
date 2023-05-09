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
#endsnippet