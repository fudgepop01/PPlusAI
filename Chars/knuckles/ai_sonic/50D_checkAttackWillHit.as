#snippet SELF_Y_ADJUST
  $ifLastOrigin(nspecialair,false)
  $ifLastOrigin(nspecial,true)
  $ifLastOrigin(sspecialair,true)
  $ifLastOrigin(dspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(nspecialair,false)
  $ifLastOrigin(nspecial,true)
  $ifLastOrigin(sspecialair,true)
  $ifLastOrigin(dspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(nspecialair,false)
  $ifLastOrigin(nspecial,true)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastOrigin(nspecialair,false)
  $ifLastOrigin(nspecial,true)
  $ifLastOrigin(sspecialair,true)
  $ifLastOrigin(dspecialair,true)
#endsnippet