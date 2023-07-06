#snippet SELF_Y_ADJUST
  $ifLastOrigin(sspecial,false)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(sspecial,false)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(sspecial,false)
  $ifLastOrigin(sspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet MOVE_IASA_CHECK
  EstYCoord immediateTempVar move_IASA
  $ifLastOrigin(sspecial,false)
  $ifLastOrigin(sspecialair,true)
    immediateTempVar = 1000
  endif
#endsnippet