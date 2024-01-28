#snippet SELF_Y_ADJUST
  $ifLastOrigin(dair,false)
  $ifLastOrigin(nspecial,true)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(dair,false)
  $ifLastOrigin(nspecial,true)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(dair,false)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastOrigin(dair,false)
  $ifLastOrigin(nspecial,true)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(sspecialair,true)
#endsnippet