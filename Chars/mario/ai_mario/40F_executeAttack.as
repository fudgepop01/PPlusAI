#snippet DSPECIAL
  ClearStick
  AbsStick OPos
  MOD immediateTempVar AnimFrame 3
  if OYDistFloor > 5 && immediateTempVar <= 1
    Button B
  endif
  if AnimFrame > 50
    Seek finish
    Jump
  endif 
#endsnippet

#snippet DSPECIALHIT
  ClearStick
  AbsStick OPos
  MOD immediateTempVar AnimFrame 3
  if OYDistFloor > 5 && immediateTempVar <= 1
    Button B
  endif
  if AnimFrame > 50
    Seek finish
    Jump
  endif 
#endsnippet

#snippet USPECIAL
  Seek finish
  Jump
#endsnippet

#snippet USPECIALAIR
  Seek finish
  Jump
#endsnippet