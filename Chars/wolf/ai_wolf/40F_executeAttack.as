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

#snippet NSPECIALAIR
  ClearStick
  AbsStick OPos
  scriptVariant = sv_execute_fastfall
  if AnimFrame >= 15 && Equal CurrSubaction hex(0x1ce) && Equal IsOnStage 1 && Equal AirGroundState 2 && YDistBackEdge > -15
    scriptVariant = sv_wavedash_in
    CallI Wavedash
  endif
#endsnippet