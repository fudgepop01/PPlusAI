#snippet SELF_Y_ADJUST
  $ifLastOrigin(sspecialair,false)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(uspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(sspecialair,false)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(uspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(sspecialair,false)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(sspecial,true)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastOrigin(sspecialair,false)
  $ifLastOrigin(nspecialair,true)
  $ifLastOrigin(uspecialair,true)
#endsnippet