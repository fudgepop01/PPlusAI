#snippet SELF_Y_ADJUST
  $ifLastOrigin(uspecialair,false)
  $ifLastOrigin(dspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_Y_ADJUST_INNER}
  endif
#endsnippet

#snippet FASTFALL_CHECK
  $ifLastOrigin(uspecialair,false)
  $ifLastOrigin(dspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {FASTFALL_CHECK_INNER}
  endif
#endsnippet

#snippet SELF_X_ADJUST
  $ifLastOrigin(uspecialair,false)
  $ifLastOrigin(dspecialair,true)
  $ifLastOrigin(sspecialair,true)
  elif True
    {SELF_X_ADJUST_INNER}
  endif
#endsnippet

#snippet UNAFFECTED_Y_MOVES
  $ifLastOrigin(uspecialair,false)
  $ifLastOrigin(dspecialair,true)
  $ifLastOrigin(sspecialair,true)
#endsnippet